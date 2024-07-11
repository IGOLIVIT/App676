//
//  AddCategory.swift
//  App676
//
//  Created by IGOR on 08/07/2024.
//

import SwiftUI

struct AddCategory: View {

    @StateObject var viewModel: CategoryViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("New category")
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
                            
                            Text("Category")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addCat.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addCat)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                        
                    }
                }
                
                Button(action: {
                    
                    viewModel.categories.append(viewModel.addCat)
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim")))
                })
                .opacity(viewModel.addCat.isEmpty ? 0.5 : 1)
                .disabled(viewModel.addCat.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddCategory(viewModel: CategoryViewModel())
}
