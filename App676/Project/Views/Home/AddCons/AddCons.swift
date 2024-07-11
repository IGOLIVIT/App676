//
//  AddCons.swift
//  App676
//
//  Created by IGOR on 08/07/2024.
//

import SwiftUI

struct AddCons: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Expense")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .regular))
                    .padding(.vertical)
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Back")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        }
                    })
                    
                    Spacer()
                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Sum")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.consSum.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.consSum)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Date")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.consDate.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.consDate)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                        
                        HStack {
                            
                            Text("Category")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            Menu(content: {
                                
                                ForEach(viewModel.categories, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedCategory = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                    })
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(viewModel.selectedCategory)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(Color("bg"))
                                        .font(.system(size: 10, weight: .regular))
                                        .padding(4)
                                        .background(Circle().fill(Color("prim")))
                                }
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Comment")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.consComment.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.consComment)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                        
                    }
                }
                
                Button(action: {
                    
                    viewModel.consProject = viewModel.selectedProject?.prName ?? ""
                    viewModel.consCategory = viewModel.selectedCategory
                    
                    viewModel.addCons()
                    
                    viewModel.consSum = ""
                    viewModel.consDate = ""
                    viewModel.selectedCategory = ""
                    viewModel.consComment = ""
                    
                    viewModel.fetchCons()
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Ok")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim")))
                })
                .opacity(viewModel.consSum.isEmpty || viewModel.consDate.isEmpty || viewModel.selectedCategory.isEmpty || viewModel.consComment.isEmpty ? 0.5 : 1)
                .disabled(viewModel.consSum.isEmpty || viewModel.consDate.isEmpty || viewModel.selectedCategory.isEmpty || viewModel.consComment.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddCons(viewModel: HomeViewModel())
}
