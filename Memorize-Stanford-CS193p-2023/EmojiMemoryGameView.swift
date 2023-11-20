//
//  EmojiMemoryGameView.swift
//  Memorize-Stanford-CS193p-2023
//
//  Created by Sergey Lukaschuk on 2023-10-18.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        VStack {
            cards.animation(.default, value: viewModel.cards)
        
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        GeometryReader { geometry in
            
            let gridItemSize = gridItemWidthThatFits(
                count: viewModel.cards.count,
                size: geometry.size,
                arAspectRatio: 2/3)
            
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0) {
                ForEach(viewModel.cards) { card in
                    CardView(card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundStyle(.orange)
    }
    
    func gridItemWidthThatFits(
        count: Int,
        size: CGSize,
        arAspectRatio aspectRatio: CGFloat) -> CGFloat {
            let count = CGFloat(count)
            var columnCount = 1.0
            
            repeat {
                let width = size.width / columnCount
                let hight = width / aspectRatio
        
                let rowCount = (count / columnCount).rounded(.up)
                if rowCount * hight < size.height {
                    return (size.width / columnCount).rounded(.down)
                }
                columnCount += 1
            } while columnCount < count
            return min(size.width / count, size.height * aspectRatio).rounded(.down)
        }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
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

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

