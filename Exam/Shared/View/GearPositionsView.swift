//
//  GearPositionsView.swift
//  Exam
//
//  Created by Пазин Даниил on 11.04.2022.
//

import SwiftUI

struct GearPositionsView: View {
    @Binding var isGearSelectionAvailable: Bool
    let radius: CGFloat

    var body: some View {
        ZStack {
            ForEach(GearPosition.allCases, id: \.rawValue) { gearPosition in
                drawGearPosition(gearPosition: gearPosition)
            }
        }
    }

    private func drawGearPosition(gearPosition: GearPosition) -> some View {
        let angle: CGFloat = .pi / 4 * CGFloat(gearPosition.rawValue) - .pi
        let offset = CGSize(width: cos(angle) * radius, height: sin(angle) * radius)
        return GearPositionView(gearPosition: gearPosition, isGearSelectionAvailable: $isGearSelectionAvailable)
            .offset(offset)
            .scaleEffect(isGearSelectionAvailable ? 1 : 0.01)
    }
}

struct GearPositionsView_Previews: PreviewProvider {
    @State static var isGearSelectionAvailable = true
    static var previews: some View {
        GearPositionsView(isGearSelectionAvailable: $isGearSelectionAvailable, radius: 150)
    }
}
