//
//  AppRouter.swift
//  Crystal
//
//  Created by Aitor Zubizarreta on 18/2/26.
//

import Foundation
import Combine

class AppRouter: ObservableObject {
    
    // MARK: - Properties
    
    @Published var currentRoute: AppRoute = .start
    
    // MARK: - Methods
    
    func navigate(to route: AppRoute) {
        currentRoute = route
    }
    
}
