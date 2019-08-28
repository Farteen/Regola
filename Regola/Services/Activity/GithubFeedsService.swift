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
    var baseURL: URL {
        <#code#>
    }
    
    var path: String {
        <#code#>
    }
    
    var method: Moya.Method {
        return Moya.Method.get
    }
    
    var sampleData: Data {
        <#code#>
    }
    
    var task: Task {
        <#code#>
    }
    
    var headers: [String : String]? {
        <#code#>
    }
    
    
}
