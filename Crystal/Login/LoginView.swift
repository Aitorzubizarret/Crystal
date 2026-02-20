//
//  LoginView.swift
//  Crystal
//
//  Created by Aitor Zubizarreta on 18/2/26.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    
    var viewModel: LoginViewModel
    
    @State private var url: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    
    // MARK: - View
    
    var body: some View {
        VStack {
            Text("PhotoPrism")
            Form {
                Section(header: Text("Log In")) {
                    TextField("URL", text: $url)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.default)
                        .autocorrectionDisabled()
                    TextField("Username", text: $username)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.default)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $password)
                        .textContentType(.password)
                }
                
                Section {
                    Button {
                        Task {
                            await viewModel.login(url: url,
                                                  username: username,
                                                  password: password)
                        }
                    } label: {
                        Text("Login")
                    }
                }
            }
        }
    }
}

#Preview {
    let router = AppRouter()
    let photoPrism = PhotoPrismAPIClient()
    
    let viewModel = LoginViewModel(router: router,
                                   photoPrism: photoPrism)
    
    LoginView(viewModel: viewModel)
}
