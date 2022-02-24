//
//  ContentView.swift
//  Bookworm
//
//  Created by Thomas Cowern New on 2/24/22.
//

import SwiftUI

struct PushButton: View {
    
    @StateObject private var dataController = DataController()
    
    let title: String
    @Binding var isOn: Bool
    
    var onColor = [Color.red, Color.yellow]
    var offColor = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColor : offColor, startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: 9)
    }
}

struct ContentView: View {
    
    @State private var rememberMe: Bool = false
    
    var body: some View {
        VStack {
            PushButton(title: "Remember", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
