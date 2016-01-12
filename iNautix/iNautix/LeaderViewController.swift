//
//  LeaderViewController.swift
//  iNautix
//
//  Created by R.M.K. Engineering College  on 08/09/15.
//  Copyright (c) 2015 Aravinth. All rights reserved.
//

import UIKit

class LeaderViewController: UIViewController ,NSXMLParserDelegate ,UITableViewDataSource ,UITableViewDelegate{

    @IBOutlet weak var tblview: UITableView!
    var name:[String] = []
    var desg:[String] = []
    var bran:[String] = []
    var image:[NSURL] = []
    var boolname:Bool =  false
    var booldesg:Bool = false
    var boolbran:Bool =  false
    var boolimage:Bool = false
    var parser:NSXMLParser = NSXMLParser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         navigationController!.navigationBar.barTintColor = UIColorFromRGB(0xffa000)

        // Do any additional setup after loading the view.
        
        
        var url1:String="http://netnew.tk/city/leader.xml"
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) ->Int
    {
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int
    {
        //make sure you use the relevant array sizes
        return self.name.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell
    {
        var cell: UITableViewCell = self.tblview.dequeueReusableCellWithIdentifier("cell2") as! UITableViewCell
        cell.textLabel?.text = name[indexPath.item]
        var data:NSData = NSData(contentsOfURL: image[indexPath.item])!
        
        //  imageURL.contentMode = UIViewContentMode.ScaleAspectFit
        cell.imageView?.image = UIImage(data: data)
        return cell
    }
    
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        
        if elementName=="name"
        {
            boolname = true
            
        }
        if elementName=="designation"
        {
            booldesg = true
            
        }
        if elementName=="link"
        {
            boolimage = true
            
        }
        if elementName=="branch"
        {
            boolbran = true
            
        }
        
        
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        
        if elementName=="name"
        {
            boolname = false
            
        }
        if elementName=="designation"
        {
            booldesg = false
            
        }
        if elementName=="link"
        {
            boolimage = false
            
        }
        if elementName=="branch"
        {
            boolbran = false
            
        }
        
    }
    
    
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        
        // print (string)
        if boolname
        {
           name.append(string!)
            
        }
        if booldesg
        {
            desg.append(string!)
            
        }
        if boolimage
        {
            image.append(NSURL(string: string!)!)
        }
        if boolbran
        {
            bran.append(string!)
            
        }
    }



}
