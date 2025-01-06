//
//  Settings.swift
//  HP Trivia
//
//  Created by Bhavin Bhadani on 06/01/25.
//

import SwiftUI

struct Settings: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            InfoBackgroundView()
            
            VStack {
                Text("Which books would you like to see questions from?")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()

                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ZStack(alignment: .bottomTrailing) {
                            Image(.hp1)
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 7)
                            
                            Image(systemName: "checkmark.circle.fill")
                                .font(.largeTitle)
                                .imageScale(.large)
                                .foregroundStyle(.green)
                                .shadow(radius: 1)
                                .padding(3)
                        }
                        
                        ZStack(alignment: .bottomTrailing) {
                            Image(.hp2)
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 7)
                                .overlay {
                                    Rectangle().opacity(0.3)
                                }
                            
                            Image(systemName: "circle")
                                .font(.largeTitle)
                                .imageScale(.large)
                                .foregroundStyle(.green.opacity(0.5))
                                .shadow(radius: 1)
                                .padding(3)
                        }
                        
                        ZStack {
                            Image(.hp3)
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 7)
                                .overlay {
                                    Rectangle().opacity(0.75)
                                }
                            
                            Image(systemName: "lock.fill")
                                .font(.largeTitle)
                                .imageScale(.large)
                                .shadow(color: .white.opacity(0.75), radius: 3)
                        }

                    }
                    .padding()
                }
                
                Button("Done") {
                    dismiss()
                }
                .doneButton()
            }
        }
    }
}

#Preview {
    Settings()
}
