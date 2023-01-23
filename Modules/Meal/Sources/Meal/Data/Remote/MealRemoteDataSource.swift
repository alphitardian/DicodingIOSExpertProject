//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 11/01/23.
//

import Foundation
import Core
import RxSwift
import Alamofire

public struct MealRemoteDataSource: RemoteDataSource {
        
    public typealias Request = String
    public typealias Response = BaseMealResponse
    
    private let endpoint: String
    
    public init(endpoint: String) {
        self.endpoint = endpoint
    }
    
    public func execute(request: Request?) -> Observable<BaseMealResponse<MealResponse>> {
        return Observable<BaseMealResponse>.create { observer in
            if let url = URL(string: self.endpoint + (request ?? "")) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: BaseMealResponse<MealResponse>.self) { response in
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
