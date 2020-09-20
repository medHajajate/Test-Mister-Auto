//
//  UserAdapter.swift
//  Test Mister Auto
//
//  Created by Mohammed Hajajate on 9/20/20.
//  Copyright © 2020 Mohammed Hajajate. All rights reserved.
//

import Foundation
import Alamofire

class UserRequest {
    
    
    static func loadUserList(success: @escaping ([User]) -> Void, failure: @escaping (Error) -> Void){
        AF.request(APIRouter.usersList)
        .responseDecodable(of: [User].self, completionHandler: { response in
                switch response.result {
                case .success(let response):
                    success(response)
                case .failure(let error):
                    print(error)
                    failure(error)
                    break
                }
        })
    }
    
    static func loadTaskList(userId: Int, success: @escaping ([Task]) -> Void, failure: @escaping (Error) -> Void){
        AF.request(APIRouter.tasksList(userId: userId))
        .responseDecodable(of: [Task].self, completionHandler: { response in
                switch response.result {
                case .success(let response):
                    success(response)
                case .failure(let error):
                    print(error)
                    failure(error)
                    break
                }
        })
    }
}
