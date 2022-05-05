//
//  GearPosition.swift
//  Exam
//
//  Created by Пазин Даниил on 11.04.2022.
//

import Foundation
import CoreData
import Accessibility

enum GearPosition: Int, CaseIterable, CustomStringConvertible {
    case park
    case reverse
    case neutral
    case drive

    var description: String {
        switch self {
        case .park:
            return "P"
        case .reverse:
            return "R"
        case .neutral:
            return "N"
        case .drive:
            return "D"
        }
    }
}
