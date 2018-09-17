//
//  Ikon+CoreDataProperties.swift
//  EpicvsIkon
//
//  Created by Jason Sanchez on 9/17/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//
//

import Foundation
import CoreData


extension Ikon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ikon> {
        return NSFetchRequest<Ikon>(entityName: "Ikon")
    }


}
