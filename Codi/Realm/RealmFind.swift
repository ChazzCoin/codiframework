//
//  RealmFind.swift
//  Ludi Boards
//
//  Created by Charles Romeo on 11/13/23.
//

import Foundation
import RealmSwift

extension Realm {
    public func findByField<T: Object>(_ type: T.Type, field: String = "id", value: String?) -> T? {
        guard let value = value else { return nil }
        return objects(type).filter("\(field) == %@", value).first
    }
    
    public func findAllByField<T: Object>(_ type: T.Type, field: String, value: Any) -> Results<T>? {
        return self.objects(type).filter("%K == %@", field, value)
    }
    
    public func findAllNotByField<T: Object>(_ type: T.Type, field: String, value: Any) -> Results<T>? {
        return self.objects(type).filter("%K != %@", field, value)
    }
    
//    func getCurrentUserSession() -> CurrentSession? {
//        return self.findByField(CurrentSession.self, value: "SOL")
//    }
}

extension Results {
    public func toArray() -> [Element] {
        return Array(self)
    }
}
