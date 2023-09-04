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
            
            HStack{
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
            .foregroundColor(.orange)
            
            
            HStack{
                Button(action:{
                    if cardCount > 1 {
                        cardCount -= 1
                    }
                    
                }, label: {
                    Image(systemName: "rectangle.stack.badge.minus.fill")
                    Text("移除卡片")
                })
                .imageScale(.medium)
                .font(.title2)
                
                Spacer()
                
                Button(action:{
                    if cardCount < emojis.count {
                        cardCount += 1
                    }
                    
                }, label: {
                    Image(systemName: "rectangle.stack.badge.plus.fill")
                    Text("添加卡片")
                })
                .imageScale(.medium)
                .font(.title2)
            }
        }
        .padding()
        
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
