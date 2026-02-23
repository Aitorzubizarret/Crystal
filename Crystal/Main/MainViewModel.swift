//
//  MainViewModel.swift
//  Crystal
//
//  Created by Aitor Zubizarreta on 21/2/26.
//

import Foundation

protocol MainViewModelProtocol {
    var router: AppRouter { get set }
    var photoPrism: PhotoPrismAPIClient { get set }
    
    func getAlbums() async
}

struct MainViewModel: MainViewModelProtocol {
    
    // MARK: - Properties
    
    var router: AppRouter
    var photoPrism: PhotoPrismAPIClient
    
    // MARK: - Methods
    
    /// Logs out.
    func logOut() async {
        print("MainViewModel.logOut")
        try? await photoPrism.deleteUserSession()
    }
    
    func getAlbums() async {
        print("Aitor MainViewModel.getAlbums")
        
        if let activeSessionData = try? KeychainManager().retrieve(account: .token),
           let activeSession = try? JSONDecoder().decode(PhotoPrismActiveSession.self, from: activeSessionData) {
            print("Aitor MainViewModel.getAlbums - activeSession")
            
            try? await photoPrism.fetchAlbums(activeSession: activeSession, albumNumber: 10)
        } else {
            print("Error")
        }
    }
    
}
