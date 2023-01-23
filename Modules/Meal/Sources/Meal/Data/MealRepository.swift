//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 12/01/23.
//

import Foundation
import Core
import Browse
import RxSwift

public struct MealRepository<
    DataSource: RemoteDataSource,
    Transformer: Mapper
>: Repository
where
DataSource.Request == String,
DataSource.Response == BaseMealResponse<MealResponse>,
Transformer.Response == MealResponse,
Transformer.Domain == MealDomainModel {
    
    public typealias Request = String
    public typealias Response = [MealDomainModel]
    
    private let remoteDataSource: DataSource
    private let mapper: Transformer
    
    public init(remoteDataSource: DataSource, mapper: Transformer) {
        self.remoteDataSource = remoteDataSource
        self.mapper = mapper
    }
    
    public func execute(request: String?) -> Observable<[MealDomainModel]> {
        return self.remoteDataSource.execute(request: request)
            .map { response in
                response.meals.map { meal in
                    self.mapper.transformResponseToDomain(response: meal)!
                }
            }
            .filter { model in
                !model.isEmpty
            }
    }
}
