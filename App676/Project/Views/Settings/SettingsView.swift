//
//  SettingsView.swift
//  App676
//
//  Created by IGOR on 08/07/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("Rate app")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .semibold))
                                
                                Spacer()
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .semibold))
                            }
                            .padding()
                            .frame(height: 60)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2").opacity(0.4)))
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/4b0f29ff-f250-4a11-8c94-7afd1c9b8bcc") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .semibold))
                                
                                Spacer()
                                
                                Image(systemName: "doc.text.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .semibold))
                            }
                            .padding()
                            .frame(height: 60)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2").opacity(0.4)))
                        })
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
