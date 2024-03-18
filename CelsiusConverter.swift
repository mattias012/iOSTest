//
//  CelsiusConverter.swift
//  MA
//
//  Created by Mattias Axelsson on 2024-03-18.
//

import Foundation

class CelsiusConverter {
    
    
    func degreesFahrenheit(degreesCelsius: Int) -> Int {
        
        let tempF = 1.8 * Double(degreesCelsius) + 32
        
        return Int(round(tempF))
    }
    
}
