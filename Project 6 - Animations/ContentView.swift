//
//  ContentView.swift
//  Animations
//
//  Created by Luca M on 1/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
            Text("Luca's Apple Card")
                .font(.title)
                .foregroundColor(.black)
                .offset(x: -40)
                .padding()
            Image(systemName: "applelogo")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding()
        }
        .frame(width: 300, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(dragAmount)
        .gesture(
            DragGesture()
                .onChanged { self.dragAmount = $0.translation }
                .onEnded { _ in self.dragAmount = .zero }
        )
        .animation(.spring())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
