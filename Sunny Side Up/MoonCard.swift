//
//  MoonCard.swift
//  Sunny Side Up
//
//  Created by Mayur P on 20/07/23.
//

import SwiftUI
import WeatherKit

struct MoonCard: View {
    var moonPhases: String?
    var moonSymbol: String?
    var moonRise: String?
    var moonSet: String?
    var weatherColorIs: Color
    var body: some View {
        HStack(spacing: 5) {
            
            VStack(spacing: 15) {
                Image(systemName: "\(moonSymbol ?? "moonphase.full.moon")")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color.black.opacity(0.6), weatherColorIs)
                    .font(.system(size: 50))
                
                Text(moonPhases ?? "moony")
                    .font(.caption)
                    .foregroundColor(.gray)
            }.padding(.leading, 50)
            
            Spacer()
            
            VStack(spacing: 15) {
                HStack(spacing: 10) {
                    Image(systemName: "moon.fill")
                        .foregroundColor(.white.opacity(0.6))
                    Text("Moon Rise - ")
                        .font(.caption)
                    .foregroundColor(.gray)
                    
                    + Text("\(moonRise ?? "")")
                        .font(.caption)
                    .foregroundColor(weatherColorIs)
                }
                HStack(spacing: 10) {
                    Image(systemName: "moon")
                        .foregroundColor(.gray.opacity(0.6))
                    Text("Moon Set - ")
                        .font(.caption)
                    .foregroundColor(.gray)
                    
                    + Text("\(moonSet ?? "")")
                        .font(.caption)
                    .foregroundColor(weatherColorIs)
                }
            }.padding(.trailing, 50)
            
        }.frame(width: UIScreen.main.bounds.width - 30, height: 120)
//            .background(.black.opacity(0.4))
            .background(.ultraThickMaterial.opacity(0.8))
//            .shadow(color: .black.opacity(0.3), radius: 6)
            .cornerRadius(15)
    }
}

struct MoonCard_Previews: PreviewProvider {
    static var previews: some View {
        MoonCard(weatherColorIs: Color.yellow)
    }
}
