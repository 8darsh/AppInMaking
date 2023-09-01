//
//  DatabaseHelper.swift
//  TabBar
//
//  Created by Adarsh Singh on 31/08/23.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    
    static var shareInstance = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object:[String:String]){
        let notes = NSEntityDescription.insertNewObject(forEntityName: "Notes", into: context!) as! Notes
        
        
        
        notes.title = object["title"]
        notes.note = object["note"]


        
        do{
            try context?.save()

        }catch{
            print("Not Saved")
        }
    }
    
    
    func getData() -> [Notes]{
        
        var note = [Notes]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Notes")
        do{
            note = try context?.fetch(fetchRequest) as! [Notes]
        }catch{
            print("Can't get Data")
        }
        
        return note
    }
    
    func deleteData(index:Int) -> [Notes]{
        var note = getData()
        context?.delete(note[index])
        note.remove(at: index)
        
        do{
            try context?.save()
        }catch{
            print("Can't get Data")
        }
        
        return note
    }
    
    func editdata(object:[String:String], i: Int){
        var note = getData()
        note[i].title = object["title"]
        note[i].note = object["note"]
        
        do{
            try context?.save()
        }catch{
            print("hehe")
        }
    }
    
    
}
