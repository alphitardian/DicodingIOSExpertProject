//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 08/01/23.
//

import Foundation
import Core
import RxSwift

public struct SearchRepository<
    DataSource: RemoteDataSource,
    Transformer: Mapper
>: Repository
where
DataSource.Request == String,
DataSource.Response == BaseMealResponse<SearchResponse>,
Transformer.Response == BaseMealResponse<SearchResponse>,
Transformer.Domain == [SearchDomainModel] {
    
    public typealias Request = String
    public typealias Response = [SearchDomainModel]
    
    private let remoteDataSource: DataSource
    private let mapper: Transformer
    
    public init(remoteDataSource: DataSource, mapper: Transformer) {
        self.remoteDataSource = remoteDataSource
        self.mapper = mapper
    }
    
    public func execute(request: String?) -> Observable<[SearchDomainModel]> {
        return self.remoteDataSource.execute(request: request)
            .map { response in
                mapper.transformResponseToDomain(response: response) ?? []
            }
    }
}
