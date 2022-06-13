//
//  UITouch+Extension.swift
//  Exam
//
//  Created by Пазин Даниил on 08.06.2022.
//

import UIKit
import SwiftUI

extension UITouch {
    func angle() -> Angle? {
        guard let view = view else { return nil }
        let location = location(in: view)
        let previousLocation = previousLocation(in: view)
//        return [location, previousLocation]
//            .map { location -> Angle in
//                let centerOffset = CGPoint(x: location.x - view.bounds.midX, y: location.y - view.bounds.midY)
                let centerOffset = CGPoint(x: location.x - view.bounds.midX, y: location.y - view.bounds.midY)
                return Angle(radians: atan2(centerOffset.y, centerOffset.x))
//            }
//            .reduce(.zero) { partialResult, angle in
//                -partialResult - angle
//            }
    }
}
