//
//  Instructions.swift
//  HP Trivia
//
//  Created by Bhavin Bhadani on 05/01/25.
//

import SwiftUI

struct Instructions: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            InfoBackgroundView()
            
            VStack {
                Image(.appiconwithradius)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .padding(.top)
                
                ScrollView {
                    Text("How To Play")
                        .font(.largeTitle)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Welcome to HP Trivia! In this game, you will asked random question from the HP books and you must guess the right answer or you will lose points!😱")
                            .padding([.horizontal, .bottom])
                        
                        Text("Each question is worth 5 points, but if you guess a wrong answer, you lose 1 point")
                            .padding([.horizontal, .bottom])

                        Text("If you are struggling with question, there is an option to reveal a hint or reveal the book that answers the question. But beware! Using this also minuses 1 point each.")
                            .padding([.horizontal, .bottom])
                        
                        Text("When you select the correct answer, you'll awarded all points left the for the question and the will added to your total score.")
                            .padding(.horizontal)
                    }
                    .font(.title3)

                    Text("Good Luck!")
                        .font(.title)
                        .padding()
                }
                .foregroundStyle(Color.black)
                
                Button("Done") {
                    dismiss()
                }
                .doneButton()
            }
        }
    }
}

#Preview {
    Instructions()
}
