//
//  something_borrowedApp.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 7/29/22.
//

import SwiftUI
import Amplify
import AWSCognitoAuthPlugin
import AWSS3StoragePlugin

@main
struct something_borrowedApp: App {
    
    init() {
        configureAmplify()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    private func configureAmplify() {
            do {
                try Amplify.add(plugin: AWSCognitoAuthPlugin())
                try Amplify.add(plugin: AWSS3StoragePlugin())
                
                try Amplify.configure()
                print("Successfully configured Amplify")
                
            } catch {
                print("Could not configure Amplify", error)
            }
        }
}
