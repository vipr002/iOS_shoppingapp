//
//  UIColor+Hex.swift
//  nettbutikk-styling
//
//  Created by Victoria Prigel on 27/09/2024.
//

import Foundation
import SwiftUI

extension UIColor {
    
    convenience init(hex: String) {
        
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        let scanner = Scanner(string: hexSanitized)
        let isValid = scanner.scanHexInt64(&rgb)
        
        // Hvis fargen er ugyldig, returner en standard farge (f.eks. hvit)
        if !isValid {
            self.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) // Hvit som fallback
            return
        }
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
