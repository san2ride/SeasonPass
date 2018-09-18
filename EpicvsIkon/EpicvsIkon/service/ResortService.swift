//
//  ResortService.swift
//  EpicvsIkon
//
//  Created by Jason Sanchez on 9/18/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import Foundation
import CoreData

class ResortService {
    
    static  func getResorts(moc: NSManagedObjectContext) -> NSFetchedResultsController<Resort> {
        let fetchedResultsController: NSFetchedResultsController<Resort>
        
        let request: NSFetchRequest<Resort> = Resort.fetchRequest()
        let nameSort = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [nameSort]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try fetchedResultsController.performFetch()
        }
        catch {
            fatalError("Error in fetching records")
        }
        
        return fetchedResultsController
    }
}
