//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 20/01/23.
//

import Foundation
import Core

public typealias DetailInteractor = Interactor<String, [MealDetailDomainModel], DetailRepository<DetailRemoteDataSource, DetailTransformer>>
