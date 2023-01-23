//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 20/01/23.
//

import Foundation
import Core
import RxSwift

public class GetFavoritePresenter<
    Response,
    Router: Route,
    Interactor: UseCase
>: ObservableObject where Interactor.Response == [Response] {
    
    private let useCase: Interactor
    private let disposeBag = DisposeBag()
    public let router: Router
    
    @Published public var list: [Response] = []
    @Published public var isFavorite: Bool = false
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false
    
    public init(useCase: Interactor, router: Router) {
        self.useCase = useCase
        self.router = router
    }
    
    public func getFavorites(id: String) {
        isLoading = true
        useCase.execute(request: nil)
            .observe(on: MainScheduler.instance)
            .subscribe { response in
                self.list = response
                self.isFavorite = response.contains { data in
                    let favorite = data as! FavoriteDomainModel
                    return favorite.id == id
                }
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
