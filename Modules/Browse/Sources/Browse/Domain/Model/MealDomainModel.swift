//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 11/01/23.
//

import Foundation
import Core

public struct MealDomainModel: Identifiable, Codable, DomainModel {
    public var id: String
    public var name: String
    public var thumbnail: String
    
    public init(id: String, name: String, thumbnail: String) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
    }
}
