//
//  Notes+CoreDataProperties.swift
//  TabBar
//
//  Created by Adarsh Singh on 31/08/23.
//
//

import Foundation
import CoreData


extension Notes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notes> {
        return NSFetchRequest<Notes>(entityName: "Notes")
    }

    @NSManaged public var note: String?
    @NSManaged public var title: String?

}

extension Notes : Identifiable {

}
