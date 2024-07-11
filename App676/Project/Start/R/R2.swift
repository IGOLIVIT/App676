//
//  R2.swift
//  App676
//
//  Created by IGOR on 03/07/2024.
//

import SwiftUI

struct R2: View {

    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack {
                
                Text("Track your expenses")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 7)
                
                Text("Add information about transactions")
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .regular))
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    ProfileView(viewModel: HomeViewModel())
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
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
    R2()
}
