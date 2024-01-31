//
//  ContentViewModel.swift
//  CVSProject
//
//  Created by Jael Ruvalcaba on 31/01/24.
//

import Foundation

final class FlikrImagesViewModel:ObservableObject {
    
    private let jsonDecoder = JSONDecoder()
    @Published private(set) var imagesModel = [FlickrItem]()
    @Published var isMoveToImageDetails = false
    @Published var searchText = "" {
        didSet {
            if !searchText.isEmpty {
                Task {
                    await retrieveImagesOf(tag: searchText)
                }
            }
        }
    }
   
    
    @MainActor func retrieveImagesOf(tag searchTag:String) async{
        
        let baseUrl = FlickrDB.findImage(tag: searchTag).fullURL
        
        if !imagesModel.isEmpty { imagesModel.removeAll() }
        
        guard let flickrUrl = URL(string: baseUrl) else {
            fatalError( "Invalid URL")
            return
        }
        do {
            let (data,_) = try await URLSession.shared.data(from: flickrUrl)
            let images = try jsonDecoder.decode(FlickrResponse.self, from: data)
            imagesModel.append(contentsOf:images.items ?? [] )
        }catch {
            print(error)
        }
    }
}
