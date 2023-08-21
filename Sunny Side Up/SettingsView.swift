//
//  SettingsView.swift
//  Sunny Side Up
//
//  Created by Mayur P on 21/08/23.
//

import SwiftUI



struct SettingsView: View {
 
    @AppStorage("temps") var temps: Int?
    @AppStorage("celsu") var celsu: Bool?
    var tempUnits = ["celsius", "fahrenheit"]
    var body: some View {
        List{
            Section {
            
                   
                    Picker("Temperature", selection: $temps) {
                        Text("Celsius").tag(0 as Int?)
                        Text("Fahrenheit").tag(1 as Int?)
                                  
                                   
                               }
                               .pickerStyle(.menu)
                               .onChange(of: temps, perform: { newValue in
                                   
                                   if newValue == 0 {
                                       self.celsu = true
                                   } else {
                                       self.celsu = false
                                   }
                                   
                               })
                                  
                               
                
                
               
            } header: {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .frame(height: 45)

        }
       
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
