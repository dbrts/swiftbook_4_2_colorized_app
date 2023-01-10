//
//  ContentView.swift
//  swiftbook_4_2_colorized_app
//
//  Created by dobrets on 11.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = 120.0
    @State private var greenSliderValue = 120.0
    @State private var blueSliderValue = 120.0
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 150)
                .foregroundColor(
                    Color(
                        red: redSliderValue / 255,
                        green: greenSliderValue / 255,
                        blue: blueSliderValue / 255
                    )
                )
                .padding(.bottom, 16)
            
            VStack {
                ColorSliderView(sliderValue: $redSliderValue, color: .red)
                ColorSliderView(sliderValue: $greenSliderValue, color: .green)
                ColorSliderView(sliderValue: $blueSliderValue, color: .blue)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    @Binding var sliderValue: Double
    let color: Color
    
    private var sliderTF: Binding<String> {
            Binding(get: {
                String(lround(self.sliderValue))
            }) {
                self.sliderValue = Double($0) ?? 0
            }
        }
    
    var body: some View {
        HStack{
            Text("\(Int(sliderValue))")
                .frame(width: 40)
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(color)
            TextField("\(sliderValue)", text: sliderTF)
                .frame(width: 40)
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 1)
                        .foregroundColor(.gray)
                )
        }
        .padding(.bottom, 8)
    }
}
