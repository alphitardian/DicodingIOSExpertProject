//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 05/01/23.
//

import Foundation
import Core
import RxSwift

public struct BrowseRepository<
    DataSource: RemoteDataSource,
    Transformer: Mapper
>: Repository
where
DataSource.Response == BaseCategoryResponse,
Transformer.Response == CategoryResponse,
Transformer.Domain == CategoryDomainModel {
    
    public typealias Request = Any
    public typealias Response = [CategoryDomainModel]
    
    private let remoteDataSource: DataSource
    private let mapper: Transformer
    
    public init(remoteDataSource: DataSource, mapper: Transformer) {
        self.remoteDataSource = remoteDataSource
        self.mapper = mapper
    }
    
    public func execute(request: Any?) -> Observable<[CategoryDomainModel]> {
        return self.remoteDataSource.execute(request: nil)
            .map { response in
                response.categories.map { category in
                    self.mapper.transformResponseToDomain(response: category)!
                }
            }
            .filter { model in
                !model.isEmpty
            }
    }
}
