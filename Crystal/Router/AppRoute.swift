//
//  AppRoute.swift
//  Crystal
//
//  Created by Aitor Zubizarreta on 18/2/26.
//

enum AppRoute {
    case start /// View to be displayed always on startup. Checks if user is logged in.
    case login /// View to log in (username and password) to the PhotoPrism server.
    case main  /// View of the main gallery.
}
