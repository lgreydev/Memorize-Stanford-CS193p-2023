//
//  MemoryGame.swift
//  Memorize-Stanford-CS193p-2023
//
//  Created by Sergey Lukaschuk on 2023-11-04.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
