//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 02/01/23.
//

import RxSwift

public struct Interactor<
    Request,
    Response,
    R: Repository
>: UseCase where R.Request == Request, R.Response == Response {
    
    private let _repository: R
    
    public init(_repository: R) {
        self._repository = _repository
    }
    
    public func execute(request: Request?) -> Observable<Response> {
        _repository.execute(request: request)
    }
}
