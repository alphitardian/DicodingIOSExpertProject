//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 06/01/23.
//

import Foundation
import Core
import RxSwift
import Alamofire

public struct SearchRemoteDataSource: RemoteDataSource {
    
    public typealias Request = String
    public typealias Response = BaseMealResponse<SearchResponse>
    
    private let endpoint: String
    
    public init(endpoint: String) {
        self.endpoint = endpoint
    }
    
    public func execute(request: String?) -> Observable<Response> {
        return Observable<Response>.create { observer in
            if let url = URL(string: "\(self.endpoint)\(request ?? "")") {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: Response.self) { response in
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
