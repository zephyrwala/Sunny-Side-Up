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
            
            HStack(spacing: 15) {
                Image(systemName: "\(moonSymbol ?? "moonphase.full.moon")")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.mint, Color.black.opacity(0.75))
                    .font(.system(size: 70))
                    .padding(.leading, 60)
                Spacer()
                VStack(alignment: .leading, spacing: 6){
                    Text(moonPhases ?? "moony")
                       
                        .foregroundColor(.white)
                    Text("Moon Phase")
                        .foregroundColor(.gray)
                }
               
                    .padding(.trailing, 60)
            }
            
//            Spacer()
          
            
        }.frame(width: UIScreen.main.bounds.width - 30, height: 120)
//            .background(.black.opacity(0.4))
            .background(.ultraThickMaterial.opacity(0.8))
//            .shadow(color: .black.opacity(0.3), radius: 6)
            .cornerRadius(15)
            .opacity(0.8)
    }
}

struct MoonCard_Previews: PreviewProvider {
    static var previews: some View {
        MoonCard(weatherColorIs: Color.yellow)
    }
}
