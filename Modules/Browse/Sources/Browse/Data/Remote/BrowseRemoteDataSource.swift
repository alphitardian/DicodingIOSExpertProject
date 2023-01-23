//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 03/01/23.
//

import Foundation
import Core
import RxSwift
import Alamofire

public struct BrowseRemoteDataSource: RemoteDataSource {
    
    public typealias Request = Any
    public typealias Response = BaseCategoryResponse
    
    private let endpoint: String
    
    public init(endpoint: String) {
        self.endpoint = endpoint
    }
    
    public func execute(request: Request?) -> Observable<BaseCategoryResponse> {
        return Observable<BaseCategoryResponse>.create { observer in
            if let url = URL(string: self.endpoint) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: BaseCategoryResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value)
                            observer.onCompleted()
                        case .failure(let error):
                            observer.onError(error)
                        }
                    }
            }
            
            return Disposables.create()
        }
    }
    
}
