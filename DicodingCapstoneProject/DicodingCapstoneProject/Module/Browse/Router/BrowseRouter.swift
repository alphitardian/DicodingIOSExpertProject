//
//  BrowseRouter.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 03/12/22.
//

import SwiftUI
import Core
import Browse
import Detail
import Meal
import Favorite

class BrowseRouter: Route {
    
    private let router: Router
    
    public init(router: Router) {
        self.router = router
    }
    
    func goToMeals(for category: CategoryDomainModel) -> some View {
        let mealsUseCase: Meal.MealsInteractor = Injection.init().provideMeals()
        let mealsRouter: MealsRouter = Injection.init().provideMealsRouter()
        var mealsPresenter: GetListPresenter<String, MealDomainModel, MealsRouter, Meal.MealsInteractor> {
            return GetListPresenter(useCase: mealsUseCase, router: mealsRouter, search: category.title)
        }
        return MealsView(presenter: mealsPresenter)
    }
    
    func goToDetail(for meal: MealDomainModel) -> some View {
        let detailUseCase: Detail.DetailInteractor = Injection.init().provideDetail()
        let detailRouter: DetailRouter = Injection.init().provideDetailRouter()
        var detailPresenter: GetDetailPresenter<String, [MealDetailDomainModel], DetailRouter, Detail.DetailInteractor> {
            return GetDetailPresenter(useCase: detailUseCase, router: detailRouter, detail: meal)
        }
        
        let getFavoriteUseCase: Favorite.GetFavoriteInteractor = Injection.init().provideGetFavorite()
        let addFavoriteUseCase: Favorite.AddFavoriteInteractor = Injection.init().provideAddFavorite()
        let removeFavoriteUseCase: Favorite.RemoveFavoriteInteractor = Injection.init().provideRemoveFavorite()
        var getFavoritePresenter: GetFavoritePresenter<FavoriteDomainModel, DetailRouter, Favorite.GetFavoriteInteractor> {
            return GetFavoritePresenter(useCase: getFavoriteUseCase, router: detailRouter)
        }
        var addFavoritePresenter: FavoriteExecutablePresenter<FavoriteDomainModel, Bool, DetailRouter, Favorite.AddFavoriteInteractor> {
            return FavoriteExecutablePresenter(useCase: addFavoriteUseCase, router: detailRouter)
        }
        var removeFavoritePresenter: FavoriteExecutablePresenter<FavoriteDomainModel, Bool, DetailRouter, Favorite.RemoveFavoriteInteractor> {
            return FavoriteExecutablePresenter(useCase: removeFavoriteUseCase, router: detailRouter)
        }
        
        return DetailView(
            detailPresenter: detailPresenter,
            getFavoritePresenter: getFavoritePresenter,
            addFavoritePresenter: addFavoritePresenter,
            removeFavoritePresenter: removeFavoritePresenter
        )
    }
    
    func linkBuilder(destination: () -> some View, content: () -> some View) -> some View {
        return NavigationLink {
            destination()
        } label: {
            content()
        }
    }
}
