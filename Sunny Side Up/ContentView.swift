//
//  ContentView.swift
//  Sunny Side Up
//
//  Created by Mayur P on 08/07/23.
//

import SwiftUI
import MapKit


enum TabbedItems: Int, CaseIterable{
    case home = 0
    case favorite
    case chat
   
    
    var title: String{
        switch self {
        case .home:
            return "Today"
        case .favorite:
            return "Weekly"
        case .chat:
            return "Settings"
        
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "week"
        case .favorite:
            return "week"
        case .chat:
            return "week"
        
        }
    }
}

struct ContentView: View {
    
   
    
 
        
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
                                
                            } label: {
                                CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                            }
                        }
                    }
                    .padding(6)
                }
                .frame(height: 72)
                .background(.black.opacity(0.85))
                .cornerRadius(35)
                .padding(.horizontal, 30)
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
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .black : .yellow)
                .frame(width: 20, height: 20)
            if isActive{
                Text(title)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(isActive ? .black : .yellow)
            }
            Spacer()
        }
        .frame(width: isActive ? .infinity : 90, height: 60)
        .background(isActive ? .yellow.opacity(0.75) : .clear)
        .shadow(color: isActive ? .yellow : .clear, radius: 10, x: 10.0, y: 10.0)
        
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
