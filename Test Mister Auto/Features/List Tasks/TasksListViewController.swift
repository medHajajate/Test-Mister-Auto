//
//  TasksListViewController.swift
//  Test Mister Auto
//
//  Created by Mohammed Hajajate on 9/19/20.
//  Copyright © 2020 Mohammed Hajajate. All rights reserved.
//

import UIKit

class TasksListViewController: UIViewController {

    class func instatiante(with user: User) -> TasksListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "TasksListViewController") as! TasksListViewController
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}
