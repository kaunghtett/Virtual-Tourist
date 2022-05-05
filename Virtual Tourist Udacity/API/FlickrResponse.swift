//
//  FlickrResponse.swift
//  Virtual Tourist Udacity
//
//  Created by Min Kaung Htet on 03/05/2022.
//

import Foundation

struct SearchResponse: Codable {
    
    let photos: Photos
    let stat: String
}

struct Photos: Codable {
    
    let page: Int
    let pages: Int
    let perpage: Int
    let total: Int
    let photo: [PhotoInfo]
}

struct PhotoInfo: Codable {
    
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
    let isPublic: Int
    let isFriend: Int
    let isFamily: Int
    let url_m: String
    let height_m: Int
    let width_m: Int
}

