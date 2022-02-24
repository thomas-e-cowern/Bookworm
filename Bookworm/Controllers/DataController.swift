//
//  DataController.swift
//  Bookworm
//
//  Created by Thomas Cowern New on 2/24/22.
//

import Foundation
import CoreData
import UIKit

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init () {
        container.loadPersistentStores { descirption, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
}
