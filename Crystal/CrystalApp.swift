//
//  CrystalApp.swift
//  Crystal
//
//  Created by Aitor Zubizarreta on 17/2/26.
//

import SwiftUI

@main
struct CrystalApp: App {
    
    // MARK: - Properties
    
    @StateObject private var router = AppRouter()
    
    // MARK: - View
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
        }
    }
}
