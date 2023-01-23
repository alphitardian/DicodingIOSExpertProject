//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 21/12/22.
//

import RxSwift

public protocol LocalDataSource {
    associatedtype Request
    associatedtype Response
    
    func list(request: Request?) -> Observable<[Response]>
    func add(entity: Request) -> Observable<Bool>
    func remove(entity: Request) -> Observable<Bool>
}
