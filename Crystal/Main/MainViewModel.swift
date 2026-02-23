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
        try? await photoPrism.deleteUserSession()
    }
    
    /// Gets albums data.
    func getAlbums() async {
        if let activeSession = KeychainManager().retrieveActiveSession() {
            try? await photoPrism.fetchAlbums(activeSession: activeSession,
                                              albumNumber: 10)
        } else {
            print("Error")
        }
    }
    
}
