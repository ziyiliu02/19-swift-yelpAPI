//
//  TextHelper.swift
//  19-swift-yelpAPI
//
//  Created by Liu Ziyi on 22/10/23.
//

import Foundation

struct TextHelper {
    
    static func distanceAwayText(meters: Double) -> String {
        
        if meters > 1000 {
            return "\(Int(round(meters/1000))) km away"
        } else {
            return "\(Int(round(meters))) m away"
        }
        
    }
    
}
