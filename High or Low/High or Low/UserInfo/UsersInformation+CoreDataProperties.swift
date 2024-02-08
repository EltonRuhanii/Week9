//
//  UsersInformation+CoreDataProperties.swift
//  High or Low
//
//  Created by Kin+Carta on 6.2.24.
//
//

import Foundation
import CoreData


extension UsersInformation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UsersInformation> {
        return NSFetchRequest<UsersInformation>(entityName: "UsersInformation")
    }

    @NSManaged public var betsLost: Int64
    @NSManaged public var betsPlaced: Int64
    @NSManaged public var betsWon: Int64
    @NSManaged public var moneyAmount: Float
    @NSManaged public var moneyWagered: Float
    @NSManaged public var username: String?
    @NSManaged public var password: String?

}

extension UsersInformation : Identifiable {

}
