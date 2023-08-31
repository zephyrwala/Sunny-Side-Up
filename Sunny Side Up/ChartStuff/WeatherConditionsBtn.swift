//
//  WeatherConditionsBtn.swift
//  Sunny Side Up
//
//  Created by Mayur P on 19/08/23.
//

import SwiftUI

struct ConditionItems: Identifiable {
    
    
    let condition: String
    let icon: String
    let id: Int
}

struct WeatherConditionsBtn: View {

    
    @State private var selectedTheme = "Dark"
    let themes = ["Humidity", "Rain", "UV Index", "Wind"]
    var weatherConditions: [ConditionItems]
    @Binding var selectedStuff : Int
    @State private var selected = false
    @Binding var showHumidty: Bool
    
    var body: some View {
        
        
       
        ForEach(weatherConditions) { condition in
            Button {
                print("This is working")
                self.selected.toggle()
                self.selectedStuff = condition.id
                if condition.id == 1 {
                   
                        
                        showHumidty = true
                  
                   
                } else if condition.id == 0 {
                    showHumidty = false
                }
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
            } label: {
                HStack{
                    Image(systemName: condition.icon)
                        .foregroundColor(self.selectedStuff == condition.id ? .mint : .white)
                        .font(.system(.caption))

                    Text(self.selectedStuff == condition.id ? condition.condition : "")
                        .font(.system(.caption))
                        .foregroundColor(self.selectedStuff == condition.id ? .primary.opacity(0.9) : .gray)
                }.frame(width: self.selectedStuff == condition.id ? 95 : 45, height: 30)

                    .background(.ultraThickMaterial.opacity(0.99))
//                    .background(self.selectedStuff == condition.id ? .yellow: .black)  // <-- Here
//                    .background(selected ? Color.black : Color.yellow )
//
//                    .shadow(color: .yellow.opacity(0.9), radius: 21)
                    .cornerRadius(10)
//                    .overlay( /// apply a rounded border
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(self.selectedStuff == condition.id ? .yellow.opacity(0.6) : .black, lineWidth:  self.selectedStuff == condition.id ? 1 : 0)
//                    )

                    .opacity(self.selectedStuff == condition.id ? 0.99 : 0.6)
            }        }
     
        .onAppear{
            
            self.selected.toggle()
            self.selectedStuff = 0
        }
        
        //NOTE: - THis works
        
//        Menu {
//
//            Button("Humidity") {
//                print("ok")
//            }
//            Button("UVIndex") {
//                print("ok")
//            }
//               } label: {
//                   Label("Rain", systemImage: "paperplane")
//                       .background(.ultraThinMaterial)
//               }


      

//
//        Picker("Appearance", selection: $selectedTheme) {
//            ForEach(themes, id: \.self) { i in
//
//                HStack {
//
//                    Image(systemName: "cloud.fill")
//
//                    Text(i)
//                        .font(.system(size: 9))
//                        .foregroundColor(.white)
//
//                }
//
//
//
//            }
//
//        }
//        .accentColor(.orange)
//        .tint(.yellow)
//        .pickerStyle(.automatic)
//        .background(.ultraThickMaterial)
//        .foregroundColor(.yellow)
//
//        .opacity(0.96)
//
       
            
    }
}

//struct WeatherConditionsBtn_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherConditionsBtn(weatherConditions: [ConditionItems(condition: "rain", icon: "cloud.rain", id: 1)], showHumidty: <#Binding<Bool>#>)
//            .previewLayout(.sizeThatFits)
//            //    }
//    }
//}
