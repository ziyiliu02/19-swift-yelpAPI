//
//  BusinessDetailView.swift
//  19-swift-yelpAPI
//
//  Created by Liu Ziyi on 22/10/23.
//

import SwiftUI

struct BusinessDetailView: View {
    
    @EnvironmentObject var viewModel: BusinessModel
    
    var body: some View {
        
        let business = viewModel.selectedBusiness
        
        VStack(spacing: 0) {
            // Image
            ZStack(alignment: .trailing) {
                Image("detail-placeholder-image")
                    .resizable()
                
                VStack {
                    Spacer()
                    Image("yelp-attribution-image")
                        .frame(width: 72, height: 36)
                }
            }
            .frame(height: 164)
            
            // Green Rectangle
            if let isClosed = business?.isClosed {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(isClosed ? .red : .green)
                    
                    Text(isClosed ? "Closed" : "Open")
                        .bold()
                        .foregroundColor(.white)
                }
                .frame(height: 36)
            }
            
            // Body
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text(business?.name ?? "")
                        .font(Font.system(size: 21))
                        .bold()
                        .padding(.bottom, 10)
                        .padding(.top, 16)
                    
                    Text("\(business?.location?.address1 ?? ""), \(business?.location?.city ?? "")")
                    Text("\(business?.location?.state ?? "") \(business?.location?.zipCode ?? ""), \(business?.location?.country ?? "")")
                        .padding(.bottom, 10)
                    
                    Image("regular_\(business?.rating ?? 0)")
                        .padding(.bottom, 16)
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "phone")
                        Text(business?.phone ?? "")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "globe")
                        Text(business?.url ?? "")
                            .lineLimit(1)
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    
                    Divider()
                    
                    Spacer()
                }
            }
            .padding(.horizontal)
        }
    }
}

struct BusinessDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailView()
            .environmentObject(BusinessModel())
    }
}
