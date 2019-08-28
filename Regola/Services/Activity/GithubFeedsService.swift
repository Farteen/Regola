//
//  GithubFeedsService.swift
//  Regola
//
//  Created by yysz02 on 2019/8/28.
//  Copyright © 2019 farteen. All rights reserved.
//

import Foundation
import Moya

enum GithubFeedsService {
    case Feeds
}

extension GithubFeedsService: TargetType {
    var baseURL: URL{ return URL(string: "https://api.github.com")! }
    
    var path: String {
        return "/feeds"
    }
    
    var method: Moya.Method {
        return Moya.Method.get
    }
    
    var sampleData: Data {
        return "sample".data(using: .utf8)!
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return [
            "Accept":"application/vnd.github.v3+json"
        ]
    }
    
    
}
