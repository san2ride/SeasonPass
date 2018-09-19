//
//  MySkiResortController.swift
//  EpicvsIkon
//
//  Created by Jason Sanchez on 9/17/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit
import CoreData

class MySkiResortController: UITableViewController {

    private var coreData = CoreDataStack()
    private var fetchedResultController: NSFetchedResultsController<Resort>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = fetchedResultController?.sections {
            return sections.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultController?.sections {
            return sections[section].numberOfObjects
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resortCell", for: indexPath) as! MySkiResortCell
        
        if let resort = fetchedResultController?.object(at: indexPath) {
            cell.configureCell(resort: resort)
        }
        
        return cell
    }

    // MARK: Private
    
    private func loadData() {
        fetchedResultController = ResortService.getResorts(moc: coreData.persistentContainer.viewContext)
    }
    
}
