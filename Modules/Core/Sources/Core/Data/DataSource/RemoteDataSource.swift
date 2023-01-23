//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 21/12/22.
//

import RxSwift

public protocol RemoteDataSource {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> Observable<Response>
}
