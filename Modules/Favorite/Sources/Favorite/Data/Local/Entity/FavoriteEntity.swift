//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 16/01/23.
//

import Foundation
import RealmSwift

public class FavoriteEntity: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var category: String = ""
    @objc dynamic var area: String = ""
    @objc dynamic var instruction: String = ""
    @objc dynamic var thumbnail: String = ""
    @objc dynamic var youtubeLink: String = ""
    
    public override class func primaryKey() -> String? {
        return "id"
    }
    
    public override init() {}
    
    init(id: String, name: String, category: String, area: String, instruction: String, thumbnail: String, youtubeLink: String) {
        self.id = id
        self.name = name
        self.category = category
        self.area = area
        self.instruction = instruction
        self.thumbnail = thumbnail
        self.youtubeLink = youtubeLink
    }
}

extension FavoriteEntity {
    func toFavoriteDomainModel() -> FavoriteDomainModel {
        return FavoriteDomainModel(
            id: self.id,
            name: self.name,
            category: self.category,
            area: self.area,
            instruction: self.instruction,
            thumbnail: self.thumbnail,
            youtubeLink: self.youtubeLink
        )
    }
}
