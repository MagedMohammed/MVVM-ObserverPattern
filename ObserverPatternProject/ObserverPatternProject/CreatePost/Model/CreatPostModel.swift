//
//  CreatPostModel.swift
//  ObserverPatternProject
//
//  Created by Youxel MacBook 8 on 8/26/19.
//  Copyright © 2019 Youxel Maged Mohammed. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

//@escaping
extension Api{
    
    static func creatPost(parameters:[String:Any], compltionHandler: @escaping (_ postCase:[String:String]?) -> (Void)){
        
        Alamofire.request(GetDataRouter.createPost(parameters)).responseJSON { respons in
            switch respons.result{
            case .success(let value):
                print("\(value)")
                compltionHandler(nil)
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    
}


