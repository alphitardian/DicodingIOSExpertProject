//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 08/01/23.
//

import Core

public struct DetailTransformer: Mapper {
    
    public typealias Response = BaseMealResponse<MealDetailResponse>
    public typealias Entity = Any
    public typealias Domain = [MealDetailDomainModel]
    
    public init() {}
    
    public func transformResponseToEntity(response: Core.BaseMealResponse<MealDetailResponse>) -> Entity? {
        return nil
    }
    
    public func transformEntityToDomain(entity: Entity) -> [MealDetailDomainModel]? {
        return nil
    }
    
    public func transformResponseToDomain(response: Core.BaseMealResponse<MealDetailResponse>) -> [MealDetailDomainModel]? {
        return response.meals.map { response in
            response.toMealDetailDomainModel()
        }
    }
    
    public func transformDomainToEntity(domain: [MealDetailDomainModel]) -> Entity? {
        return nil
    }
}
