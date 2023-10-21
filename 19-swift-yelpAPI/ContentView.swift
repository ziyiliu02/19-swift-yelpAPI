//
//  ContentView.swift
//  19-swift-yelpAPI
//
//  Created by Liu Ziyi on 20/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var businesses = [Business]()
    @State var query: String = ""
    var service = DataService()
    
    var body: some View {
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
                
                Button {
                    //TODO: Implement query
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            List(businesses) { b in 
                Text(b.name ?? "Nil")
            }
        }
        .padding()
        .task {
            businesses = await service.businessSearch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
