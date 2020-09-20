//
//  UsersListViewModel.swift
//  Test Mister Auto
//
//  Created by Mohammed Hajajate on 9/19/20.
//  Copyright © 2020 Mohammed Hajajate. All rights reserved.
//

import Foundation

class UsersListViewModel {
    
    var userList = [User]()
    
    init() {}
    
    func loadUsers(completion: @escaping (Bool, Error?) -> Void) {
        UserRequest.loadUserList(success: { users in
            self.userList = users
            completion(true, nil)
        }) { error in
            completion(false, error)
        }
        
    }
}
