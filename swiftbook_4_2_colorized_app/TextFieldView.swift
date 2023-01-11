//
//  TextFieldView.swift
//  swiftbook_4_2_colorized_app
//
//  Created by dobrets on 12.01.2023.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    var action: () -> Void
    
    var body: some View {
        TextField("", text: $text) { _ in
            withAnimation {
                action()
            }
        }
        .textFieldStyle(.roundedBorder)
        .frame(width: 50)
        .multilineTextAlignment(.trailing)
        .keyboardType(.numberPad)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: .constant("128"), action: {})
    }
}
