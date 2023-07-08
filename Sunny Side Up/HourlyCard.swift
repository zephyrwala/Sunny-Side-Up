//
//  HourlyCard.swift
//  Sunny Side Up
//
//  Created by Mayur P on 08/07/23.
//

import SwiftUI

struct HourlyCard: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("10AM")
                .font(.system(size: 10))
                .foregroundColor(.gray)
            Image(systemName: "cloud")
                .foregroundColor(.white)
            Text("23°")
                .font(.system(size: 13))
                .foregroundColor(.yellow)
        }.frame(width: 80, height: 90)
            .background(.black.opacity(0.4))
            .shadow(color: .black.opacity(0.3), radius: 6)
            .cornerRadius(10)
            .opacity(0.8)
    }
}

struct HourlyCard_Previews: PreviewProvider {
    static var previews: some View {
        HourlyCard()
            .previewLayout(.sizeThatFits)
    }
}
