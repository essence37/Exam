//
//  PedalsView.swift
//  Exam
//
//  Created by Пазин Даниил on 07.05.2022.
//

import SwiftUI

struct PedalsView: View {
    @State private var isGearSelectionAvailable = false

    var body: some View {
        HStack(spacing: 40) {
            ZStack(alignment: .top) {
                GearPositionsView(isGearSelectionAvailable: $isGearSelectionAvailable, radius: 150)
                BreakPedalSlider<Double>(isGearSelectionAvailable: $isGearSelectionAvailable)
            }
            GasPedalSlider<Double>()
        }
    }
}

struct PedalsView_Previews: PreviewProvider {
    static var previews: some View {
        PedalsView()
            .previewInterfaceOrientation(.portrait)
    }
}
