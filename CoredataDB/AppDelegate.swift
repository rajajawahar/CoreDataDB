//
//  AppDelegate.swift
//  CoredataDB
//
//  Created by rajamohamed on 19/06/17.
//  Copyright © 2017 sedintechnologies. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }
    
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "datamodel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            guard error == nil else { fatalError("Failed to load store: \(String(describing: error))") }
            
            let mainContext = container.viewContext
        })
        return container
    }()
    
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do{
                try context.save()
            }catch{
                let nserror = error as NSError
                fatalError("Unresolved Error \(nserror.userInfo)")
            }
        }
    }
    
    
    
    
    
    
}

