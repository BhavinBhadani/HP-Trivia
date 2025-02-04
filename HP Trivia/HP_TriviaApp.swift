//
//  HP_TriviaApp.swift
//  HP Trivia
//
//  Created by Bhavin Bhadani on 02/01/25.
//

import SwiftUI

@main
struct HP_TriviaApp: App {
    @StateObject private var store = Store()
    @StateObject private var game = Game()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
                .environmentObject(game)
                .task {
                    await store.loadPoducts()
                    game.loadScores()
                    store.loadStatus()
                }
        }
    }
}
