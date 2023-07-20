//
//  MoonCard.swift
//  Sunny Side Up
//
//  Created by Mayur P on 20/07/23.
//

import SwiftUI

struct MoonCard: View {
    var body: some View {
        HStack {
            
            VStack {
                Image(systemName: "moon")
            }
            
        }
    }
}

struct MoonCard_Previews: PreviewProvider {
    static var previews: some View {
        MoonCard()
    }
}
