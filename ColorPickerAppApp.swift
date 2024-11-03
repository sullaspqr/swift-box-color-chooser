//
//  ColorPickerAppApp.swift
//  ColorPickerApp
//
//  Created by Németh Bence on 2024. 11. 03..
//

import SwiftUI

@main
struct ColorPickerAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
struct ContentView: View {
    var body: some View {
        ColorPickerApp()  // Meghívjuk a ColorPickerApp nézetet
    }
}
struct ColorPickerApp: View {
    @State private var selectedColor: Color = .white
    
    // A rendelkezésre álló színek
    private let colors: [Color] = [.red, .green, .blue, .yellow, .pink]
    
    var body: some View {
        VStack {
            Text("Color Picker")
                .font(.headline)
                .padding()
            
            // Színválasztó gombok
            ColorSelector(colors: colors, onSelect: { color in
                selectedColor = color
            })
            
            // Szín megjelenítő doboz
            ColorBox(color: selectedColor)
        }
    }
}

// Színválasztó komponens
struct ColorSelector: View {
    let colors: [Color]
    let onSelect: (Color) -> Void
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Button(action: {
                    onSelect(color)
                }) {
                    Circle()
                        .fill(color)
                        .frame(width: 40, height: 40)
                        .padding(5)
                }
            }
        }
        .padding()
    }
}

// Szín megjelenítő doboz komponens
struct ColorBox: View {
    let color: Color
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: 200, height: 200)
            .cornerRadius(10)
            .overlay(
                Text("Selected Color")
                    .foregroundColor(.white)
                    .bold()
                    .shadow(radius: 5)
            )
            .padding()
    }
}

// A SwiftUI előnézete a fejlesztés során
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerApp()
    }
}
