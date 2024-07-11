//
//  R1.swift
//  App676
//
//  Created by IGOR on 03/07/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack {
                
                Text("Control your finances")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 7)
                
                Text("Ability to create multiple projects")
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .regular))
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    R2()
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
    R1()
}
