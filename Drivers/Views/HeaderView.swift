//
//  HeaderView.swift
//  Drivers
//
//  Created by Diarmuid on 18/01/2025.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 3)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
                .ignoresSafeArea(.all)
                
            VStack {
                Text(title)
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                
                Text(subtitle)
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 250)
        .offset(y: -60)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "title",
                   subtitle: "subtitle",
                   angle: 15,
                   background: .red)
    }
}
