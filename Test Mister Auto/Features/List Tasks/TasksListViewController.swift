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
        controller.viewModel = TasksListViewModel(user: user)
        return controller
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: TasksListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadTasks()
        self.title = viewModel?.selectedUser?.name
    }
    
}

extension TasksListViewController {
    
    private func setupTableView() {
        self.tableView.register(UINib(nibName: UserTableViewCell.className, bundle: nil), forCellReuseIdentifier: UserTableViewCell.className)
        self.tableView.tableFooterView = UIView()
        self.tableView.delegate = self
        self.tableView.dataSource =  self
    }
    
    private func loadTasks() {
        self.startActivityIndicator()
        viewModel?.loadTasks { (isSuccess, error) in
            self.stopActivityIndicator()
            if isSuccess {
                self.tableView.reloadData()
            } else if let error = error {
                self.showError(error: error)
            }
        }
    }
    
}

extension TasksListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.tasks.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let task = viewModel?.tasks[indexPath.row] {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.className, for: indexPath) as! UserTableViewCell
            cell.update(with: task)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
