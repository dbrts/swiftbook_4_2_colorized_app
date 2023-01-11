//
//  ColorSliderView.swift
//  swiftbook_4_2_colorized_app
//
//  Created by dobrets on 12.01.2023.
//

import SwiftUI

struct ColorSliderView: View {
    
    @Binding var value: Double
    @State private var text = ""
    @State private var alertPresented = false
    
    let color: Color
    
    var body: some View {
        HStack{
            Text("\(Int(value))")
                .frame(width: 40, alignment: .leading)
            
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: value) { newValue in
                    text = newValue.formatted()
                }
            
            TextFieldView(text: $text, action: checkValue)
                .alert("Wrong format", isPresented: $alertPresented, actions: {}) {
                    Text("Enter number between 0 and 255")
                }
        }
        .padding(.bottom, 8)
        .onAppear() {
            text = value.formatted()
        }
    }
    
    private func checkValue() {
        if let value = Int(text), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        alertPresented.toggle()
        value = 0
        text = ""
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(100), color: .red)
    }
}
