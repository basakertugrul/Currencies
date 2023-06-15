//
//  Images.swift
//  Currency
//
//  Created by Başak Ertuğrul on 8.06.2023.
//

import SwiftUI

enum Images: String {
    case plus = "plus"
    case pastOperations = "arrow.counterclockwise"
    case sadFace = "sadFace"
    case mainScreen = "house.fill"
    case up = "arrow.up"
    case down = "arrow.down"
    var image: Image {
        switch self {
        case .plus:
            return Image(systemName: self.rawValue)
        case .pastOperations:
            return Image(systemName: self.rawValue)
        case .sadFace:
            return Image(uiImage: UIImage(named: self.rawValue)!)
        case .mainScreen:
            return Image(systemName: self.rawValue)
        case .up:
            return Image(systemName: self.rawValue)
        case .down:
            return Image(systemName: self.rawValue)
        }
    }
}

enum FlagImages: String {
case turkey = "turkey"
case unitedKingdom = "unitedKingdom"
case europe = "europe"
case russia = "russia"
case china = "china"
case usa = "usa"
    var image: Image {
        switch self {
        case .turkey:
            return Image(uiImage: UIImage(named: self.rawValue)!)
        case .unitedKingdom:
            return Image(uiImage: UIImage(named: self.rawValue)!)
        case .europe:
            return Image(uiImage: UIImage(named: self.rawValue)!)
        case .russia:
            return Image(uiImage: UIImage(named: self.rawValue)!)
        case .china:
            return Image(uiImage: UIImage(named: self.rawValue)!)
        case .usa:
            return Image(uiImage: UIImage(named: self.rawValue)!)
        }
    }
}
