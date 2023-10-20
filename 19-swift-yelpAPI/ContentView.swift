//
//  ContentView.swift
//  19-swift-yelpAPI
//
//  Created by Liu Ziyi on 20/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Text("API_KEY")
        }
        .onAppear {
            print(Bundle.main.infoDictionary?["API_KEY"] as? String)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
