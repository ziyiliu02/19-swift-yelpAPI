//
//  BusinessModel.swift
//  19-swift-yelpAPI
//
//  Created by Liu Ziyi on 26/10/23.
//

import Foundation

class BusinessModel: ObservableObject {
    @Published var businesses = [Business]()
    @Published var query: String = ""
    @Published var selectedBusiness: Business?
    
    var service = DataService()
    
    func getBusinesses() {
        Task {
            businesses = await service.businessSearch()
        }
    }
}
