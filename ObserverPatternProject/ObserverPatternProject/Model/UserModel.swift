//
//  UserModel.swift
//  ObserverPatternProject
//
//  Created by Youxel MacBook 8 on 8/20/19.
//  Copyright © 2019 Youxel Maged Mohammed. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

//https://jsonplaceholder.typicode.com/users

class Api{
    static func getUserList(completionHandler: @escaping(_ users:[Users]?) -> Void)
    {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        
        Alamofire.request(url!, method: .get, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result
                {
                case .success:
                    let responseJSON =  response.result.value as! [[String:Any]]
//                    print(responseJSON)
                    let data = Mapper<Users>().mapArray(JSONArray: responseJSON)
                    completionHandler(data)
                case .failure(let error):
                    print(error)
                }
        }
    }
}
