//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 02/01/23.
//

import SwiftUI
import RxSwift

public class GetListPresenter<
    Request,
    Response,
    Router: Route,
    Interactor: UseCase
>: ObservableObject where Interactor.Request == Request, Interactor.Response == [Response] {
    
    private let useCase: Interactor
    private let disposeBag = DisposeBag()
    public let router: Router
    
    @Published public var list: [Response] = []
    @Published public var searchMessage: String = ""
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false
    
    public init(useCase: Interactor, router: Router, search: String = "") {
        self.useCase = useCase
        self.router = router
        self.searchMessage = search
    }
    
    public func getList(request: Request?) {
        isLoading = true
        useCase.execute(request: request)
            .observe(on: MainScheduler.instance)
            .subscribe { list in
                self.list = list
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
