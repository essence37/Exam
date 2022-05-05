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
            GearPositionsView(radius: 150)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
