//
//  EmojiMemoryGame.swift
//  Memorize-Stanford-CS193p-2023
//
//  Created by Sergey Lukaschuk on 2023-11-04.
//

import SwiftUI

class EmojiMemoryGame {
    private static let emojis = ["🎃", "👻", "😈", "😱", "🧙‍♂️", "🧌", "🧟‍♀️", "🕸️", "🕷️", "🍭", "💀"]

    private var model: MemoryGame<String> = MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
        return emojis[pairIndex]
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
