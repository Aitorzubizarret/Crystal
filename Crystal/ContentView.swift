//
//  ContentView.swift
//  Crystal
//
//  Created by Aitor Zubizarreta on 17/2/26.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var router: AppRouter
    
    // MARK: - View
    
    var body: some View {
        switch router.currentRoute {
        case .start:
            let startViewModel = StartViewModel(router: router)
            StartView(viewModel: startViewModel)
        case .login:
            LoginView()
        case .main:
            MainView()
        }
    }
}

#Preview {
    ContentView()
}
