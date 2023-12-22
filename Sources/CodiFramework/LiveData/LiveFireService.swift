//
//  LiveDataService.swift
//  Codi
//
//  Created by Charles Romeo on 12/21/23.
//

import Foundation
import RealmSwift
import FirebaseDatabase

/**
 -> INTAKE: Observe Objects from Firebase
    Then directly added into Realm
 */

public class LiveFireService<T: Object>: ObservableObject {
    let realmInstance: Realm
    var reference: DatabaseReference = Database.database().reference()
    private var observerHandle: DatabaseHandle?
    private var isObserving = false

    public init(realm: Realm) {
        self.realmInstance = realm
    }

    public func startObserving(path: String, with handler: @escaping (List<T>?) -> Void) {
        guard !isObserving else { return }
        observerHandle = reference.child(path).observe(.childAdded, with: { snapshot in
            handler(snapshot.toLudiObjects(T.self, realm: self.realmInstance))
        })
        isObserving = true
    }

    public func stopObserving() {
        guard isObserving, let handle = observerHandle else { return }
        reference.removeObserver(withHandle: handle)
        isObserving = false
        observerHandle = nil
    }
}
