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
        ZStack{
            Color(.lightGray)
                .ignoresSafeArea()
                .onTapGesture {
                    isInputActive = false
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
                    ColorSliderView(value: $greenSliderValue, color: .green)
                    ColorSliderView(value: $blueSliderValue, color: .blue)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


