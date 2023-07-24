//
//  ContentView.swift
//  Sunny Side Up
//
//  Created by Mayur P on 08/07/23.
//

import SwiftUI
import MapKit
import WeatherKit




struct ContentView: View {
    
    
    
    private enum TabbedItems: Int, CaseIterable{
        case home = 0
        case favorite
        case chat
       
        
        var title: String{
            switch self {
            case .home:
                return "Today"
            case .favorite:
                return "10-Days"
            case .chat:
                return "Settings"
            
            }
        }
        
        var iconName: String{
            switch self {
            case .home:
                return "thermometer.sun"
            case .favorite:
                return "calendar"
            case .chat:
                return "gear"
            
            }
        }
    }
   
    @State private var weather: Weather?
    let weatherService = WeatherService.shared
    @State private var weatherTabIcon = "week"
    @State private var weatherColor = Color.yellow
 
    @StateObject private var locationManager = LocationManager()
        @State var selectedTab = 0
        
        var body: some View {
            
            ZStack(alignment: .bottom){
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tag(0)

                    WeekView()
                        .tag(1)

                    MapView()
                        .tag(2)
                    

                       
                }

                ZStack{
                    HStack{
                        ForEach((TabbedItems.allCases), id: \.self){ item in
                            Button{
                                selectedTab = item.rawValue
                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                    impactMed.impactOccurred()
                                
                            } label: {
                                CustomTabItem(systemName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                            }
                        }
                    }
                    .padding(6)
                }
                .frame(height: 72)
                .background(.black.opacity(0.85))
                .cornerRadius(35)
                .padding(.horizontal, 30)
            }.preferredColorScheme(.light)
            
                .task(id: locationManager.currentLocation) {
                    locationManager.checkIfLocationServiceIsEnabled()
                    
                    
                    do {
                        //TODO: - un comment this for actual location
                        if let location = locationManager.currentLocation {
                           
                          //static location 12.97573174471989, 77.60148697323523
                          
                            self.weather = try await weatherService.weather(for: location)
                          
                            if let safeCondition = weather?.currentWeather.condition.description {
                                
                                switch safeCondition {
                                case "Rain":
                                    self.weatherColor = Color.gray
                                    
                                default:
                                    self.weatherColor = Color.orange
                                }
                                
                            }
                            print("weather is \(weather)")
    
                     }
                    }catch {
                        print(error)
                    }
                
                }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//extension UINavigationController {
//    override open func viewDidLoad() {
//        super.viewDidLoad()
////    hidesBarsOnSwipe = true
//    // other customizations
////    navigationBar.tintColor = .yellow
////        navigationBar.barTintColor = .yellow
////        navigationBar.isTranslucent = true
////        navigationBar.backgroundColor = .yellow
// }
//}



extension ContentView{
    func CustomTabItem(systemName: String, title: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
            Image(systemName: systemName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .black : weatherColor)
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
            if isActive{
                Text(title)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(isActive ? .black : weatherColor)
            }
            Spacer()
        }
        .frame(width: isActive ? .infinity : 90, height: 60)
        .background(isActive ? weatherColor.opacity(0.6) : .clear)
        .shadow(color: isActive ? weatherColor : .clear, radius: 10, x: 10.0, y: 10.0)
        
        .cornerRadius(30)
    }
}



extension UITabBarController {
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        tabBar.standardAppearance = appearance
    }
}
