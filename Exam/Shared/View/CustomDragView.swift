//
//  ForceDragView.swift
//  Exam
//
//  Created by Пазин Даниил on 13.03.2022.
//

import SwiftUI

struct CustomDragView: UIViewRepresentable {
    private var onBegan: ((UITouch) -> Void)?
    private var onChanged: ((UITouch) -> Void)?
    private var onEnded: ((UITouch) -> Void)?
    
    func onBegan(_ action: @escaping (UITouch) -> Void) -> Self {
        return CustomDragView(onBegan: action)
    }
    
    func onChanged(_ action: @escaping (UITouch) -> Void) -> Self {
        return CustomDragView(onBegan: onBegan, onChanged: action)
    }
    
    func onEnded(_ action: @escaping (UITouch) -> Void) -> Self {
        return CustomDragView(onBegan: onBegan, onChanged: onChanged, onEnded: action)
    }
    
    // MARK: - Creating and Updating the View
    
    func makeUIView(context: Context) -> CustomDragUIView {
        let view = CustomDragUIView()
        view.onBegan = onBegan
        view.onChanged = onChanged
        view.onEnded = onEnded
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
    
    // MARK: -  Managed UIView Object
    
    class CustomDragUIView: UIView {
        var onBegan: ((UITouch) -> Void)?
        var onChanged: ((UITouch) -> Void)?
        var onEnded: ((UITouch) -> Void)?
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard let touch = touches.first else { return }
            onBegan?(touch)
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard let touch = touches.first else { return }
            onChanged?(touch)
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard let touch = touches.first else { return }
            onEnded?(touch)
        }
    }
}
