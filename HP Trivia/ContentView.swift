//
//  ContentView.swift
//  HP Trivia
//
//  Created by Bhavin Bhadani on 02/01/25.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer!
    @State private var scalePlayButton = false
    @State private var moveBackgroundImage = false

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(.hogwarts)
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height)
                    .padding(.top, 3)
                    .offset(x: moveBackgroundImage ? geo.size.width/1.1 : -geo.size.width/1.1)
                    .onAppear {
                        withAnimation(.linear(duration: 60).repeatForever()) {
                            moveBackgroundImage.toggle()
                        }
                    }
                
                VStack {
                    VStack {
                        Image(systemName: "bolt.fill")
                            .font(.largeTitle)
                            .imageScale(.large)
                        
                        Text("HP")
                            .font(.custom(Constants.hpFont, size: 70))
                            .padding(.bottom, -50)

                        Text("Trivia")
                            .font(.custom(Constants.hpFont, size: 60))
                    }
                    .padding(.top, 70)
                    
                    Spacer()

                    VStack {
                        Text("Recent Scores")
                            .font(.title2)
                        
                        Text("33")
                        
                        Text("27")

                        Text("18")
                    }
                    .font(.title3)
                    .padding(.horizontal)
                    .foregroundStyle(Color.white)
                    .background(Color.black.opacity(0.7))
                    .clipShape(.rect(cornerRadius: 16))
                    
                    Spacer()

                    HStack {
                        Spacer()

                        Button {
                            
                        } label: {
                            Image(systemName: "info.circle.fill")
                                .font(.largeTitle)
                                .foregroundStyle(Color.white)
                                .clipShape(.rect(cornerRadius: 5))
                        }
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("Play")
                                .font(.largeTitle)
                                .foregroundStyle(Color.white)
                                .padding(.vertical, 7)
                                .padding(.horizontal, 50)
                                .background(Color.brown)
                                .clipShape(.rect(cornerRadius: 8))
                                .shadow(radius: 5)
                        }
                        .scaleEffect(scalePlayButton ? 1.2 : 1)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.3).repeatForever()) {
                                scalePlayButton.toggle()
                            }
                        }
                        
                        Spacer()

                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .font(.largeTitle)
                                .foregroundStyle(Color.white)
                                .shadow(radius: 5)
                        }
                        
                        Spacer()
                    }
                    .frame(width: geo.size.width)
                    
                    Spacer()
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .onAppear {
            //playAudio()
        }
    }
    
    private func playAudio() {
        let sound = Bundle.main.path(forResource: "magic-in-the-air", ofType: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        audioPlayer.numberOfLoops = -1
        audioPlayer.play()
    }
}

#Preview {
    ContentView()
}
