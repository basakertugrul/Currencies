//
//  TasksViewModel.swift
//  Currency
//
//  Created by Başak Ertuğrul on 8.06.2023.
//

import Foundation
import RealmSwift

class TasksViewModel: ObservableObject {
    private let realm: Realm
    private let apiService: APIService
    @Published var tasks: Results<Task>
    init(realm: Realm, apiService: APIService) {
        self.realm = realm
        self.apiService = apiService
        tasks = realm.objects(Task.self)
    }
    
    // ... other methods for managing tasks
}
