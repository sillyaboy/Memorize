//
//  ContentView.swift
//  Memorize
//
//  Created by sillyaboy on 2023/9/4.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["😈","🤠","🎃","👻","🤠","🎃","👻","🤠","🎃","👻","🤠","🎃","👻"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAjusters
        }
        .padding()
    }
    
    
    var cardCountAjusters: some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
    }
    
    var cards: some View {
        HStack{
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjuster (by offset: Int, symbol: String) -> some View {
        Button(action:{
                cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 2)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
