//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 05/01/23.
//

import Core

public struct CategoryTransformer: Mapper {
    public typealias Response = CategoryResponse
    public typealias Entity = Any
    public typealias Domain = CategoryDomainModel
    
    public init() {}
    
    public func transformResponseToEntity(response: CategoryResponse) -> Entity? {
        return nil
    }
    
    public func transformEntityToDomain(entity: Entity) -> CategoryDomainModel? {
        return nil
    }
    
    public func transformResponseToDomain(response: CategoryResponse) -> CategoryDomainModel? {
        return response.toCategoryDomainModel()
    }
    
    public func transformDomainToEntity(domain: CategoryDomainModel) -> Entity? {
        return nil
    }
}
