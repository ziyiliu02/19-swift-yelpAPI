//
//  BusinessDetailView.swift
//  19-swift-yelpAPI
//
//  Created by Liu Ziyi on 22/10/23.
//

import SwiftUI

struct BusinessDetailView: View {
    
    var business: Business?
    
    var body: some View {
        Text(business?.name ?? "")
    }
}

struct BusinessDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailView()
    }
}
