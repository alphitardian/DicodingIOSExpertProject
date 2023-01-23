//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 20/01/23.
//

import Foundation
import Core

public typealias SearchInteractor = Interactor<String, [SearchDomainModel], SearchRepository<SearchRemoteDataSource, SearchTransformer>>
