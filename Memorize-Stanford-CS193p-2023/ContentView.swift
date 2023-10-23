//
//  ContentView.swift
//  Memorize-Stanford-CS193p-2023
//
//  Created by Sergey Lukaschuk on 2023-10-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundStyle(.orange)
    }
}

struct CardView: View {
    var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                base
            }
        }
    }
}

#Preview {
    ContentView()
}

