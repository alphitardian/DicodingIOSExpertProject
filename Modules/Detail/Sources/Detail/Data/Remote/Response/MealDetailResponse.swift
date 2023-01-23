//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 08/01/23.
//

import Foundation

public struct MealDetailResponse: Codable, Identifiable {
    public var id: String
    public var name: String
    public var category: String
    public var area: String
    public var instructions: String
    public var thumbnail: String
    public var youtubeLink: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
        case youtubeLink = "strYoutube"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.category = try container.decode(String.self, forKey: .category)
        self.area = try container.decode(String.self, forKey: .area)
        self.instructions = try container.decode(String.self, forKey: .instructions)
        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
        self.youtubeLink = try container.decode(String.self, forKey: .youtubeLink)
    }
}

extension MealDetailResponse {
    public func toMealResponse() -> MealResponse {
        return MealResponse(
            id: self.id,
            name: self.name,
            thumbnail: self.thumbnail
        )
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
