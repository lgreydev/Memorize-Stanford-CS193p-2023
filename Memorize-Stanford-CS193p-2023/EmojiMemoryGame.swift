//
//  EmojiMemoryGame.swift
//  Memorize-Stanford-CS193p-2023
//
//  Created by Sergey Lukaschuk on 2023-11-04.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🎃", "👻", "😈", "😱", "🧙‍♂️", "🧌", "🧟‍♀️", "🕸️", "🕷️", "🍭", "💀"]

    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 2) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
            
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    var color: Color {
        .orange
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
