//
//  WeeklyCard.swift
//  Sunny Side Up
//
//  Created by Mayur P on 08/07/23.
//

import SwiftUI

struct WeeklyCard: View {
    var body: some View {
        HStack(spacing: 66) {
            Text("Monday")
                .foregroundColor(.gray)
           Image(systemName: "cloud.drizzle")
                .foregroundColor(.white)
            HStack(spacing: 21) {
                HStack {
                    Image(systemName: "arrow.up")
                        .foregroundColor(.gray)
                    Text("28°C")
                        .foregroundColor(.yellow)
                }
                
//                    .font(.system(size: 21))
                HStack{
                    Image(systemName: "arrow.down")
                        .foregroundColor(.gray)
                    Text("18°C")
                        .foregroundColor(.gray)
                }
//                    .font(.system(size: 21))
            }
        }.frame(width: UIScreen.main.bounds.width - 30, height: 60)
    }
}

struct WeeklyCard_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyCard()
            .previewLayout(.sizeThatFits)
    }
}
