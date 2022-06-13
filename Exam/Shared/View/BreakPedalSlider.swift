//
//  PedalSlider.swift
//  Exam
//
//  Created by Пазин Даниил on 07.03.2022.
//

import SwiftUI

struct BreakPedalSlider<V>: View where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint {
    @State private var yOffset: CGFloat = .zero
    @Binding private var isGearSelectionAvailable: Bool
    private let speedMultiplier: Double = 2
    private let bounds: ClosedRange<V>

    init(in bounds: ClosedRange<V> = 0...1, isGearSelectionAvailable: Binding<Bool>) {
        self.bounds = bounds
        self._isGearSelectionAvailable = isGearSelectionAvailable
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            Capsule()
                .fill(Color.blue)
                .frame(width: 100, height: 400)
            Capsule()
                .fill(Color.green)
                .frame(width: 100, height: -yOffset + 100)
            ZStack() {
                Text("D")
                    .font(.system(size: 60, weight: .heavy, design: .default))
                    .background(
                        Circle()
                            .fill(Color.white)
                            .frame(width: 100, height: 100)
                    )
                Circle()
                    .strokeBorder(Color.black, lineWidth: 10)
                CustomDragView()
                    .onChanged { touch in
                        let superview = touch.view?.superview
                        let translationY = touch.location(in: superview).y - touch.previousLocation(in: superview).y
                        if yOffset <= .zero && translationY > .zero {
                            yOffset = min(0, yOffset + translationY)
                        } else if yOffset >= -300 && translationY < .zero {
                            yOffset = max(-300, yOffset + translationY)
                        }

                        if touch.force > 3 {
                            isGearSelectionAvailable = true
                        }
                    }
                    .onEnded { _ in
                        withAnimation(.default.speed(speedMultiplier)) {
                            yOffset = .zero
                        }
                    }
            }
            .frame(width: 100, height: 100)
            .offset(x: .zero, y: yOffset)
        }
    }
}

struct PedalSlider_Previews: PreviewProvider {
    @State static var isGearSelectionAvailable = true
    static var previews: some View {
        BreakPedalSlider(in: 0...1, isGearSelectionAvailable: $isGearSelectionAvailable)
    }
}
