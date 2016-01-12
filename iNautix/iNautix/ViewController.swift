//
//  ViewController.swift
//  iNautix
//
//  Created by R.M.K. Engineering College  on 05/09/15.
//  Copyright (c) 2015 Aravinth. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDataSource ,NSXMLParserDelegate{
    
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var cardview: CardView!
    @IBOutlet weak var location: UILabel!
    var parser = NSXMLParser();
    var add:String = "aravinth";
    var currentElement:String="";
    var strXMLData:String  = "arara";
    var passData:Bool=false
    var passName:Bool=false
    var loc:Bool=false
    var dat:Bool=false
    var chennai:Bool=false
    var pune:Bool =  false
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text="irudaya"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.barTintColor = UIColorFromRGB(0xffa000)
        loading.startAnimating()
        
        
       
        var url:String="http://netnew.tk/city/sampledata.xml"
        var urlToSend: NSURL = NSURL(string: url)!
        
        parser = NSXMLParser(contentsOfURL:urlToSend)!
        
        parser.delegate=self;
        
        parser.shouldResolveExternalEntities = false;
         parser.shouldReportNamespacePrefixes = false;
        parser.shouldProcessNamespaces = false
        parser.parse()
       
        loading.stopAnimating();
        loading.hidesWhenStopped = true;
        
        
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        currentElement=elementName;
      //  println("hello")
        
        if(elementName=="date" || elementName=="address" || elementName=="Chennai" || elementName=="Pune")
        {
            if(elementName=="date" || elementName=="address"){
                if elementName=="address"
                {
                    loc = true;
                }
                else
                {
                    dat=true;
                }
                passName=true;
            }
            passData=true;
        }


    
            
        
    }
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if(elementName=="date" || elementName=="name" || elementName=="cost" || elementName=="description")
        {
            if(elementName=="date" || elementName=="address"){
                if elementName=="address"
                {
                    loc = false;
                }
                else
                {
                    dat=false;
                }

                passName=false;
                
            }
            passData=false;
        }

     
    }
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
     
        if(passName)
        {
            strXMLData=strXMLData+"\n\n"+string!
        }
        
        if(passData)
        {
        if loc
        {
            address.text = string
         }
        if dat
        {
            location.text = string
         }
            
        }
        loc=false
        dat=false
        
        println(string)
        
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        print ("ernkefjbn");
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func navigationScreen(sender: AnyObject) {
        
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
    
    
}


