//
//  Injection.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 01/12/22.
//

import RealmSwift
import SwiftUI
import Browse
import Search
import Detail
import Meal
import Favorite
import Core

class Injection: NSObject {
        
    private func provideRepository() -> FoodRepository {
        let localDataSource = LocalDataSourceImpl.shared(provideRealm())
        let remoteDataSource = RemoteDataSourceImpl.shared
        
        return FoodRepositoryImpl.shared(remoteDataSource, localDataSource)
    }
    
    func provideRealm() -> Realm? {
        return try! Realm()
    }
    
    func provideMealsUseCase(for category: CategoryDomainModel) -> MealsUseCase {
        let repository = provideRepository()
        return MealsInteractor(repository: repository, category: category)
    }
    
    func provideDetailUseCase(for meal: MealModel) -> DetailUseCase {
        let repository = provideRepository()
        return DetailInteractor(repository: repository, meal: meal)
    }
    
    func provideFavoriteUseCase() -> FavoriteUseCase {
        let repository = provideRepository()
        return FavoriteInteractor(repository: repository)
    }
    
    func provideCategory<U: UseCase>() -> U where U.Request == Any, U.Response == [CategoryDomainModel] {
        let remote = BrowseRemoteDataSource(endpoint: Endpoints.Gets.categories.url)
        let mapper = CategoryTransformer()
        let repository = BrowseRepository(remoteDataSource: remote, mapper: mapper)
        
        return Interactor(_repository: repository) as! U
    }
    
    func provideSearch<U: UseCase>() -> U where U.Request == String, U.Response == [SearchDomainModel] {
        let remote = SearchRemoteDataSource(endpoint: Endpoints.Gets.search.url)
        let mapper = SearchTransformer()
        let repository = SearchRepository(remoteDataSource: remote, mapper: mapper)
        
        return Interactor(_repository: repository) as! U
    }
    
    func provideDetail<U: UseCase>() -> U where U.Request == String, U.Response == [MealDetailDomainModel] {
        let remote = DetailRemoteDataSource(endpoint: Endpoints.Gets.meal.url)
        let mapper = DetailTransformer()
        let repository = DetailRepository(remoteDataSource: remote, mapper: mapper)
        
        return Interactor(_repository: repository) as! U
    }
    
    func provideMeals<U: UseCase>() -> U where U.Request == String, U.Response == [MealDomainModel] {
        let remote = MealRemoteDataSource(endpoint: Endpoints.Gets.meals.url)
        let mapper = MealTransformer()
        let repository = MealRepository(remoteDataSource: remote, mapper: mapper)
        
        return Interactor(_repository: repository) as! U
    }
    
    func provideGetFavorite<U: UseCase>() -> U where U.Request == Any, U.Response == [FavoriteDomainModel] {
        let local = FavoriteLocalDataSource(realm: provideRealm())
        let mapper = FavoriteTransformer()
        let repository = GetFavoriteRepository(localDataSource: local, mapper: mapper)
        
        return Interactor(_repository: repository) as! U
    }
    
    func provideAddFavorite<U: UseCase>() -> U where U.Request == FavoriteDomainModel, U.Response == Bool {
        let local = FavoriteLocalDataSource(realm: provideRealm())
        let mapper = FavoriteTransformer()
        let repository = AddFavoriteRepository(localDataSource: local, mapper: mapper)
        
        return Interactor(_repository: repository) as! U
    }
    
    func provideRemoveFavorite<U: UseCase>() -> U where U.Request == FavoriteDomainModel, U.Response == Bool {
        let local = FavoriteLocalDataSource(realm: provideRealm())
        let mapper = FavoriteTransformer()
        let repository = RemoveFavoriteRepository(localDataSource: local, mapper: mapper)
        
        return Interactor(_repository: repository) as! U
    }
}

/// Provide route injection
extension Injection {
    
    func provideBrowseRouter() -> BrowseRouter {
        let router = Router()
        return BrowseRouter(router: router)
    }
    
    func provideMealsRouter() -> MealsRouter {
        let router = Router()
        return MealsRouter(route: router)
    }
    
    func provideDetailRouter() -> DetailRouter {
        let router = Router()
        return DetailRouter(router: router)
    }
    
    func provideFavoriteRouter() -> FavoriteRouter {
        let router = Router()
        return FavoriteRouter(router: router)
    }
}
