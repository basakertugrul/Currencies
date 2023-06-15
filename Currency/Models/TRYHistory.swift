//
//  TRYHistory.swift
//  Currency
//
//  Created by Başak Ertuğrul on 14.06.2023.
//

import Foundation
import SwiftUI

class TRYHistory: Codable {
    let data: [String: TRYHistoryData]
    var isIncreased: Bool {
        return self.data[Date().getPreviousDateString()]!.dataTRY > self.data[Date().getTwoDaysBeforeDateString()]!.dataTRY
    }
    func getStringofValue() -> String {
        let string: String = self.data[Date().getPreviousDateString()]!.dataTRY.liraString
        return string
    }
    func getImageofValue() -> Image {
        switch self.isIncreased {
        case true:
            return Images.up.image
        case false:
            return Images.down.image
        }
    }
    func getColorofValue() -> Color {
        switch self.isIncreased {
        case true:
            return Colors.green.color
        case false:
            return Colors.red.color
        }
    }
}

class TRYHistoryData: Codable {
    let dataTRY: Double
    enum CodingKeys: String, CodingKey {
        case dataTRY = "TRY"
    }
}
