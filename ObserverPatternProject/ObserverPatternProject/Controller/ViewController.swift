//
//  ViewController.swift
//  ObserverPatternProject
//
//  Created by Youxel MacBook 8 on 8/20/19.
//  Copyright © 2019 Youxel Maged Mohammed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- Outlet
    @IBOutlet private weak var userTableView: UITableView!
    
    //MARK:- Properties
    var userData = [Users]()
    var viewModel = UserViewModel()
    
    // MARK:- Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        self.userTableView.delegate = self
        self.userTableView.dataSource = self
        self.viewModel.getData()
    }
    
    func bindViewModel(){
        viewModel.userObserver.bindAndFire({ users in
            self.userData = users
            self.userTableView.reloadData()
        })
        
    }
    
}


extension ViewController:UITableViewDelegate{
    
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UserCell = userTableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        cell.textLabel?.text = self.userData[indexPath.row].username
        return cell
    }
    
    
}
