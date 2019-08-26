//
//  CreatePostViewController.swift
//  ObserverPatternProject
//
//  Created by Youxel MacBook 8 on 8/26/19.
//  Copyright © 2019 Youxel Maged Mohammed. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController {
    
    
    // MARK:- Outlets
    
    @IBOutlet weak private var titleTextFiled: UITextField!
    @IBOutlet weak private var bodyTextFiled:UITextField!

    
    // MARK:- ViewController LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK:- Actions - Create Post
    
    @IBAction private func createPost(_ sender:UIButton){
        
        guard let title = self.titleTextFiled.text,!title.isEmpty,
            let body = self.bodyTextFiled.text,!body.isEmpty else{
                return
        }
        let parameters = ["title": title, "body": body, "userId": "1"]
        Api.creatPost(parameters: parameters) { (result) -> (Void) in
            print(result)
        }
    }
    
    ///
    
    
    
}
