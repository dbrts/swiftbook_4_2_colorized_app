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
    @FocusState var isInputActive: Bool
    
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
            .focused($isInputActive)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("Done") {
                        isInputActive = false
                    }
                }
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
    @State private var alertPresented = false
    @Binding var sliderValue: Double
    let color: Color
    
    private var sliderTF: Binding<String> {
        Binding(get: {
            String(lround(self.sliderValue))
        }) {
            guard let value = Double($0) else { alertPresented.toggle(); return }
            if value >= 0 && value <= 255 {
                self.sliderValue = value
            } else {
                alertPresented.toggle()
            }
        }
    }
    
    var body: some View {
        HStack{
            Text("\(Int(sliderValue))")
                .frame(width: 40, alignment: .leading)
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(color)
            TextField("\(sliderValue)", text: sliderTF)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .multilineTextAlignment(.trailing)
                .keyboardType(.numberPad)
                .alert("Wrong format", isPresented: $alertPresented, actions: {}) {
                    Text("Enter number between 0 and 255")
                }
        }
        .padding(.bottom, 8)
    }
}
