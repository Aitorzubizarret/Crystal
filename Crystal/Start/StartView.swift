//
//  StartView.swift
//  Crystal
//
//  Created by Aitor Zubizarreta on 19/2/26.
//

import SwiftUI

struct StartView: View {
    
    // MARK: - Properties
    
    var viewModel: StartViewModel
    
    // MARK: - View
    
    var body: some View {
        ProgressView()
        Text("Checking if there is a user logged in ...")
        .task {
            await viewModel.checkUserLoggedIn()
        }
    }
}

#Preview {
    let router = AppRouter()
    let viewModel = StartViewModel(router: router)
    
    StartView(viewModel: viewModel)
}
