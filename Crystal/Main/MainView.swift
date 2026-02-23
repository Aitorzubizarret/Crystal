//
//  MainView.swift
//  Crystal
//
//  Created by Aitor Zubizarreta on 18/2/26.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    
    var viewModel: MainViewModel
    
    // MARK: - View
    
    var body: some View {
        VStack {
            Text("Main View")
            Button {
                Task {
                    await viewModel.logOut()
                }
            } label: {
                Text("Log out")
            }
        }
        .task {
            await viewModel.getAlbums()
        }
    }
}

#Preview {
    let router = AppRouter()
    let photoPrism = PhotoPrismAPIClient()
    
    let viewModel = MainViewModel(router: router,
                                  photoPrism: photoPrism)
    
    MainView(viewModel: viewModel)
}
