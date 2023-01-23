//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 05/01/23.
//

public struct CategoryDomainModel: Identifiable, Codable {
    public var id: String
    public var title: String
    public var image: String
    public var description: String
    
    public init(id: String, title: String, image: String, description: String) {
        self.id = id
        self.title = title
        self.image = image
        self.description = description
    }
}
