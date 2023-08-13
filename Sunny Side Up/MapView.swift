//
//  MapView.swift
//  Sunny Side Up
//
//  Created by Mayur P on 09/07/23.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .foregroundColor(.blue)
                .padding(.top, 200)
                Spacer()
                
        }.edgesIgnoringSafeArea(.all)
            .background(.clear)
            
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
