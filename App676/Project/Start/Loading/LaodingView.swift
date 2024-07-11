//
//  LaodingView.swift
//  App676
//
//  Created by IGOR on 03/07/2024.
//

import SwiftUI

struct LaodingView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("logo1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                ProgressView()
                    .padding(50)
            }
        }
    }
}

#Preview {
    LaodingView()
}
