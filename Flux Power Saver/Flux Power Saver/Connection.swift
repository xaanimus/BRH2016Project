//
//  Connection.swift
//  Flux Power Saver
//
//  Created by Serge-Olivier Amega on 9/17/16.
//  Copyright © 2016 fluxps. All rights reserved.
//

import Foundation
import Alamofire

let backendurl = "http://brh-nexiosoft.rhcloud.com/"

typealias Dollar = Decimal

typealias KilowattHours = Float

struct LeaderboardUser {
    var name : String
    var amountPerDay : Dollar
}

enum ConnectionError {
    case loginError
}

enum ConnectionResult {
    case error(ConnectionError), ok(Connection)
}

class Connection {
    
    let accessKey : Int
    init(key:Int) {
        accessKey = key
    }
    
    class func with(username:String, password:String, cb: @escaping ((ConnectionResult) -> ()) ) {
        let params = ["usrname":username, "password":password]
        Alamofire.request(backendurl+"login/new", method:.post, parameters:params)
            .responseJSON() {
                response in
                if let obj = response.result.value as? NSDictionary,
                    let success = obj["ok"] as? Bool,
                    let k = obj["key"] as? Int,
                    success
                {
                    cb(.ok(Connection(key:k)))
                } else {
                    cb(.error(.loginError))
                }
        }
    }
    
    func moneySpentLastWeek(cb : @escaping ( (Dollar?)->() )) {
        let params = ["sid":accessKey]
        Alamofire.request(backendurl+"moneyspent/lastweek", method:.post, parameters:params)
            .responseJSON { res in
                if let obj = res.result.value as? NSDictionary,
                    let success = obj["ok"] as? Bool,
                    let money = obj["dollars"] as? Dollar,
                    success
                {
                    cb(money)
                } else {
                    cb(nil)
                }
        }
    }
    
    func moneySpentOverTime(cb :@escaping ([(NSDate,Dollar)]?) -> ()) {
        let params = ["sid":accessKey]
        Alamofire.request(backendurl+"moneyspent/last6weeks", method:.post, parameters:params)
            .responseJSON { res in
                if let obj = res.result.value as? NSDictionary,
                    let success = obj["ok"] as? Bool,
                    let content = obj["content"] as? [NSDictionary],
                    success
                {
                    let date_dollar = content.map {($0["date"] as! NSDate,$0["dollar"] as! Dollar)}
                    cb(date_dollar)
                } else {
                    cb(nil)
                }
        }
    }
    
    func moneySpentMoreThanAverage(cb: @escaping (Dollar?) -> ()) {
        let params = ["sid":accessKey]
        Alamofire.request(backendurl+"moneyspent/compared", method:.post, parameters:params)
            .responseJSON { res in
                if let obj = res.result.value as? NSDictionary,
                    let success = obj["ok"] as? Bool,
                    let money = obj["dollars"] as? Dollar,
                    success
                {
                    cb(money)
                } else {
                    cb(nil)
                }
        }
    }
    
    func topUsers(cb: @escaping ([LeaderboardUser]?) -> ()) {
        let params = ["sid":accessKey]
        Alamofire.request(backendurl+"moneyspent/compared", method:.post, parameters:params)
            .responseJSON { res in
                if let obj = res.result.value as? NSDictionary,
                    let success = obj["ok"] as? Bool,
                    let users = obj["users"] as? [NSDictionary],
                    success
                {
                    let lusers = users.map {LeaderboardUser(name: $0["usr"] as! String, amountPerDay: $0["money"] as! Dollar)}
                    cb(lusers)
                } else {
                    cb(nil)
                }
        }
    }
    
    func sendElectricityUsage(amount: KilowattHours, cb: @escaping (Bool) -> ()) {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let params = ["sid":accessKey,
                      "moment":formatter.string(from: now),
                      "kwhamount":amount] as [String : Any]
        Alamofire.request(backendurl+"usage", method:.post, parameters:params)
            .responseJSON { res in
                if let obj = res.result.value as? NSDictionary,
                    let success = obj["ok"] as? Bool,
                    success
                {
                    cb(true)
                } else {
                    cb(false)
                }
        }
    }
}
