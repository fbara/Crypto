//
//  StatisticModel.swift
//  Crypto
//
//  Created by Frank Bara on 10/25/21.
//

import Foundation


struct StatisticModel: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentagChange: Double? = nil) {
        
        self.title = title
        self.value = value
        self.percentageChange = percentagChange
        
    }
    
}
