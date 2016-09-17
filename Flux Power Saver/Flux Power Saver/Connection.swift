//
//  Connection.swift
//  Flux Power Saver
//
//  Created by Serge-Olivier Amega on 9/17/16.
//  Copyright © 2016 fluxps. All rights reserved.
//

import Foundation

typealias Dollar = Decimal

typealias KilowattHours = Float

struct LeaderboardUser {
    var name : String
    var amountPerDay : Dollar
}

enum ConnectionError {
    case loginError
}

class Connection {
    
    /**
     * Try to login with a username and a password. If unsuccessful, throws a loginError
     */
    init(username:String, password:String) throws {
    }
    
    func moneySpentLastWeek() -> Dollar? {
        return nil
    }
    func moneySpentLastDay() -> Dollar? {
        return nil
    }
    func moneySpentOverTime() -> [NSDate:Dollar] {
        return [:]
    }
    func moneySpentMoreThanAverage() -> Dollar? {
        return nil
    }
    func topUsers() -> [LeaderboardUser] {
        return []
    }
    func sendElectricityUsage(amount: KilowattHours) throws {
    }
}