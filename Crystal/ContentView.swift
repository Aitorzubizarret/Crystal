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
    @EnvironmentObject private var photoPrism: PhotoPrismAPIClient
    
    // MARK: - View
    
    var body: some View {
        switch router.currentRoute {
        case .start:
            let startViewModel = StartViewModel(router: router,
                                                photoPrism: photoPrism)
            StartView(viewModel: startViewModel)
        case .login:
            let loginViewModel = LoginViewModel(router: router,
                                                photoPrism: photoPrism)
            LoginView(viewModel: loginViewModel)
            .onChange(of: photoPrism.session) { oldValue, newValue in
                if newValue {
                    router.navigate(to: .main)
                }
            }
        case .main:
            MainView()
        }
    }
}

#Preview {
    ContentView()
}
