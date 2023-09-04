//
//  ContentView.swift
//  Memorize
//
//  Created by sillyaboy on 2023/9/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}
struct CardView: View {
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            var base = Circle()
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("🥳").font(.largeTitle)
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
