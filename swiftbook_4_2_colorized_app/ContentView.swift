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
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        ZStack{
            Color(.lightGray)
                .ignoresSafeArea()
                .onTapGesture {
                    focusedField = nil
                }
            
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
                    ColorSliderView(value: $redSliderValue, color: .red)
                        .focused($focusedField, equals: .red)
                    ColorSliderView(value: $greenSliderValue, color: .green)
                        .focused($focusedField, equals: .green)
                    ColorSliderView(value: $blueSliderValue, color: .blue)
                        .focused($focusedField, equals: .blue)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button(action: previousField) {
                            Image(systemName: "chevron.up")
                        }
                        Button(action: nextField) {
                            Image(systemName: "chevron.down")
                        }
                        
                        Spacer()

                        Button("Done") {
                            focusedField = nil
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - Multi Focus Logic
extension ContentView {
    private enum Field {
        case red, green, blue
    }
    
    private func nextField() {
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        case .blue:
            focusedField = .red
        case .none:
            focusedField = nil
        }
    }
    
    private func previousField() {
        switch focusedField {
        case .red:
            focusedField = .blue
        case .green:
            focusedField = .red
        case .blue:
            focusedField = .green
        case .none:
            focusedField = nil
        }
    }
}
