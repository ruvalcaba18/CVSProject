//
//  ContentModel.swift
//  CVSProject
//
//  Created by Jael Ruvalcaba on 31/01/24.
//

import Foundation

struct FlickrResponse: Codable,Identifiable{
    var id = UUID()
    let title: String?
    let link: String?
    let description: String?
    let modified: String?
    let generator: String?
    let items: [FlickrItem]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.link = try container.decodeIfPresent(String.self, forKey: .link)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.modified = try container.decodeIfPresent(String.self, forKey: .modified)
        self.generator = try container.decodeIfPresent(String.self, forKey: .generator)
        self.items = try container.decodeIfPresent([FlickrItem].self, forKey: .items)
    }
    enum CodingKeys: CodingKey {
        case title
        case link
        case description
        case modified
        case generator
        case items
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.link, forKey: .link)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.modified, forKey: .modified)
        try container.encodeIfPresent(self.generator, forKey: .generator)
        try container.encodeIfPresent(self.items, forKey: .items)
    }
}

struct FlickrItem: Codable, Identifiable {
    var id = UUID()
    let title: String?
    let link: String?
    let media: Media?
    let dateTaken: String?
    let description: String?
    let published: String?
    let author: String?
    let authorId: String?
    let tags: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.link = try container.decodeIfPresent(String.self, forKey: .link)
        self.media = try container.decodeIfPresent(Media.self, forKey: .media)
        self.dateTaken = try container.decodeIfPresent(String.self, forKey: .dateTaken)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.published = try container.decodeIfPresent(String.self, forKey: .published)
        self.author = try container.decodeIfPresent(String.self, forKey: .author)
        self.authorId = try container.decodeIfPresent(String.self, forKey: .authorId)
        self.tags = try container.decodeIfPresent(String.self, forKey: .tags)
    }
    
    enum CodingKeys: CodingKey {
        case title
        case link
        case media
        case dateTaken
        case description
        case published
        case author
        case authorId
        case tags
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.link, forKey: .link)
        try container.encodeIfPresent(self.media, forKey: .media)
        try container.encodeIfPresent(self.dateTaken, forKey: .dateTaken)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.published, forKey: .published)
        try container.encodeIfPresent(self.author, forKey: .author)
        try container.encodeIfPresent(self.authorId, forKey: .authorId)
        try container.encodeIfPresent(self.tags, forKey: .tags)
    }

  
}

struct Media: Codable{
    let m: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.m = try container.decodeIfPresent(String.self, forKey: .m)
    }
    enum CodingKeys: CodingKey {
        case m
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.m, forKey: .m)
    }
}
