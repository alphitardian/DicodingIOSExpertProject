//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 04/01/23.
//

import Foundation

public struct CategoryResponse: Codable, Identifiable {
    public var id: String
    var category: String
    var thumbnail: String
    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case category = "strCategory"
        case thumbnail = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.category = try container.decode(String.self, forKey: .category)
        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
        self.description = try container.decode(String.self, forKey: .description)
    }
}

public extension CategoryResponse {
    func toCategoryDomainModel() -> CategoryDomainModel {
        return CategoryDomainModel(
            id: self.id,
            title: self.category,
            image: self.thumbnail,
            description: self.description
        )
    }
}
