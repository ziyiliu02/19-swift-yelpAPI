//
//  MapView.swift
//  19-swift-yelpAPI
//
//  Created by Liu Ziyi on 26/10/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let tower = CLLocationCoordinate2D(latitude: 51.47965644432142, longitude:  -0.17694002100624326)
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.47965644432142, longitude: -0.17694002100624326), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
