//
//  EmojiMemoryGame.swift
//  Memorize-Stanford-CS193p-2023
//
//  Created by Sergey Lukaschuk on 2023-11-04.
//

import SwiftUI

class EmojiMemoryGame {
    private static let emojis = ["🎃", "👻", "😈", "😱", "🧙‍♂️", "🧌", "🧟‍♀️", "🕸️", "🕷️", "🍭", "💀"]

    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 10) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
            
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}


#Preview {
    EmojiMemoryGameView()
}
