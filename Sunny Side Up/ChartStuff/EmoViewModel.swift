//
//  EmoViewModel.swift
//  Sunny Side Up
//
//  Created by Mayur P on 23/08/23.
//

import Foundation


class EmoViewModel: ObservableObject {
    
    @Published var selectedEmo: String
    
    init(selectedEmo: String) {
        self.selectedEmo = selectedEmo
    }
    
    
    
    
}
