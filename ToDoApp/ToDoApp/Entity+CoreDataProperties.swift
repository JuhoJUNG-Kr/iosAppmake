//
//  Entity+CoreDataProperties.swift
//  ToDoApp
//
//  Created by 정주호 on 07/09/2022.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var memoText: String?
    @NSManaged public var date: Date?
    @NSManaged public var color: Int64

}

extension Entity : Identifiable {

}
