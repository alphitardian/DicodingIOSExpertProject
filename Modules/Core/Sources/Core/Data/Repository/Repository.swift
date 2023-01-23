//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 02/01/23.
//

import RxSwift

public protocol Repository {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> Observable<Response>
}
