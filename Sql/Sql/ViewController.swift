//
//  ViewController.swift
//  Sql
//
//  Created by RMK User on 25/01/16.
//  Copyright (c) 2016 RMK User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var name: UITextField!
    @IBOutlet var phone: UITextField!
     var databasePath:String=""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let filemgr = NSFileManager.defaultManager()
        let dirsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let docsDir = dirsPath[0] as! String
        databasePath = docsDir.stringByAppendingPathComponent("contacts.db")
        if !filemgr.fileExistsAtPath(databasePath as String){
            let contactDB=FMDatabase(path: databasePath as String)
            if contactDB == nil{
                println("Error")
            }
            if(contactDB.open())
            {
                let sql_stmt="CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT,PHONE TEXT)"
                if !contactDB.executeStatements(sql_stmt){
                    print("error ")
                    
                    
                }
                contactDB.close()
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func save(sender: AnyObject) {
        let contactDB = FMDatabase(path: databasePath as String)
        
        if contactDB.open() {
            
            let insertSQL = "INSERT INTO CONTACTS (name,phone) VALUES ('\(name.text)',  '\(phone.text)')"
            
            let result = contactDB.executeUpdate(insertSQL,
                withArgumentsInArray: nil)
            
            if !result {
                
                println("Error: \(contactDB.lastErrorMessage())")
            } else {
                //status.text = "Contact Added"
                name.text = ""
                print("SHSHSH")
                // address.text = ""
                phone.text = ""
            }
        } else {
            println("Error: \(contactDB.lastErrorMessage())")
        }

    }

    @IBAction func find(sender: AnyObject) {
        let contactDB = FMDatabase(path: databasePath as String)
        
        if contactDB.open() {
            let querySQL = "SELECT phone FROM CONTACTS WHERE name = '\(name.text)'"
            
            let results:FMResultSet? = contactDB.executeQuery(querySQL,
                withArgumentsInArray: nil)
            
            if results?.next() == true {
                //    address.text = results?.stringForColumn("address")
                phone.text = results?.stringForColumn("phone")
                
                //     status.text = "Record Found"
                print(phone.text)
            } else {
                // status.text = "Record not found"
                //  address.text = ""
                phone.text = ""
            }
            contactDB.close()
        } else {
            println("Error: \(contactDB.lastErrorMessage())")
        }
    }

    }
   


