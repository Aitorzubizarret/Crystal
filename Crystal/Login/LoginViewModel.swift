//
//  LoginViewModel.swift
//  Crystal
//
//  Created by Aitor Zubizarreta on 20/2/26.
//

import Foundation

protocol LoginViewModelProtocol {
    var router: AppRouter { get set }
    var photoPrism: PhotoPrismAPIClient { get set }
    
    func login(url: String, username: String, password: String) async
}

struct LoginViewModel: LoginViewModelProtocol {
    
    // MARK: - Properties
    
    var router: AppRouter
    var photoPrism: PhotoPrismAPIClient
    
    // MARK: - Methods
    
    func login(url: String, username: String, password: String) async {
        try? await photoPrism.fetchUserSession(url: url,
                                               username: username,
                                               userpassword: password)
    }
}
