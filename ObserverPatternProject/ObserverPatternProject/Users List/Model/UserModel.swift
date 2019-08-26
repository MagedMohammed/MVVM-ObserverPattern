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

class Api{
    static func getUserList(completionHandler: @escaping(_ users:[Users]?) -> Void)
    {
        Alamofire.request(GetDataRouter.users).responseJSON { response in
            switch response.result{
            case .success(let value):
                guard let data = value as? [[String:Any]] else{ return }
                let dataMapper = Mapper<Users>().mapArray(JSONArray: data)
                completionHandler(dataMapper)
            //  print("")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
