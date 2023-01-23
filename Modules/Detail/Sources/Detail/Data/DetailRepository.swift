//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 08/01/23.
//

import Foundation
import Core
import RxSwift

public struct DetailRepository<Remote: RemoteDataSource, Transformer: Mapper>: Repository
where
Remote.Request == String,
Remote.Response == BaseMealResponse<MealDetailResponse>,
Transformer.Response == BaseMealResponse<MealDetailResponse>,
Transformer.Domain == [MealDetailDomainModel] {
    
    public typealias Request = String
    public typealias Response = [MealDetailDomainModel]
    
    private let remoteDataSource: Remote
    private let mapper: Transformer
    
    public init(remoteDataSource: Remote, mapper: Transformer) {
        self.remoteDataSource = remoteDataSource
        self.mapper = mapper
    }
    
    public func execute(request: String?) -> Observable<[MealDetailDomainModel]> {
        return self.remoteDataSource.execute(request: request)
            .map { response in
                mapper.transformResponseToDomain(response: response) ?? []
            }
    }
}
