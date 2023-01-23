//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 20/01/23.
//

import Foundation
import Core
import RxSwift

public class FavoriteExecutablePresenter<
    Request,
    Response,
    Router: Route,
    Interactor: UseCase
>: ObservableObject where Interactor.Request == Request, Interactor.Response == Response {
    
    private let useCase: Interactor
    private let disposeBag = DisposeBag()
    public let router: Router
    
    @Published public var isFavorite: Response? = nil
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false
    
    public init(useCase: Interactor, router: Router) {
        self.useCase = useCase
        self.router = router
    }
    
    public func execute(request: Request?) {
        isLoading = true
        useCase.execute(request: request)
            .observe(on: MainScheduler.instance)
            .subscribe { response in
                self.isFavorite = response
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
