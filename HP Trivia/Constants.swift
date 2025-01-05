//
//  Constants.swift
//  HP Trivia
//
//  Created by Bhavin Bhadani on 02/01/25.
//

import Foundation
import SwiftUI

enum Constants {
    static let hpFont = "PartyLetPlain"
}

struct InfoBackgroundView: View {
    var body: some View {
        Image(.parchment)
            .resizable()
            .ignoresSafeArea()
            .background(Color.brown)
    }
}

extension Button {
    func doneButton() -> some View {
        self
            .font(.largeTitle)
            .buttonStyle(.borderedProminent)
            .tint(.brown)
            .foregroundStyle(Color.white)
    }
}
