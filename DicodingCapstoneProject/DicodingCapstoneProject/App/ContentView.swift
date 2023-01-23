//
//  ContentView.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 28/11/22.
//

import SwiftUI
import Browse
import Search
import Core
import Favorite

struct ContentView: View {
    
    @EnvironmentObject var browsePresenter: GetListPresenter<Any, CategoryDomainModel, BrowseRouter, Browse.BrowseInteractor>
    @EnvironmentObject var searchPresenter: GetListPresenter<String, SearchDomainModel, BrowseRouter, Search.SearchInteractor>
    @EnvironmentObject var favoritePresenter: GetFavoritePresenter<FavoriteDomainModel, FavoriteRouter, Favorite.GetFavoriteInteractor>
    
    var body: some View {
        TabView {
            BrowseView(browsePresenter: browsePresenter, searchPresenter: searchPresenter)
                .tabItem {
                    Label("Browse", systemImage: "house.fill")
                }
            FavoriteView(presenter: favoritePresenter)
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
