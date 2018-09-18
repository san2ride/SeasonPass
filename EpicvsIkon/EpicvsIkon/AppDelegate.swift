//
//  AppDelegate.swift
//  EpicvsIkon
//
//  Created by Jason Sanchez on 9/17/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coreData = CoreDataStack()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        checkData()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {
        coreData.saveContext()
    }
    
    // MARK: Private Function
    
    private func checkData() {
        let moc = coreData.persistentContainer.viewContext
        let request: NSFetchRequest<Resort> = Resort.fetchRequest()
        
        if let resortCount = try? moc.count(for: request), resortCount > 0 {
            return
        }
        uploadSampleData()
    }
    
    private func uploadSampleData() {
        let moc = coreData.persistentContainer.viewContext
        
        guard
            let url = Bundle.main.url(forResource: "resorts", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let jsonResult = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary,
            let jsonArray = jsonResult?.value(forKey: "resort") as? NSArray
        else { return }
        
        for json in jsonArray {
            guard
                let resortData = json as? [String: AnyObject],
                let name = resortData["name"] as? String,
                let region = resortData["region"] as? String,
                let price = resortData["price"],
                let trueSnowfall = resortData["trueSnowfall"],
                let daysToPayBack = resortData["daysToPayBack"],
                let verticalDrop = resortData["verticalDrop"],
                let airport = resortData["airport"]
            else { return }
            
            let resort = Resort(context: moc)
            resort.name = name
            resort.region = region
            resort.price = price as! Double
            resort.trueSnowFall = trueSnowfall as! Double
            resort.daysToPayBack = daysToPayBack as! Double
            resort.verticalDrop = verticalDrop as! Double
            resort.airport = airport as! Double
            
            if  let imageName = resortData["image"] as? String,
                let image = UIImage(named: imageName),
                let imageData = UIImageJPEGRepresentation(image, 1.0) {
                
                resort.imageLogo = NSData.init(data: imageData)
            }
        }
        coreData.saveContext()
    }
}
