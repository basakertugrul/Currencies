//
//  Task.swift
//  Currency
//
//  Created by Başak Ertuğrul on 8.06.2023.
//

import RealmSwift

class Task: Object {
    @Persisted(primaryKey: true) var id: String = ""
    @Persisted var title: String = ""
    @Persisted var isCompleted: Bool = false
    convenience init(title: String) {
        self.init()
        self.title = title
    }
}

