//
//  DetailView.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 04/12/22.
//

import SwiftUI
import Core
import Detail
import Browse
import Favorite

struct DetailView: View {
    
    @ObservedObject var detailPresenter: GetDetailPresenter<String, [MealDetailDomainModel], DetailRouter, Detail.DetailInteractor>
    @ObservedObject var getFavoritePresenter: GetFavoritePresenter<FavoriteDomainModel, DetailRouter, Favorite.GetFavoriteInteractor>
    @ObservedObject var addFavoritePresenter: FavoriteExecutablePresenter<FavoriteDomainModel, Bool, DetailRouter, Favorite.AddFavoriteInteractor>
    @ObservedObject var removeFavoritePresenter: FavoriteExecutablePresenter<FavoriteDomainModel, Bool, DetailRouter, Favorite.RemoveFavoriteInteractor>
    
    var body: some View {
        ZStack {
            if detailPresenter.isLoading {
                ProgressView()
            } else {
                if let mealDetail = detailPresenter.detail as? [MealDetailDomainModel], let detail = mealDetail.first {
                    ScrollView {
                        VStack(alignment: .leading) {
                            RemoteImageView(url: URL(string: detail.thumbnail))
                                .frame(height: 300)
                                .aspectRatio(contentMode: .fill)
                            Text(detail.name)
                                .bold()
                                .font(.title)
                                .padding(.horizontal)
                            Text("\(detail.category) / \(detail.area)")
                                .padding(.horizontal)
                            Button {
                                detailPresenter.router.goToTutorial(model: detail)
                            } label: {
                                Text("Watch Tutorial")
                                    .frame(maxWidth: .infinity)
                            }
                            .cornerRadius(20)
                            .buttonStyle(.bordered)
                            .padding([.horizontal, .bottom])
                            Text("Instruction")
                                .bold()
                                .padding(.horizontal)
                            Text(detail.instructions)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .navigationTitle("Instruction")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            Button {
                let meal = detailPresenter.detail as! [MealDetailDomainModel]
                let favorite = meal.first?.toFavoriteDomainModel()
                if getFavoritePresenter.isFavorite {
                    removeFavoritePresenter.execute(request: favorite)
                } else {
                    addFavoritePresenter.execute(request: favorite)
                }
                getFavoritePresenter.getFavorites(id: meal.first?.id ?? "")
            } label: {
                Image(systemName: getFavoritePresenter.isFavorite ? "star.fill" : "star")
            }
        }
        .onAppear {
            let mealDetail = detailPresenter.detail as? MealDomainModel
            detailPresenter.getDetail(request: mealDetail?.id)
            getFavoritePresenter.getFavorites(id: mealDetail?.id ?? "")
        }
    }
}
