//
//  SteeringWheelSlider.swift
//  Exam
//
//  Created by Пазин Даниил on 28.05.2022.
//

import SwiftUI

struct SteeringWheelSlider<V>: View where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint {
    private let bounds: ClosedRange<V>
    @State private var value: CGFloat = .zero
    @State var angle = Angle(degrees: 0.0)
    @State var initialAngle = Angle()
    @State var currentAngle = Angle()

    var rotation: some Gesture {
        RotationGesture()
            .onChanged { angle in
                self.angle = angle
            }
    }

    init(in bounds: ClosedRange<V> = 0...1) {
        self.bounds = bounds
    }

    var body: some View {
        ZStack {
            Rectangle()
                .rotationEffect(angle)
            .gesture(rotation)
            CustomDragView()
                .onBegan({ touch in
                    self.initialAngle = touch.angle()!
                    self.currentAngle = self.angle
                })
                .onChanged { touch in
                    print((touch.angle()! - initialAngle).degrees)
                    self.angle = currentAngle + (touch.angle()! - initialAngle)
                }
        }
        .frame(width: 200, height: 200, alignment: .center)
    }
}

struct SteeringWheelView_Previews: PreviewProvider {
    static var previews: some View {
        SteeringWheelSlider<Double>()
    }
}
