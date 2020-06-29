//
//  model.swift
//  todo_Anmariya_c0775497
//
//  Created by user176498 on 6/29/20.
//  Copyright © 2020 user176498. All rights reserved.
//

import Foundation

import CoreData
import UIKit

class MyList:NSManagedObject
{
    @NSManaged var task: String?
    @NSManaged var priority:String?
    @NSManaged var color: UIColor
    @NSManaged var order: Int16
    
}
