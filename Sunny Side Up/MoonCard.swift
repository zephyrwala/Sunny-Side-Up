//
//  MoonCard.swift
//  Sunny Side Up
//
//  Created by Mayur P on 20/07/23.
//

import SwiftUI

struct MoonCard: View {
    var body: some View {
        HStack(spacing: 10) {
            
            VStack(spacing: 15) {
                Image(systemName: "moonphase.waxing.gibbous")
                    .foregroundColor(.yellow)
                    .font(.system(size: 50))
                
                Text("Waxing Gibbous")
                    .font(.caption)
                    .foregroundColor(.gray)
            }.padding(.leading, 50)
            
            Spacer()
            
            VStack(spacing: 15) {
                HStack(spacing: 10) {
                    Image(systemName: "moon.fill")
                        .foregroundColor(.white.opacity(0.6))
                    Text("Moon Rise - 7:08 PM")
                        .font(.caption)
                    .foregroundColor(.gray)
                }
                HStack(spacing: 10) {
                    Image(systemName: "moon")
                        .foregroundColor(.gray.opacity(0.6))
                    Text("Moon Set - 7:08 PM")
                        .foregroundColor(.gray)
                    .font(.caption)
                }
            }.padding(.trailing, 50)
            
        }.frame(width: UIScreen.main.bounds.width - 20, height: 120)
            .background(.black.opacity(0.4))
            .shadow(color: .black.opacity(0.3), radius: 6)
            .cornerRadius(15)
    }
}

struct MoonCard_Previews: PreviewProvider {
    static var previews: some View {
        MoonCard()
    }
}
