//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 08/01/23.
//

import Foundation
import Core

public struct SearchTransformer: Mapper {
    
    public typealias Response = BaseMealResponse<SearchResponse>
    public typealias Entity = Any
    public typealias Domain = [SearchDomainModel]
    
    public init() {}
    
    public func transformResponseToEntity(response: Core.BaseMealResponse<SearchResponse>) -> Entity? {
        return nil
    }
    
    public func transformEntityToDomain(entity: Entity) -> [SearchDomainModel]? {
        return nil
    }
    
    public func transformResponseToDomain(response: Core.BaseMealResponse<SearchResponse>) -> [SearchDomainModel]? {
        return response.meals.map { response in
            response.toSearchDomainModel()
        }
    }
    
    public func transformDomainToEntity(domain: [SearchDomainModel]) -> Entity? {
        return nil
    }
}
