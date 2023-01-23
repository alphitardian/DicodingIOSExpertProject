//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 11/01/23.
//

import Core
import Browse

public struct MealTransformer: Mapper {
    public typealias Response = MealResponse
    public typealias Entity = Any
    public typealias Domain = MealDomainModel
    
    public init() {}
    
    public func transformResponseToEntity(response: MealResponse) -> Entity? {
        return nil
    }
    
    public func transformEntityToDomain(entity: Entity) -> MealDomainModel? {
        return nil
    }
    
    public func transformResponseToDomain(response: MealResponse) -> MealDomainModel? {
        return response.toMealDomainModel()
    }
    
    public func transformDomainToEntity(domain: MealDomainModel) -> Entity? {
        return nil
    }
}
