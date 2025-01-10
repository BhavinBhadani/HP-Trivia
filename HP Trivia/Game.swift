//
//  Game.swift
//  HP Trivia
//
//  Created by Bhavin Bhadani on 10/01/25.
//

import Foundation

@MainActor
class Game: ObservableObject {
    
    private var allQuestions: [Question] = []
    private var answeredQuestions: [Int] = []
    
    var filteredQuestions: [Question] = []
    var currentQuestion = Constants.previewQuestion
    var answers: [String] = []
    var correctAnswer: String {
        currentQuestion.answers.first (where: { $0.value == true })!.key
    }
    
    init() {
        decodeQuestions()
    }
    
    func filterQuestions(to books: [Int]) {
        filteredQuestions = allQuestions.filter { books.contains($0.book) }
    }
    
    func newQuestion() {
        if filteredQuestions.isEmpty {
            return
        }
        
        if answeredQuestions.count == filteredQuestions.count {
            answeredQuestions = []
        }
        
        var potentionQuestion = filteredQuestions.randomElement()!
        while answeredQuestions.contains(potentionQuestion.id) {
            potentionQuestion = filteredQuestions.randomElement()!
        }
        currentQuestion = potentionQuestion
        
        answers = []
        answers = currentQuestion.answers.keys.map { $0 }
        answers.shuffle()
    }
    
    func correct() {
        answeredQuestions.append(currentQuestion.id)
        
        // TODO: Update the Score
        
        
    }
    
    private func decodeQuestions() {
        if let url = Bundle.main.url(forResource: "trivia", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let docoder = JSONDecoder()
                allQuestions = try docoder.decode([Question].self, from: data)
                filteredQuestions = allQuestions
            } catch {
                print("Decoding Json Error: \(error)")
            }
        }
    }
    
}
