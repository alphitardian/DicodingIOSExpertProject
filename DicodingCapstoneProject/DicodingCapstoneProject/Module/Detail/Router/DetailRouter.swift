//
//  DetailRouter.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 04/12/22.
//

import SwiftUI
import Core
import Detail

class DetailRouter: Route {
    
    private let router: Router
    
    public init(router: Router) {
        self.router = router
    }
    
    func goToTutorial(model: MealDetailDomainModel) {
        if let url = URL(string: model.youtubeLink), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}
