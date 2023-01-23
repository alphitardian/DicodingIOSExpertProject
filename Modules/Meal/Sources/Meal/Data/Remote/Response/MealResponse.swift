//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 11/01/23.
//

import Foundation
import Browse

public struct MealResponse: Codable, Identifiable {
    public var id: String
    public var name: String
    public var thumbnail: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
    }
}

public extension MealResponse {
    func toMealDomainModel() -> MealDomainModel {
        return MealDomainModel(id: self.id, name: self.name, thumbnail: self.thumbnail)
    }
}
