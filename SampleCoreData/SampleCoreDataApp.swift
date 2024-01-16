//
//  SampleCoreDataApp.swift
//  SampleCoreData
//
//  Created by Александр Семенов on 15.01.2024.
//

import SwiftUI

@main
struct SampleCoreDataApp: App {
    
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
