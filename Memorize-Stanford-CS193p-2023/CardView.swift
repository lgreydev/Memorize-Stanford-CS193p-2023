//
//  CardView.swift
//  Memorize-Stanford-CS193p-2023
//
//  Created by Serhii Lukashchuk on 2024-01-18.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0: 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    typealias Card = CardView.Card
    
    static var previews: some View {
        CardView(MemoryGame<String>.Card(content: "X", id: "test1"))
            .padding()
            .foregroundStyle(Color.green)
    }
}
