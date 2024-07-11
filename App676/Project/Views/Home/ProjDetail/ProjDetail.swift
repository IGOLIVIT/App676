//
//  ProjDetail.swift
//  App676
//
//  Created by IGOR on 08/07/2024.
//

import SwiftUI

struct ProjDetail: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedProject?.prName ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                    
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
                }
                .padding(.vertical)
                .padding(.bottom, 25)
                
                if viewModel.cons.isEmpty {
                    
                    VStack(spacing: 17) {
                        
                        Image("sumka")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                        
                        Text("This section is currently empty. Add your first сonsumption")
                            .foregroundColor(.white.opacity(0.3))
                            .frame(width: 250)
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCons = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Add a consumption")
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
                        
                        LazyVStack {
                            
                            ForEach(viewModel.cons, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    Text(index.consCategory ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    HStack {
                                        
                                        Text(index.consComment ?? "")
                                            .foregroundColor(.white.opacity(0.3))
                                            .font(.system(size: 15, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text("$ \(index.consSum ?? "")")
                                            .foregroundColor(.white.opacity(0.3))
                                            .font(.system(size: 15, weight: .regular))

                                    }
                                    
                                    Text(index.consDate ?? "")
                                        .foregroundColor(.white.opacity(0.3))
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    Rectangle()
                                        .fill(.white.opacity(0.1))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 1)
                                        .padding(.bottom, 7)
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
                        
                        viewModel.isAddCons = true
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
        .onAppear {
            
            viewModel.fetchCons()
        }
        .sheet(isPresented: $viewModel.isAddCons, content: {
            
            AddCons(viewModel: viewModel)
        })
    }
}

#Preview {
    ProjDetail(viewModel: HomeViewModel())
}
