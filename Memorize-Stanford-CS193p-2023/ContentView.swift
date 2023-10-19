//
//  ContentView.swift
//  Memorize-Stanford-CS193p-2023
//
//  Created by Sergey Lukaschuk on 2023-10-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white)
                
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)

                Text("👻")
                    .font(.largeTitle)
            }
            .padding()
            .foregroundStyle(.orange)
    }
}

#Preview {
    ContentView()
}

