//
//  ViewController.swift
//  Regola
//
//  Created by yysz02 on 2019/8/28.
//  Copyright © 2019 farteen. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let provider = MoyaProvider<GithubEventService>()
        provider.request(.RepositoryEvents(owner: "Moya", repo: "Moya")) { (result) in
            print("\(result)")
        }
        // Do any additional setup after loading the view.
    }


}

