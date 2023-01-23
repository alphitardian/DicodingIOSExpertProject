//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 20/01/23.
//

import Foundation
import Core
import RealmSwift
import RxSwift

public struct RemoveFavoriteRepository<
    DataSource: LocalDataSource,
    Transformer: Mapper
>: Repository
where
DataSource.Request == FavoriteEntity,
Transformer.Entity == FavoriteEntity,
Transformer.Domain == FavoriteDomainModel {
    
    public typealias Request = FavoriteDomainModel
    public typealias Response = Bool
    
    private let localDataSource: DataSource
    private let mapper: Transformer
    
    public init(localDataSource: DataSource, mapper: Transformer) {
        self.localDataSource = localDataSource
        self.mapper = mapper
    }
    
    public func execute(request: FavoriteDomainModel?) -> Observable<Bool> {
        let entity = mapper.transformDomainToEntity(domain: request!)
        return localDataSource.remove(entity: entity!)
    }
}
