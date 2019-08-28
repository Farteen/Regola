//
//  GithubStarringService.swift
//  Regola
//
//  Created by yysz02 on 2019/8/28.
//  Copyright © 2019 farteen. All rights reserved.
//

import Foundation
import Moya

enum GithubStarringService {
    case ListStargazers(owner: String, repos: String)
    case ListRepositoriesBeingStarred(username: String)
    case CheckIfYouAreStarringARepository(owner: String, repo: String)
    case StarARepository(owner: String, repo: String)
    case UnstarARepository(owner: String, repo: String)
}

extension GithubStarringService: TargetType {
    var baseURL: URL{ return URL(string: "https://api.github.com")! }
    
    var path: String {
        switch self {
        case .ListStargazers(let owner, let repos):
            return "/repos/\(owner)/\(repos)/stargazers"
        case .ListRepositoriesBeingStarred(let username):
            return "/users/\(username)/starred"
        case .CheckIfYouAreStarringARepository(let owner, let repo):
            return "/user/starred/\(owner)/\(repo)"
        case .StarARepository(let owner, let repo):
            return "/user/starred/\(owner)/\(repo)"
        case .UnstarARepository(let owner, let repo):
            return "/user/starred/\(owner)/\(repo)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .ListStargazers(_, _), .ListRepositoriesBeingStarred(_), .CheckIfYouAreStarringARepository(_, _):
            return .get
        case .StarARepository(_, _):
            return .put
        case .UnstarARepository(_, _):
            return .delete
        }
    }
    
    var sampleData: Data {
        return "sample data".data(using: .utf8)!
    }
    
    var task: Task {
        //TODO: switch
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return [
            "Accept":"application/vnd.github.v3+json"
        ]
    }
    
}
