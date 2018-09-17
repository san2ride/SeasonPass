//
//  Epic+CoreDataProperties.swift
//  EpicvsIkon
//
//  Created by Jason Sanchez on 9/17/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//
//

import Foundation
import CoreData


extension Epic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Epic> {
        return NSFetchRequest<Epic>(entityName: "Epic")
    }


}
