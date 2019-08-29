//
//  RxSwiftTest1.swift
//  RegolaTests
//
//  Created by yysz02 on 2019/8/28.
//  Copyright © 2019 farteen. All rights reserved.
//

import Foundation
import RxSwift
import Nimble
import Quick
import Moya
@testable import Regola

class GithubNotificationsServiceSpec: QuickSpec {
    override func spec() {
        describe("github notification service spec") {
            it("check notification service list your notifications") {
                let listYourNotifications = GithubNotifications.ListYourNotifications(all: false, participating: false, since: "2019-01-01", before: "2019-12-31")
                expect(listYourNotifications.path).to(equal("/notifications"))
                expect(listYourNotifications.method).to(equal(.get))
                expect(listYourNotifications.task)
            }
            
            it("check notification service list your notifications in a repository") {
                let listYourNotificationsInAReporisotry = GithubNotifications.ListYourNotificationsInARepository(all: false, participating: false, since: "2019-01-01", before: "2019-12-31", owner: "alamofire", repo: "alamofire")
                expect(listYourNotificationsInAReporisotry.path).to(equal("/repos/alamofire/alamofire/notifications"))
            }
        }
    }
}
