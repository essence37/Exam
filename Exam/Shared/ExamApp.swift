//
//  ExamApp.swift
//  Shared
//
//  Created by Пазин Даниил on 03.02.2022.
//

import SwiftUI

@main
struct ExamApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SteeringWheelSlider<Double>()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
