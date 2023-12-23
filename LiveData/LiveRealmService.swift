//
//  LiveRealmService.swift
//  Codi
//
//  Created by Charles Romeo on 12/21/23.
//

import Foundation
import RealmSwift

public class LiveRealmService<T: Object>: ObservableObject {
    private var notificationToken: NotificationToken?
    private let realmInstance: Realm
    
    var onInitial: ((Results<T>) -> Void)?
    var onChange: ((T) -> Void)?
    var onUpdate: ((Results<T>) -> Void)?
    var onError: ((Error) -> Void)?
    var onDelete: (() -> Void)?

    public init(realm: Realm) {
        self.realmInstance = realm
    }

    public func startObserving(primaryKey:String) {
        if let object = realmInstance.object(ofType: T.self, forPrimaryKey: primaryKey) {
            notificationToken = object.observe { [weak self] change in
                guard let self = self else { return }
                switch change {
                case .change(let obj, _):
                    guard let observedObject = obj as? T else { return }
                    self.onChange?(observedObject)
                case .error(let error):
                    self.onError?(error)
                case .deleted:
                    self.onDelete?()
                }
            }
        }
    }
    
    public func startObserving(element: Object?) {
        if let object = element {
            notificationToken = object.observe { [weak self] change in
                guard let self = self else { return }
                switch change {
                case .change(let obj, _):
                    guard let observedObject = obj as? T else { return }
                    self.onChange?(observedObject)
                case .error(let error):
                    self.onError?(error)
                case .deleted:
                    self.onDelete?()
                }
            }
        }
    }
    
    public func startObserving(elements: Results<T>?) {
        if let object = elements {
            notificationToken = object.observe { (changes: RealmCollectionChange) in
                switch changes {
                    case .initial(let results):
                        self.onInitial?(results)
                    case .update(let results, _, _, _):
                        self.onUpdate?(results)
                    case .error(let err):
                        print("Realm Listener: error")
                        self.onError?(err)
                }
            }
        }
    }

    public func stopObserving() {
        notificationToken?.invalidate()
    }

    deinit {
        stopObserving()
    }
}
