//
//  ContentView.swift
//  Memorize-Stanford-CS193p-2023
//
//  Created by Sergey Lukaschuk on 2023-10-18.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🎃", "👻", "🎃", "😈", "😱", "🧙‍♂️", "🧌", "🧟‍♀️", "🕸️", "🕷️", "🍭", "💀"]
    
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAdjustment
        }
        .padding()
    }
    
    var cards: some View {
        HStack {
            ForEach(0..<cardCount, id:\.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundStyle(.orange)
    }
    
    var cardCountAdjustment: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cardRemover: some View {
        Button(action: {
            if  cardCount > 1 {
                cardCount -= 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.fill.badge.minus")
        })
    }
    
    var cardAdder: some View {
        Button(action: {
            if  cardCount < emojis.count {
                cardCount += 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.fill.badge.plus")
        })
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}

