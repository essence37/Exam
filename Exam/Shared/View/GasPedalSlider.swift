//
//  GasPedalSlider.swift
//  Exam
//
//  Created by Пазин Даниил on 01.05.2022.
//

import SwiftUI

struct GasPedalSlider<V>: View where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint {
    @State private var yOffset: CGFloat = .zero
    private let speedMultiplier: Double = 2
    private let bounds: ClosedRange<V>

    init(in bounds: ClosedRange<V> = 0...1) {
        self.bounds = bounds
    }

    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { gesture in
                yOffset = gesture.translation.height
            }
            .onEnded { _ in
                withAnimation(.default.speed(speedMultiplier)) {
                    yOffset = .zero
                }
            }

        ZStack(alignment: .bottom) {
            Capsule()
                .fill(Color.blue)
                .frame(width: 70, height: 400)
            Capsule()
                .fill(Color.green)
                .frame(width: 70, height: -yOffset + 100)
//            Capsule()
//                .strokeBorder(Color.black, lineWidth: 10)
//                .background(
//                    Capsule()
//                        .fill(Color.white)
//                )
            ZStack() {
                Capsule()
                    .fill(Color.white)
                Capsule()
                    .strokeBorder(Color.black, lineWidth: 10)
            }
            .frame(width: 70, height: 100)
            .offset(x: .zero, y: yOffset)
            .gesture(dragGesture)
        }
    }
}

struct GasPedalView_Previews: PreviewProvider {
    static var previews: some View {
        GasPedalSlider<Double>()
    }
}
