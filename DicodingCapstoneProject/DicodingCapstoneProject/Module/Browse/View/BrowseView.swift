//
//  BrowseView.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 28/11/22.
//

import SwiftUI
import Core
import Browse
import Search

struct BrowseView: View {
    
    @ObservedObject var browsePresenter: GetListPresenter<Any, CategoryDomainModel, BrowseRouter, Browse.BrowseInteractor>
    @ObservedObject var searchPresenter: GetListPresenter<String, SearchDomainModel, BrowseRouter, Search.SearchInteractor>
    
    init(
        browsePresenter: GetListPresenter<Any, CategoryDomainModel, BrowseRouter, Browse.BrowseInteractor>,
        searchPresenter: GetListPresenter<String, SearchDomainModel, BrowseRouter, Search.SearchInteractor>
    ) {
        self.browsePresenter = browsePresenter
        self.searchPresenter = searchPresenter
    }
    
    private var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ZStack {
                if browsePresenter.isLoading {
                    ProgressView()
                } else {
                    if searchPresenter.searchMessage.isEmpty {
                        ScrollView {
                            LazyVGrid(columns: twoColumnGrid, spacing: 12) {
                                ForEach(browsePresenter.list) { category in
                                    browsePresenter.router.linkBuilder {
                                        browsePresenter.router.goToMeals(for: category)
                                    } content: {
                                        BrowseGridView(category: category)
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                        }
                        .padding(.horizontal, 8)
                    } else {
                        ScrollView {
                            LazyVGrid(columns: twoColumnGrid, spacing: 12) {
                                ForEach(searchPresenter.list) { meal in
                                    searchPresenter.router.linkBuilder {
                                        browsePresenter.router.goToDetail(for: meal.toMealDomainModel())
                                    } content: {
                                        BrowseGridView(category: meal.toCategoryDomainModel())
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Browse")
        }
        .onAppear {
            if browsePresenter.list.isEmpty {
                browsePresenter.getList(request: nil)
            }
        }
        .refreshable {
            browsePresenter.getList(request: nil)
        }
        .searchable(text: $searchPresenter.searchMessage)
        .onReceive(searchPresenter.$searchMessage.debounce(for: 1, scheduler: RunLoop.main)) { _ in
            searchPresenter.getList(request: searchPresenter.searchMessage)
        }
    }
}
