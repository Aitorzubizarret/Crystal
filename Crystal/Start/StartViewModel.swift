//
//  StartViewModel.swift
//  Crystal
//
//  Created by Aitor Zubizarreta on 19/2/26.
//

import Foundation

protocol StartViewModelProtocol {
    var router: AppRouter { get set }
    
    func isUserTokenSavedLocally() async -> Bool
    func checkUserLoggedIn() async
}

struct StartViewModel: StartViewModelProtocol {
    
    var router: AppRouter
    
    // Check if the user's token is saved locally.
    func isUserTokenSavedLocally() async -> Bool {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        return false
    }
    
    // Checks whether the user has already log in or not, and navigate to the correct view (login or main).
    func checkUserLoggedIn() async {
        let isUserLoggedIn: Bool = await isUserTokenSavedLocally()
        
        if isUserLoggedIn {
            router.navigate(to: .main)
        } else {
            router.navigate(to: .login)
        }
    }
    
}
