//
//  CategoryView.swift
//  App676
//
//  Created by IGOR on 08/07/2024.
//

import SwiftUI

struct CategoryView: View {
    
    @StateObject var viewModel = CategoryViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Category")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)
                
                if viewModel.categories.isEmpty {
                    
                    VStack(spacing: 17) {
                        
                        Image("sumka")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                        
                        Text("This section is currently empty. Add your first category")
                            .foregroundColor(.white.opacity(0.3))
                            .frame(width: 250)
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCat = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Add a category")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(RoundedRectangle(cornerRadius: 30).stroke(Color("prim")))
                        })
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 25.0).fill(.white.opacity(0.05)))
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 19) {
                            
                            ForEach(viewModel.categories, id: \.self) { index in
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Spacer()
                                    }
                                 
                                    Rectangle()
                                        .fill(.white.opacity(0.1))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 1)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddCat = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(Color("bg"))
                        .font(.system(size: 22, weight: .bold))
                        .padding(15)
                        .background(Circle().fill(Color("prim")))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAddCat, content: {
            
            AddCategory(viewModel: viewModel)
        })
    }
}

#Preview {
    CategoryView()
}
