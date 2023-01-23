//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 20/01/23.
//

import Core

public typealias GetFavoriteInteractor = Interactor<Any, [FavoriteDomainModel], GetFavoriteRepository<FavoriteLocalDataSource, FavoriteTransformer>>

public typealias AddFavoriteInteractor = Interactor<FavoriteDomainModel, Bool, AddFavoriteRepository<FavoriteLocalDataSource, FavoriteTransformer>>

public typealias RemoveFavoriteInteractor = Interactor<FavoriteDomainModel, Bool, RemoveFavoriteRepository<FavoriteLocalDataSource, FavoriteTransformer>>
