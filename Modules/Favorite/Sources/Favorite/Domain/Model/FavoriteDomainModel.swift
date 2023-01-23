//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 16/01/23.
//

import Foundation
import Core
import Browse

public struct FavoriteDomainModel: Identifiable, DomainModel {
    public var id: String
    public var name: String
    public var category: String
    public var area: String
    public var instruction: String
    public var thumbnail: String
    public var youtubeLink: String
    
    public init(id: String, name: String, category: String, area: String, instruction: String, thumbnail: String, youtubeLink: String) {
        self.id = id
        self.name = name
        self.category = category
        self.area = area
        self.instruction = instruction
        self.thumbnail = thumbnail
        self.youtubeLink = youtubeLink
    }
}

extension FavoriteDomainModel {
    public func toFavoriteEntity() -> FavoriteEntity {
        return FavoriteEntity(
            id: self.id,
            name: self.name,
            category: self.category,
            area: self.area,
            instruction: self.instruction,
            thumbnail: self.thumbnail,
            youtubeLink: self.youtubeLink
        )
    }
    
    public func toMealDomainModel() -> MealDomainModel {
        return MealDomainModel(id: self.id, name: self.name, thumbnail: self.thumbnail)
    }
}
