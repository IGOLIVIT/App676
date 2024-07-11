//
//  ProfileView.swift
//  App676
//
//  Created by IGOR on 08/07/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Enter your name:")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .regular))
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Menu(content: {
                        
                        ForEach(viewModel.photos, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.prPhoto = index
                                
                            }, label: {
                                
                                Image(index)
                            })
                        }
                        
                    }, label: {
                        
                        if viewModel.prPhoto.isEmpty {
                            
                            Image("eph")
                                .resizable()
                                .frame(width: 100, height: 100)
                            
                        } else {
                            
                            Image(viewModel.prPhoto)
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                        
                    })
                    .padding(.vertical, 50)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Name")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addedName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addedName)
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                    
                }
                
                Button(action: {
                    
                    viewModel.name = viewModel.addedName
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isProfile = false
                        
                    }
                    
                    viewModel.status = true
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim")))
                })
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView(viewModel: HomeViewModel())
}
