//
//  GithubEventService.swift
//  Regola
//
//  Created by yysz02 on 2019/8/28.
//  Copyright © 2019 farteen. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum GithubEventService {
    case PublicEvents
    case RepositoryEvents(owner: String, repo: String)
    case IssueEvents(owner: String, repo: String)
    case PublicEventsForNetworkOfRepository(owner: String, repo: String)
    case PublicEventsForAnOrganization(org: String)
    case EventsThatsUserHasReceived(username: String)
    case PublicEventsThatUserHasReceived(username: String)
    case EventsPerformedByaUser(username: String)
    case PublicEventsPerformedByaUser(username: String)
    case EventsForAnOrganization(username: String, org: String)
}

extension GithubEventService: TargetType {
    var baseURL: URL{ return URL(string: "https://api.github.com")! }
    var path: String {
        switch self {
        case .PublicEvents:
            return "/events"
        case .RepositoryEvents(let owner, let repo):
            return "/repos/\(owner)/\(repo)/events"
        case .IssueEvents(let owner, let repo):
            return "/repos/\(owner)/\(repo)/issues/events"
        case .PublicEventsForNetworkOfRepository(let owner, let repo):
            return "/networks/\(owner)/\(repo)/events"
        case .PublicEventsForAnOrganization(let org):
            return "/orgs/\(org)/events"
        case .EventsThatsUserHasReceived(let username):
            return "/users/\(username)/received_events"
        case .PublicEventsThatUserHasReceived(let username):
            return "/users/\(username)/received_events/public"
        case .EventsPerformedByaUser(let username):
            return "/users/\(username)/events"
        case .PublicEventsPerformedByaUser(let username):
            return "/users/\(username)/events/public"
        case .EventsForAnOrganization(let username, let org):
            return "/users/\(username)/events/orgs/\(org)"
        }
    }
    var method: Moya.Method {
        return Moya.Method.get
    }
    var sampleData: Data {
        return "data".data(using: .utf8)!
    }
    var headers: [String : String]? {
        return [
            "Accept":"application/vnd.github.v3+json"
        ]
    }
    
    var task: Task {
        return .requestPlain
    }
}
