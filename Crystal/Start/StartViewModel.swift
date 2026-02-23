//
//  StartViewModel.swift
//  Crystal
//
//  Created by Aitor Zubizarreta on 19/2/26.
//

import Foundation

protocol StartViewModelProtocol {
    var router: AppRouter { get set }
    var photoPrism: PhotoPrismAPIClient { get set }
    
    func isUserSessionSavedLocally() async -> Bool
    func checkUserSession() async
}

struct StartViewModel: StartViewModelProtocol {
    
    // MARK: - Properties
    
    var router: AppRouter
    var photoPrism: PhotoPrismAPIClient
    
    // MARK: - Methods
    
    // Check if the user's session is saved locally.
    func isUserSessionSavedLocally() async -> Bool {
        try? await Task.sleep(nanoseconds: 500_000_000) // 0,5 seconds
        
        if let activeSession = KeychainManager().retrieveActiveSession() {
            photoPrism.activeSession = activeSession
            
            return true
        } else {
            return false
        }
    }
    
    // Checks whether the user's session exists or not, and navigates to the correct view (login or main).
    func checkUserSession() async {
        let isUserSessionSaved: Bool = await isUserSessionSavedLocally()
        
        if isUserSessionSaved {
            router.navigate(to: .main)
        } else {
            router.navigate(to: .login)
        }
    }
    
}
