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
    
    // MARK: - Methods
    
    @ViewBuilder
    var startView: some View {
        let startViewModel = StartViewModel(router: router,
                                            photoPrism: photoPrism)
        StartView(viewModel: startViewModel)
    }
    
    @ViewBuilder
    var loginView: some View {
        let loginViewModel = LoginViewModel(router: router,
                                            photoPrism: photoPrism)
        LoginView(viewModel: loginViewModel)
        .onChange(of: photoPrism.activeSession) { oldValue, newValue in
            if let _ = newValue {
                router.navigate(to: .main) // After the user logs in correctly, navigate to the main view.
            }
        }
    }
    
    @ViewBuilder
    var mainView: some View {
        let mainViewModel = MainViewModel(router: router,
                                          photoPrism: photoPrism)
        MainView(viewModel: mainViewModel)
        .onChange(of: photoPrism.activeSession) { oldValue, newValue in
            if newValue == nil {
                router.navigate(to: .login) // After deleting the user's session, navigate to the login view.
            }
        }
    }
    
    // MARK: - View
    
    var body: some View {
        switch router.currentRoute {
        case .start:
            startView
        case .login:
            loginView
        case .main:
            mainView
        }
    }
}

#Preview {
    ContentView()
}
