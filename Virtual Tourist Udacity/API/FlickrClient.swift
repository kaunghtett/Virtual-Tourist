//
//  FlickrClient.swift
//  Virtual Tourist Udacity
//
//  Created by Min Kaung Htet on 03/05/2022.
//

import Foundation

class FlickrClient {
    
    static let Scheme = "https://"
    static let Host = "api.flickr.com"
    static let Path = "/services/rest"
    static let apiKey = "9ea5cb1bfa81a2d35c570948dabb24c2"
    static let secret = "3efc1443a72994ec"
    
// MARK: Endpoints

    enum Endpoints {
        
        static let base = Scheme + Host + Path
        static let radius = 20
        
        case photoSearch(Double, Double, Int)
        case getPhoto(PhotoInfo)

        var stringValue: String {
            switch self {
                
            case .photoSearch(let lat, let lon, let page):
                return
                  Endpoints.base
                + "?method=flickr.photos.getRecent&api_key="
                + FlickrClient.apiKey
                + "&accuracy=11"
                + "lat=\(lat)"
                + "&lon=\(lon)"
                + "&radius=\(Endpoints.radius)"
                + "&per_page=15&page=\(page)"
                + "&format=json&nojsoncallback=1&extras=url_m"
                
            case .getPhoto(let photo):
                return "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret).jpg"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
}
