//
//  HomeView.swift
//  App676
//
//  Created by IGOR on 08/07/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isProfile = true
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Image(viewModel.prPhoto)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding(.horizontal, 6)
                        
                        VStack(alignment: .leading, spacing: 3) {
                            
                            Text(viewModel.name)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .medium))
                            
                            Text("Welcome Back")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 13, weight: .regular))
                        }
                        
                        Spacer()
                    }
                })
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isExpenses = true
                    }
                    
                }, label: {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        HStack {
                            
                            Text("Expenses")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .medium))
                            
                            Image(systemName: "arrow.down.right")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        }
                        
                        HStack {
                            
                            Text("Today")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Text("$ \(viewModel.today)")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        }
                        
                        HStack {
                            
                            Text("During the mounth")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Text("$ \(viewModel.month)")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        }
                        
                        HStack {
                            
                            Text("All the time")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Text("$ \(viewModel.AllTime)")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        }
                        
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 25).fill(Color("bg2")))
                    .padding(.vertical)
                })
                
                Text("Projects")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if viewModel.projects.isEmpty {
                    
                    VStack(spacing: 15) {
                        
                        Image("empty")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60)
                        
                        Text("This section is currently empty. Add your first project")
                            .foregroundColor(.white.opacity(0.3))
                            .font(.system(size: 16, weight: .regular))
                            .frame(width: 250)
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Add a project")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(RoundedRectangle(cornerRadius: 30).stroke(Color("prim")))
                        })
                        
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 25).fill(Color("bg2").opacity(0.5)))
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.projects, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.selectedProject = index
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Image(systemName: index.prIcon ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15, weight: .regular))
                                            .padding(10)
                                            .background(Circle().fill(Color("\(index.prColor ?? "")")))
                                        
                                        Text(index.prName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15, weight: .medium))
                                        
                                        Spacer()
  
                                        Image(systemName: "chevron.right")
                                             .foregroundColor(.white.opacity(0.2))
                                            .font(.system(size: 16, weight: .regular))
                                                                                
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 25).fill(Color("bg2").opacity(0.5)))
                                })

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
                        
                        viewModel.isAdd = true
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
        .onAppear{
            
            viewModel.fetchProjects()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isExpenses ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isExpenses = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isExpenses = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Expenses")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Enter expense information")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Today")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.todayAdd.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.todayAdd)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("During the mounth")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.monthAdd.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.monthAdd)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))

                    ZStack(alignment: .leading, content: {
                        
                        Text("All the time")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.allAdd.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.allAdd)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.today = Int(viewModel.todayAdd) ?? 0
                            viewModel.month = Int(viewModel.monthAdd) ?? 0
                            viewModel.AllTime = Int(viewModel.allAdd) ?? 0
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isExpenses = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.blue)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isExpenses = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                .padding()
                .offset(y: viewModel.isExpenses ? 0 : UIScreen.main.bounds.height)
            }
        )
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            ProjDetail(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddProj(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isProfile, content: {
            
            ProfileView(viewModel: viewModel)
        })
    }
}

#Preview {
    HomeView()
}
