//
//  ViewController.swift
//  RSS
//
//  Created by RMK User on 12/01/16.
//  Copyright (c) 2016 RMK User. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,NSXMLParserDelegate {

    @IBOutlet weak var tblview: UITableView!
    var parser = NSXMLParser()
    var textArray=NSMutableArray();
    var found=false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        parser = NSXMLParser(contentsOfURL: NSURL(string:"http://www.theverge.com/rss/frontpage"))!
    parser.delegate=self
        parser.shouldResolveExternalEntities=false
        parser.shouldReportNamespacePrefixes=false
        parser.shouldProcessNamespaces=false
        print(parser.parse())
        
       
        print(textArray.count)
        print(textArray)
        
        tblview.reloadData()    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) ->Int
    {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int
    {
        //make sure you use the relevant array sizes
        return self.textArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell
    {
        var cell: UITableViewCell = self.tblview.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text=self.textArray.objectAtIndex(indexPath.row) as? String
       // print(self.textArray.objectAtIndex(indexPath.row) as? String)
        
        return cell
    }
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        if elementName=="name"
        {
            found=true;
            
        }
    }
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        if found
        {
            textArray.addObject(string!)
        }
        
    }
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if found
        {
            found=false
        }
    }


}

