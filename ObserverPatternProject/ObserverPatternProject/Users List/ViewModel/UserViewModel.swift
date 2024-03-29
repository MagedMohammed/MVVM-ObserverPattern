//
//  UserViewModel.swift
//  ObserverPatternProject
//
//  Created by Youxel MacBook 8 on 8/20/19.
//  Copyright © 2019 Youxel Maged Mohammed. All rights reserved.
//

import Foundation
class UserViewModel{
    //    MARK:- Properties
    var userObserver = GenericDynamic<[Users]>([Users]())
    
    //    MARK:- Func Get Data
    //    Get Data From Server
    func getData(){
        Api.getUserList { (users:[Users]?) in
            guard let users = users else{return}
            self.userObserver.value = users
        }
    }
    
    
}


