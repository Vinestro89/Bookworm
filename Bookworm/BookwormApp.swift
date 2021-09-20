//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Vincent Delmaestro on 20/09/2021.
//

import SwiftUI

@main
struct BookwormApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
