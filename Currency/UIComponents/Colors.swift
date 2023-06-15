//
//  Colors.swift
//  Currency
//
//  Created by Başak Ertuğrul on 12.06.2023.
//

import SwiftUI

enum Colors: String {
    case black = "Black"
    case green = "Green"
    case gray = "Gray"
    case red = "Red"
    case secondary = "Secondary"
    case blue = "Blue"
    var color: Color {
        switch self {
        case .black:
            return Color(UIColor(named: self.rawValue)!)
        case .green:
            return Color(UIColor(named: self.rawValue)!)
        case .gray:
            return Color(UIColor(named: self.rawValue)!)
        case .red:
            return Color(UIColor(named: self.rawValue)!)
        case .secondary:
            return Color(UIColor(named: self.rawValue)!)
        case .blue:
            return Color(UIColor(named: self.rawValue)!)
        }
    }
    var uiColor: UIColor {
        switch self {
        case .black:
            return UIColor(named: self.rawValue)!
        case .green:
            return UIColor(named: self.rawValue)!
        case .gray:
            return UIColor(named: self.rawValue)!
        case .red:
            return UIColor(named: self.rawValue)!
        case .secondary:
            return UIColor(named: self.rawValue)!
        case .blue:
            return UIColor(named: self.rawValue)!
        }
    }
}
