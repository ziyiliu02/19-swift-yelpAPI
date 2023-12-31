//
//  ContentView.swift
//  19-swift-yelpAPI
//
//  Created by Liu Ziyi on 20/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: BusinessModel
    
    var body: some View {
        VStack {
            HStack {
                TextField("What are you looking for?", text: $viewModel.query)
                
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
            
            List{
                ForEach(viewModel.businesses) { business in
                    VStack(spacing: 20) {
                        HStack(spacing: 0) {
                            
                            if let imageUrl = business.imageUrl {
                                AsyncImage(url: URL(string: imageUrl)!) { image in
                                    image
                                        .resizable()
                                        .frame(width:50, height: 50)
                                        .aspectRatio(contentMode: .fill)
                                        .clipShape(RoundedRectangle(cornerRadius: 6))
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 50, height: 50)
                                }

                            } else {
                                Image("list-placeholder-image")
                                    .padding(.trailing, 16)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(business.name ?? "Restaurant")
                                    .font(Font.system(size: 15))
                                    .bold()
//                                Text("\(Int(round(business.distance ?? 0))) m away")
//                                    .font(Font.system(size: 16))
//                                    .foregroundColor(Color(red: 67/255, green: 71/255, blue:76/255))
                                Text(TextHelper.distanceAwayText(meters: business.distance ?? 0))
                                    .font(Font.system(size: 16))
                                    .foregroundColor(Color(red: 67/255, green: 71/255, blue:76/255))
                            }
                            Spacer()
                            Image("regular_\(business.rating ?? 0)")
                        }
                        Divider()
                    }
                    .onTapGesture {
                        viewModel.selectedBusiness = business
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .onAppear {
            viewModel.getBusinesses()
        }
        .sheet(item: $viewModel.selectedBusiness) { item in
            BusinessDetailView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BusinessModel())
    }
}
