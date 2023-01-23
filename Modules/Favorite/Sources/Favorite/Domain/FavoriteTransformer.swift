//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 16/01/23.
//

import Core

public struct FavoriteTransformer: Mapper {
    public typealias Response = Any
    public typealias Entity = FavoriteEntity
    public typealias Domain = FavoriteDomainModel
    
    public init() {}
    
    public func transformResponseToEntity(response: Response) -> FavoriteEntity? {
        return nil
    }
    
    public func transformEntityToDomain(entity: FavoriteEntity) -> FavoriteDomainModel? {
        return entity.toFavoriteDomainModel()
    }
    
    public func transformResponseToDomain(response: Response) -> FavoriteDomainModel? {
        return nil
    }
}

extension FavoriteTransformer {
    public func transformDomainToEntity(domain: FavoriteDomainModel) -> FavoriteEntity? {
        return domain.toFavoriteEntity()
    }
}
