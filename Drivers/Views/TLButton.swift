//
//  TLButton.swift
//  Drivers
//
//  Created by Diarmuid on 20/01/2025.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 3)
                    .foregroundColor(background)
                Text(title)
                    .bold()
                    .foregroundColor(.white)
            }
        }
    }
    struct TLButton_Previews: PreviewProvider {
        static var previews: some View {
            TLButton(title: "Value",
                     background: .green){
            }
        }
    }
}

