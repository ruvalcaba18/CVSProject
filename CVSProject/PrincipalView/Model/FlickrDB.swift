//
//  ImagesDB.swift
//  CVSProject
//
//  Created by Jael Ruvalcaba on 31/01/24.
//

import Foundation

enum FlickrDB {

    case findImage(tag: String)

    var endpoint: String {
        switch self {
        case let .findImage(tag):
            return "services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(tag)"
        }
    }

    var baseURL: String {
        return "https://api.flickr.com/"
    }

    var fullURL: String {
        return baseURL + endpoint
    }

}
