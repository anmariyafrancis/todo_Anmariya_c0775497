//
//  Support.swift
//  todo_Anmariya_c0775497
//
//  Created by user176498 on 6/29/20.
//  Copyright © 2020 user176498. All rights reserved.
//

import Foundation

import CoreData
import UIKit

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

func saveContext(){
    if context.hasChanges
    {
        do{
            try context.save()
        }
        catch
        {
            print(error)
        }
    }
    
}

