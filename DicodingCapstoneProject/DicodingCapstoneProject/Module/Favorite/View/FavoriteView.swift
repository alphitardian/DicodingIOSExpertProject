//
//  FavoriteView.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 06/12/22.
//

import SwiftUI
import Favorite

struct FavoriteView: View {
    
    @ObservedObject var presenter: GetFavoritePresenter<FavoriteDomainModel, FavoriteRouter, Favorite.GetFavoriteInteractor>
    
    var body: some View {
        NavigationStack {
            ZStack {
                if presenter.list.isEmpty {
                    Text("No Favorite Saved")
                } else {
                    ScrollView {
                        ForEach(presenter.list) { favorite in
                            presenter.router.linkBuilder {
                                presenter.router.goToDetail(for: favorite.toMealDomainModel())
                            } content: {
                                MealCardView(meal: favorite.toMealDomainModel(), category: favorite.category)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favorite")
            .onAppear {
                presenter.getFavorites(id: "")
            }
        }
    }
}
