//
//  GithubNotificationsService.swift
//  Regola
//
//  Created by yysz02 on 2019/8/28.
//  Copyright © 2019 farteen. All rights reserved.
//

import Foundation
import Moya

enum GithubNotifications {
    case ListYourNotifications(all: Bool, participating: Bool, since: String, before: String)
    case ListYourNotificationsInARepository(all: Bool, participating: Bool, since: String, before: String, owner: String, repo: String)
    case MarkAsRead(last_read_at: String)
    case MarkNotificationsAsReadInRepository(last_read_at: String, owner: String, repo: String)
    case ViewASingleThread(thread_id: String)
    case MarkAThreadAsRead(thread_id: String)
    case GetAThreadSubscription(thread_id: String)
    case SetAThreadSubscription(thread_id: String)
    case DeleteAThreadSubscription(thread_id: String)
}

extension GithubNotifications: TargetType {
    var baseURL: URL{ return URL(string: "https://api.github.com")! }
    
    var path: String {
        switch self {
        case .ListYourNotifications(_, _, _, _):
            return "/notifications"
        case .ListYourNotificationsInARepository(_, _, _, _, let owner, let repo):
            return "/repos/\(owner)/\(repo)/notifications"
        case .MarkAsRead(_):
            return "/notifications"
        case .MarkNotificationsAsReadInRepository(_, let owner, let repo):
            return "/repos/\(owner)/\(repo)/notificaitons"
        case .ViewASingleThread(let thread_id):
            return "/notifications/threads/\(thread_id)"
        case .MarkAThreadAsRead(let thread_id):
            return "/notifications/threads/\(thread_id)"
        case .GetAThreadSubscription(let thread_id), .SetAThreadSubscription(let thread_id),
             .DeleteAThreadSubscription(let thread_id):
            return "/notifications/threads/\(thread_id)/subscription"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .ListYourNotifications(_, _, _, _), .ListYourNotificationsInARepository(_, _, _, _, _, _),
             .ViewASingleThread(_), .GetAThreadSubscription(_):
            return .get
        case .MarkAsRead(_), .MarkNotificationsAsReadInRepository(_, _, _), .SetAThreadSubscription(_):
            return .put
        case .MarkAThreadAsRead(_):
            return .patch
        case .DeleteAThreadSubscription(_):
            return .delete
        }
    }
    
    var sampleData: Data {
        return "sample data".data(using: .utf8)!
    }
    
    var task: Task {
        //TODO: switch to finish api implementation
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return [
            "Accept":"application/vnd.github.v3+json"
        ]
    }
    
    
}
