//
//  MealsInteractor.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 04/12/22.
//

import Foundation
import RxSwift
import Browse

protocol MealsUseCase {
    func getMeals(from category: String) -> Observable<[MealModel]>
    func getCategory() -> CategoryDomainModel
}

class MealsInteractor: MealsUseCase {
    
    private let repository: FoodRepository
    private let category: CategoryDomainModel
    
    required init(repository: FoodRepository, category: CategoryDomainModel) {
        self.repository = repository
        self.category = category
    }
    
    func getMeals(from category: String) -> Observable<[MealModel]> {
        return repository.getMeals(from: category)
    }
    
    func getCategory() -> CategoryDomainModel {
        return category
    }
}
