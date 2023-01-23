//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 16/01/23.
//

import Foundation
import RxSwift
import RealmSwift
import Core

public struct FavoriteLocalDataSource: LocalDataSource {
    
    public typealias Request = FavoriteEntity
    public typealias Response = FavoriteEntity
    
    private let realm: Realm?
    
    public init(realm: Realm?) {
        self.realm = realm
    }
    
    public func list(request: Request?) -> Observable<[FavoriteEntity]> {
        return Observable<[FavoriteEntity]>.create { observer in
            if let realm = self.realm {
                let favorites = {
                    realm.objects(FavoriteEntity.self)
                        .sorted(byKeyPath: "name")
                }()
                observer.onNext(favorites.toArray(ofType: FavoriteEntity.self))
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    public func add(entity: Request) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    try realm.write {
                        realm.add(entity)
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                } catch {
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
    
    public func remove(entity: Request) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    let predicate = NSPredicate(format: "id == %@", entity.id)
                    if let deletedMeal = realm.objects(FavoriteEntity.self).filter(predicate).first {
                        try realm.write {
                            realm.delete(deletedMeal)
                            observer.onNext(true)
                            observer.onCompleted()
                        }
                    }
                } catch {
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
