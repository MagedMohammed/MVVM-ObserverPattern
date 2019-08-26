//
//  Observer.swift
//  ObserverPatternProject
//
//  Created by Youxel MacBook 8 on 8/21/19.
//  Copyright © 2019 Youxel Maged Mohammed. All rights reserved.
//

import Foundation

class GenericDynamic<T>{
    
    
    //MARK:- typeAlias
    typealias Observer = (T) -> ()
    
    //MARK:- init
    init(_ v:T){
        self.value = v
    }
    
    //MARK:- Propertis
    var observer:Observer?
    var value:T{
        didSet{
            self.observer?(value)
        }
    }
    
    //MARK:- Func Bind & BindAndFire
    func bind(_ listenr:Observer?){
        self.observer = listenr
    }
    
    func bindAndFire(_ observer:Observer?){
        self.observer = observer
        self.observer?(value)
    }
    

}

