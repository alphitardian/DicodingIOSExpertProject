//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 09/01/23.
//

import SwiftUI
import RxSwift
import Core

public class GetDetailPresenter<
    Request,
    Response,
    Router: Route,
    Interactor: UseCase
>: ObservableObject where Interactor.Request == Request, Interactor.Response == Response {
    
    private let useCase: Interactor
    private let disposeBag = DisposeBag()
    public let router: Router
    
    @Published public var detail: Any?
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false
    
    public init(useCase: Interactor, router: Router, detail: Any? = nil) {
        self.useCase = useCase
        self.router = router
        self.detail = detail
    }
    
    public func getDetail(request: Request?) {
        isLoading = true
        useCase.execute(request: request)
            .observe(on: MainScheduler.instance)
            .subscribe { response in
                self.detail = response
            } onError: { error in
                self.isLoading = false
                self.isError = true
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.isLoading = false
            }
            .disposed(by: disposeBag)
    }
}
