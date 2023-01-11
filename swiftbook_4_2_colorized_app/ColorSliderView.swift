//
//  ColorSliderView.swift
//  swiftbook_4_2_colorized_app
//
//  Created by dobrets on 12.01.2023.
//

import SwiftUI

struct ColorSliderView: View {
    @State private var alertPresented = false
    @Binding var value: Double
    let color: Color
    
    private var sliderTF: Binding<String> {
        Binding(get: {
            String(lround(self.value))
        }) {
            guard let value = Double($0) else { alertPresented.toggle(); return }
            if value >= 0 && value <= 255 {
                self.value = value
            } else {
                alertPresented.toggle()
            }
        }
    }
    
    var body: some View {
        HStack{
            Text("\(Int(value))")
                .frame(width: 40, alignment: .leading)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
            TextField("\(value)", text: sliderTF)
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

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(100), color: .red)
    }
}
