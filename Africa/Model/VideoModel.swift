//
//  VideoModel.swift
//  Africa
//
//  Created by Hamed Tara on 2024-02-13.
//

import Foundation

struct Video: Codable,Identifiable{
    let id : String
    let name : String
    let headline: String
    
    //Computed Property
    
    var thumbnail : String{
        "video-\(id)"
    }
}
