//
//  AddProj.swift
//  App676
//
//  Created by IGOR on 08/07/2024.
//

import SwiftUI

struct AddProj: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("New project")
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
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.prName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.prName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                        
                        Text("Icon")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            ForEach(viewModel.icons, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currenticon = index
                                    
                                }, label: {
                                    
                                    Image(systemName: index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(.white.opacity(viewModel.currenticon == index ? 1 : 0)))
                                        .padding(1)
                                })
                            }
                        }
                        
                        Text("Color")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            ForEach(viewModel.colors, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentCoor = index
                                    
                                }, label: {
                                    
                                    Circle()
                                        .fill(Color(index))
                                        .frame(width: 50, height: 50)
                                        .padding(5)
                                        .background(Circle().stroke(.white.opacity(viewModel.currentCoor == index ? 1 : 0)))
                                        .padding(1)
                                        .frame(maxWidth: .infinity)
                                })
                            }
                        }
                    }
                }
                
                Button(action: {
                    
                    viewModel.prIcon = viewModel.currenticon
                    viewModel.prColor = viewModel.currentCoor
                    
                    viewModel.addProject()
                    
                    viewModel.prName = ""
                    viewModel.currenticon = ""
                    viewModel.currentCoor = ""
                    
                    viewModel.fetchProjects()
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim")))
                })
                .opacity(viewModel.prName.isEmpty || viewModel.currenticon.isEmpty || viewModel.currentCoor.isEmpty ? 0.5 : 1)
                .disabled(viewModel.prName.isEmpty || viewModel.currenticon.isEmpty || viewModel.currentCoor.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddProj(viewModel: HomeViewModel())
}
