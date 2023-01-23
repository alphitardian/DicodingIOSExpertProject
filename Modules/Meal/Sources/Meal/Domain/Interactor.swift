//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 20/01/23.
//

import Foundation
import Core
import Browse

public typealias MealsInteractor = Interactor<String, [MealDomainModel], MealRepository<MealRemoteDataSource, MealTransformer>>
