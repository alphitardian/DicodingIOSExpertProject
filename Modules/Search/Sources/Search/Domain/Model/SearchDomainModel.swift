//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 08/01/23.
//

import Browse
import Detail

public struct SearchDomainModel: Identifiable, Codable {
    public var id: String
    public var name: String
    public var category: String
    public var area: String
    public var instructions: String
    public var thumbnail: String
    public var youtubeLink: String
}

extension SearchDomainModel {
    public func toCategoryDomainModel() -> CategoryDomainModel {
        return CategoryDomainModel(
            id: self.id,
            title: self.name,
            image: self.thumbnail,
            description: self.name
        )
    }
    
    public func toMealDomainModel() -> MealDomainModel {
        return MealDomainModel(id: self.id, name: self.name, thumbnail: self.thumbnail)
    }
    
    public func toMealDetailDomainModel() -> MealDetailDomainModel {
        return MealDetailDomainModel(
            id: self.id,
            name: self.name,
            category: self.category,
            area: self.area,
            instructions: self.instructions,
            thumbnail: self.thumbnail,
            youtubeLink: self.youtubeLink
        )
    }
}
