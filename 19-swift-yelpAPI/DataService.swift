//
//  DataService.swift
//  19-swift-yelpAPI
//
//  Created by Liu Ziyi on 20/10/23.
//

import Foundation

struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch() async -> [Business] {
        
        // Check if api key exists
        guard apiKey != nil else {
            return [Business]()
        }
        
        // 1. Create url
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=37.33479732223935&longitude=-122.0089290884487&categories=restaurants&limit=10") {
            
            // 2. Create request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            
            // 3. Send request
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                
                // 4. Parse the JSON
                let decoder = JSONDecoder()
                let result = try decoder.decode(BusinessSearch.self, from: data)
                
                return result.businesses
            } catch {
                print(error)
            }
            
        }
        
        return [Business]()
        
    }
    
}
