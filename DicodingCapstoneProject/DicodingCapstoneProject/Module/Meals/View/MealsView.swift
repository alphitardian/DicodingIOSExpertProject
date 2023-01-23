//
//  MealsView.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 03/12/22.
//

import SwiftUI
import Meal
import Browse
import Core

struct MealsView: View {
    
    @ObservedObject var presenter: GetListPresenter<String, MealDomainModel, MealsRouter, Meal.MealsInteractor>
    
    var body: some View {
        ZStack {
            if presenter.isLoading {
                ProgressView()
            } else {
                ScrollView {
                    ForEach(presenter.list) { meal in
                        presenter.router.linkBuilder {
                            presenter.router.goToDetail(for: meal)
                        } content: {
                            MealCardView(meal: meal, category: presenter.searchMessage)
                        }
                        .foregroundColor(.black)
                    }
                }
            }
        }
        .navigationTitle("Meals")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            presenter.getList(request: presenter.searchMessage)
        }
    }
}
