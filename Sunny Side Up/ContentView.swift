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
 //we make this our environment object
    @StateObject private var environmentLocationManager = LocationManager()
        @State private var selectedTab = 0
        
        var body: some View {
          
            ZStack(alignment: .bottom){
                
                  LinearGradient(gradient: Gradient(colors: [.pink.opacity(0.8), .blue]), startPoint: .top, endPoint: .center)
  //                                .blendMode(.multiply)
                      .opacity(0.8)
                      .edgesIgnoringSafeArea(.all)
                
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tag(0)
                        .tabItem {
                            Image(systemName: environmentLocationManager.weather?.currentWeather.symbolName ?? "sun")
                                
                            Text("Today")
                        }
                    WeekView()
                        .tag(1)
                        .tabItem {
                            Image(systemName: "calendar")
                            Text("10-Days")
                            
                        }
                            MapView()
                                .tag(2)
                                .tabItem {
                                    Image(systemName: "gear")
                                    Text("Settings")
                                    
                                    
                                    
                                }
                            
                            //
                            //                ZStack{
                            //                    HStack{
                            //                        ForEach((TabbedItems.allCases), id: \.self){ item in
                            //                            Button{
                            //                                selectedTab = item.rawValue
                            //                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                            //                                    impactMed.impactOccurred()
                            //
                            //                            } label: {
                            //                                CustomTabItem(systemName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                            //                            }
                            //                        }
                            //                    }
                            //                    .padding(6)
                            //                }
                            //                .frame(height: 72)
                            //                //tab bar backgrond blur
                            //                .background(.black.opacity(0.75))
                            //
                            //                .cornerRadius(35)
                            //                .padding(.horizontal, 30)
                        }.accentColor(Color.yellow)
                
                    .environmentObject(environmentLocationManager)
                    
                        }.preferredColorScheme(.dark)
                
            
              
//                .task(id: environmentLocationManager.currentLocation) {
//
////                    locationManager.showManualLocation = false
//
//                    do {
//                        //TODO: - un comment this for actual location
//                        if let location = environmentLocationManager.currentLocation {
//
//                          //static location 12.97573174471989, 77.60148697323523
//
//                            self.weather = try await weatherService.weather(for: location)
//
//                            environmentLocationManager.weather = self.weather
//                            if let safeCondition = weather?.currentWeather.condition.description {
//
//                                switch safeCondition {
//                                case "Rain":
//                                    self.weatherColor = Color.gray
//
//                                default:
//                                    self.weatherColor = Color.yellow
//                                }
//
//                            }
//                            print("weather is \(weather)")
//
//                     }
//                    }catch {
//                        print(error)
//                    }
//
//                }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LocationManager())
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


//
//extension ContentView{
//    func CustomTabItem(systemName: String, title: String, isActive: Bool) -> some View{
//        HStack(spacing: 10){
//            Spacer()
//            Image(systemName: systemName)
//                .resizable()
//                .renderingMode(.template)
//                .foregroundColor(isActive ? .black : weatherColor)
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 24, height: 24)
//            if isActive{
//                Text(title)
//                    .font(.system(size: 14))
//                    .fontWeight(.medium)
//                    .foregroundColor(isActive ? .black : weatherColor)
//            }
//            Spacer()
//        }
//        .frame(width: isActive ? .infinity : 90, height: 60)
//        .background(isActive ? weatherColor.opacity(0.6) : .clear)
//        .shadow(color: isActive ? weatherColor : .clear, radius: 10, x: 3.0, y: 10.0)
//
//        .cornerRadius(30)
//    }
//}



extension UITabBarController {
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .black
        appearance.configureWithDefaultBackground()
        tabBar.standardAppearance = appearance
    }
}
