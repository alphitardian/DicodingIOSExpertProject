//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 05/01/23.
//

public protocol Mapper {
    associatedtype Response
    associatedtype Entity
    associatedtype Domain
    
    func transformResponseToEntity(response: Response) -> Entity?
    func transformEntityToDomain(entity: Entity) -> Domain?
    func transformResponseToDomain(response: Response) -> Domain?
    func transformDomainToEntity(domain: Domain) -> Entity?
}
