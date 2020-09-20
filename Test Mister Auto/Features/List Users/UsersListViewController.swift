//
//  UsersListViewController.swift
//  Test Mister Auto
//
//  Created by Mohammed Hajajate on 9/19/20.
//  Copyright © 2020 Mohammed Hajajate. All rights reserved.
//

import UIKit

class UsersListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = UsersListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadUsers()
    }
}

extension UsersListViewController {
    
    private func setupTableView() {
        self.tableView.register(UINib(nibName: UserTableViewCell.className, bundle: nil), forCellReuseIdentifier: UserTableViewCell.className)
        self.tableView.tableFooterView = UIView()
        self.tableView.delegate = self
        self.tableView.dataSource =  self
    }
    
    private func loadUsers() {
        self.startActivityIndicator()
        viewModel.loadUsers { (isSuccess, error) in
            self.stopActivityIndicator()
            if isSuccess {
                self.tableView.reloadData()
            } else if let error = error {
                self.showError(error: error)
            }
        }
    }
}

extension UsersListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.className, for: indexPath) as! UserTableViewCell
        cell.update(with: viewModel.userList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let controller = TasksListViewController.instatiante(with: viewModel.userList[indexPath.row])
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
