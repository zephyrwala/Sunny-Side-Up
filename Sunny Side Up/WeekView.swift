//
//  WeekView.swift
//  Sunny Side Up
//
//  Created by Mayur P on 09/07/23.
//

import SwiftUI
import MapKit

struct WeekView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                .edgesIgnoringSafeArea(.all)
            
            
            LinearGradient(gradient: Gradient(colors: [.yellow, .black]), startPoint: .top, endPoint: .center)
                .opacity(0.9)
                .edgesIgnoringSafeArea(.all)
                .blendMode(.multiply)
        VStack(spacing: 15) {
            Spacer()
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                WeeklyCard()
            }
        }.padding(.bottom, 50)
    }
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
