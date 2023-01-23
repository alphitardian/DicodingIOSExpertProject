//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 16/01/23.
//

import Foundation
import Core
import RealmSwift
import RxSwift

public struct GetFavoriteRepository<
    DataSource: LocalDataSource,
    Transformer: Mapper
>: Repository
where
DataSource.Response == FavoriteEntity,
Transformer.Entity == FavoriteEntity,
Transformer.Domain == FavoriteDomainModel {
    
    public typealias Request = Any
    public typealias Response = [FavoriteDomainModel]
    
    private let localDataSource: DataSource
    private let mapper: Transformer
    
    public init(localDataSource: DataSource, mapper: Transformer) {
        self.localDataSource = localDataSource
        self.mapper = mapper
    }
    
    public func execute(request: Request?) -> Observable<[FavoriteDomainModel]> {
        return localDataSource.list(request: nil)
            .map { entities in
                entities.map { entity in
                    entity.toFavoriteDomainModel()
                }
            }
    }
}
