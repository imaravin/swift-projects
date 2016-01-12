//
//  programViewController.swift
//  iNautix
//
//  Created by R.M.K. Engineering College  on 08/09/15.
//  Copyright (c) 2015 Aravinth. All rights reserved.
//

import UIKit

class programViewController: UIViewController,NSXMLParserDelegate,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tblview: UITableView!
    var eventtype:[String] = []
    var eventname:[String] = []
    var eventtime:[String] = []
    var eventplace:[String] = []
    
    var booltype:Bool = false
    var boolname:Bool = false
    var booltime:Bool = false
    var boolplace:Bool = false
    var parser:NSXMLParser = NSXMLParser()
    override func viewDidLoad() {
        super.viewDidLoad()
         navigationController!.navigationBar.barTintColor = UIColorFromRGB(0xffa000)
        
        var url1:String="http://netnew.tk/city/programdet.xml"
        var urlToSend: NSURL = NSURL(string: url1)!
        
        parser = NSXMLParser(contentsOfURL:urlToSend)!
        
        parser.delegate=self;
        
        parser.shouldResolveExternalEntities = false;
        parser.shouldReportNamespacePrefixes = false;
        parser.shouldProcessNamespaces = false
        
        
        
        
        print (parser.parse())
        
        tblview.reloadData()

        

         
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func show(sender: AnyObject) {
        
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    
    //table view
    
    func numberOfSectionsInTableView(tableView: UITableView) ->Int
    {
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int
    {
        //make sure you use the relevant array sizes
        return self.eventname.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell
    {
        var cell: cellTableViewCell = self.tblview.dequeueReusableCellWithIdentifier("cell") as! cellTableViewCell
        cell.title2?.text = self.eventname[indexPath.item]
        cell.time2?.text =  self.eventplace[indexPath.item]
        cell.time?.text = self.eventtime[indexPath.item]
        cell.type?.text = self.eventtype[indexPath.item]
        
        return cell
    }
    
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        
        if elementName=="eventtype"
        {
            booltype = true
            
        }
        if elementName=="title"
        {
            boolname = true
            
        }
        if elementName=="place"
        {
            boolplace = true
            
        }
        if elementName=="time"
        {
            booltime = true
            
        }
        
        
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName=="eventtype"
        {
            booltype = false
            
        }
        if elementName=="title"
        {
            boolname = false
            
        }
        if elementName=="place"
        {
            boolplace = false
            
        }
        if elementName=="time"
        {
            booltime = false
            
        }
        
    }
    
    
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        
       // print (string)
        if booltype
        {
           eventtype.append(string!)
            
        }
        if boolname
        {
           eventname.append(string!)
            
        }
        if boolplace
        {
            eventplace.append(string!)
        }
        if booltime
        {
           eventtime.append(string!)
            
        }
    }
    
    

}
