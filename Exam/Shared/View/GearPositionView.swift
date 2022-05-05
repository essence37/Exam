//
//  GearPositionView.swift
//  Exam
//
//  Created by Пазин Даниил on 20.04.2022.
//

import SwiftUI

struct GearPositionView: View {

    private let gearPosition: GearPosition

    init(gearPosition: GearPosition) {
        self.gearPosition = gearPosition
    }

    var body: some View {
        Button {
            print("\(gearPosition.description) selected.")
        } label: {
            ZStack {
                Circle()
                    .strokeBorder(Color.yellow, lineWidth: 10)
                    .background(Circle().fill(.green))
                    .frame(width: 100, height: 100)
                Text(gearPosition.description)
                    .font(.system(size: 60, weight: .heavy))
            }
        }
    }
}

struct GearPositionView_Previews: PreviewProvider {
    static var previews: some View {
        GearPositionView(gearPosition: .drive)
            .previewLayout(.sizeThatFits)
    }
}
