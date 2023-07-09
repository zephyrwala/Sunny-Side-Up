//
//  ConditionsCard.swift
//  Sunny Side Up
//
//  Created by Mayur P on 08/07/23.
//

import SwiftUI

struct ConditionsCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "wind")
                    .foregroundColor(.yellow)
                Text("72 mph")
                    .foregroundColor(.white)
            }
            
            Text("Wind")
                .foregroundColor(.gray)
        }.frame(width: 170, height: 90)
            .background(.black.opacity(0.4))
            .shadow(color: .black.opacity(0.3), radius: 6)
            .cornerRadius(15)
            .opacity(0.8)
    }
}

struct ConditionsCard_Previews: PreviewProvider {
    static var previews: some View {
        ConditionsCard()
            .previewLayout(.sizeThatFits)
    }
}