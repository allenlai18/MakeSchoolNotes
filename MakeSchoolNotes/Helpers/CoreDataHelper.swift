//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Gabe Lavarte on 7/3/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    //static methods will go here
    
    static func createNote() -> Note {
        let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: managedContext) as! Note
        return note
    }
    
    static func saveNote() {
        do {
            try managedContext.save()
        }
        catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    static func deleteNote(entityName: Note) {
        managedContext.delete(entityName)
        saveNote()
    }
    
    static func retrieveNotes() -> [Note] {
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        
        do {
            let notes: [Note] = try managedContext.fetch(fetchRequest)
            return notes
        }
        catch let error as NSError{
            print ("Could note fetch \(error)")
        }
        return []
    }
}
