//
//  TasksListViewModel.swift
//  Test Mister Auto
//
//  Created by Mohammed Hajajate on 9/19/20.
//  Copyright © 2020 Mohammed Hajajate. All rights reserved.
//

import Foundation

class TasksListViewModel {
    
    var tasks = [Task]()
    
    var selectedUser: User?
    
    init(user: User) {
        self.selectedUser = user
    }
    
    func loadTasks(completion: @escaping (Bool, Error?) -> Void) {
        guard let userId = selectedUser?.id else {
            completion(false, nil)
            return }
        UserRequest.loadTaskList(userId: userId, success: { tasks in
            self.tasks = tasks
            completion(true, nil)
        }) { error in
            completion(false, error)
        }
        
    }
}
