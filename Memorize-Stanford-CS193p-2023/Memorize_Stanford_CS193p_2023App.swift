//
//  Memorize_Stanford_CS193p_2023App.swift
//  Memorize-Stanford-CS193p-2023
//
//  Created by Sergey Lukaschuk on 2023-10-18.
//

import SwiftUI

@main
struct Memorize_Stanford_CS193p_2023App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @StateObject var game = EmojiMemoryGame()

    var body: some View {
        EmojiMemoryGameView(viewModel: game)
    }
}
