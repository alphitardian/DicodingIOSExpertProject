//
//  DicodingCapstoneProjectApp.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 28/11/22.
//

import SwiftUI
import Browse
import Search
import Core
import Detail
import Meal
import Favorite

@main
struct DicodingCapstoneProjectApp: SwiftUI.App {
    
    /// Provide browse presenter
    private let browseUseCase: Browse.BrowseInteractor = Injection.init().provideCategory()
    private let browseRouter: BrowseRouter = Injection.init().provideBrowseRouter()
    private var browsePresenter: GetListPresenter<Any, CategoryDomainModel, BrowseRouter, Browse.BrowseInteractor> {
        return GetListPresenter(useCase: browseUseCase, router: browseRouter)
    }
    
    /// Provide search presenter
    private let searchUseCase: Search.SearchInteractor = Injection.init().provideSearch()
    private var searchPresenter: GetListPresenter<String, SearchDomainModel, BrowseRouter, Search.SearchInteractor> {
        return GetListPresenter(useCase: searchUseCase, router: browseRouter)
    }
    
    /// Provide favorite presenter
    private let favoriteUseCase: Favorite.GetFavoriteInteractor = Injection.init().provideGetFavorite()
    private let favoriteRouter: FavoriteRouter = Injection.init().provideFavoriteRouter()
    private var favoritePresenter: GetFavoritePresenter<FavoriteDomainModel, FavoriteRouter, Favorite.GetFavoriteInteractor> {
        return GetFavoritePresenter(useCase: favoriteUseCase, router: favoriteRouter)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(browsePresenter)
                .environmentObject(searchPresenter)
                .environmentObject(favoritePresenter)
        }
    }
}
