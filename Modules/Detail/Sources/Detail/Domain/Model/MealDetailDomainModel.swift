//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 08/01/23.
//

import Foundation
import Favorite

public struct MealDetailDomainModel: Identifiable, Codable {
    public var id: String
    public var name: String
    public var category: String
    public var area: String
    public var instructions: String
    public var thumbnail: String
    public var youtubeLink: String
    
    public init(
        id: String,
        name: String,
        category: String,
        area: String,
        instructions: String,
        thumbnail: String,
        youtubeLink: String
    ) {
        self.id = id
        self.name = name
        self.category = category
        self.area = area
        self.instructions = instructions
        self.thumbnail = thumbnail
        self.youtubeLink = youtubeLink
    }
}

extension MealDetailDomainModel {
    public func toFavoriteDomainModel() -> FavoriteDomainModel {
        return FavoriteDomainModel(
            id: self.id,
            name: self.name,
            category: self.category,
            area: self.area,
            instruction: self.instructions,
            thumbnail: self.thumbnail,
            youtubeLink: self.youtubeLink
        )
    }
}
