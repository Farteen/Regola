//
//  GithubWatchingService.swift
//  Regola
//
//  Created by yysz02 on 2019/8/28.
//  Copyright © 2019 farteen. All rights reserved.
//

import Foundation
import Moya

enum GithubWatchingService {
    case ListWatchers(owner: String, repo: String)
    case ListRepositoriesBeingWatched(username: String)
    case GetARepositorySubscription(owner: String, repo: String)
    case SetARepositorySubscription(owner: String, repo: String)
    case DeleteARepositorySubscription(owner: String, repo: String)
}

extension GithubWatchingService: TargetType {
    var baseURL: URL{ return URL(string: "https://api.github.com")! }

    var path: String {
        switch self {
        case .ListWatchers(let owner, let repo):
            return "/repos/\(owner)/\(repo)/subscribers"
        case .ListRepositoriesBeingWatched(let username):
            return "/users/\(username)/subscriptions"
        case .GetARepositorySubscription(let owner, let repo):
            return "/repos/\(owner)/\(repo)/subscription"
        case .SetARepositorySubscription(let owner, let repo):
            return "/repos/\(owner)/\(repo)/subscription"
        case .DeleteARepositorySubscription(let owner, let repo):
            return "/repos/\(owner)/\(repo)/subscription"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .ListWatchers(_, _), .ListRepositoriesBeingWatched(_), .GetARepositorySubscription(_, _):
            return .get
        case .SetARepositorySubscription(_, _):
            return .put
        case .DeleteARepositorySubscription(_, _):
            return .delete
        }
    }
    
    var sampleData: Data {
        return "sample data".data(using: .utf8)!
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

