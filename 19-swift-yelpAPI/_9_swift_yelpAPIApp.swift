//
//  _9_swift_yelpAPIApp.swift
//  19-swift-yelpAPI
//
//  Created by Liu Ziyi on 20/10/23.
//

import SwiftUI

@main
struct _9_swift_yelpAPIApp: App {
    
    @StateObject var viewModel = BusinessModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
