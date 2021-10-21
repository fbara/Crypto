//
//  CryptoApp.swift
//  Crypto
//
//  Created by Frank Bara on 10/21/21.
//

import SwiftUI

@main
struct CryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
