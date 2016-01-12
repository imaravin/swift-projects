//
//  OtherViewController.swift
//  iNautix
//
//  Created by R.M.K. Engineering College  on 07/09/15.
//  Copyright (c) 2015 Aravinth. All rights reserved.
//

import UIKit
import MediaPlayer

class OtherViewController: UIViewController,UITableViewDelegate,NSXMLParserDelegate {

    @IBOutlet weak var tblview: UITableView!
    var name:[String] = [];
    var URL:[NSURL] = []
   var url:NSURL = NSURL(string: "http://techslides.com/demos/sample-videos/small.mp4")!
    
    var thumb:[String] = []
    
    var textarray: NSMutableArray! = NSMutableArray()
    
    var boolurl:Bool = false
    
    var boolthumb:Bool = false
    
    var booltitle:Bool = false
    var parser:NSXMLParser = NSXMLParser();
    
    var moviePlayer : MPMoviePlayerController?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.barTintColor = UIColorFromRGB(0xffa000)
       
        self.tblview.rowHeight = UITableViewAutomaticDimension
        self.tblview.estimatedRowHeight = 44.0
        // Do any additional setup after loading the view.
        
        
        var url1:String="http://netnew.tk/city/videos.xml"
        var urlToSend: NSURL = NSURL(string: url1)!
        
        parser = NSXMLParser(contentsOfURL:urlToSend)!
        
        parser.delegate=self;
        
        parser.shouldResolveExternalEntities = false;
        parser.shouldReportNamespacePrefixes = false;
        parser.shouldProcessNamespaces = false
        
      //  tblview.style = UITableViewStyle.Grouped
        
        
        print (parser.parse())
        
        tblview.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func show2(sender: AnyObject) {
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }

    @IBOutlet weak var show: UIBarButtonItem!
    
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
        return self.textarray.count    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell
    {
        var cell: UITableViewCell = self.tblview.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = self.textarray.objectAtIndex(indexPath.row) as? String
        cell.imageView?.image = UIImage(named: "placeholder")
        
        
        if var url2 = NSURL(string: thumb[indexPath.item]) {
            if let data = NSData(contentsOfURL: url2){
              //  imageURL.contentMode = UIViewContentMode.ScaleAspectFit
                cell.imageView?.image = UIImage(data: data)
            }
        }
      
        return cell
    }
   
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        
        if(elementName=="title")
        {
            booltitle = true
        }
        if elementName=="thumbnail"
        {
            boolthumb = true
        }
        if elementName=="url"
        {
            boolurl = true
        }
    }
    
    
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        
        if boolthumb
        {
            thumb.append(string!)
            
        }
        if boolurl
        {
            URL.append(NSURL(string: string!)!)
            print(string)
        }
        if booltitle
        {
            textarray.addObject(string!)
        }
        
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if(elementName=="title")
        {
            booltitle = false
        }
        if elementName=="thumbnail"
        {
            boolthumb = false
        }
        if elementName=="url"
        {
            boolurl = false
        }

    }
    
      func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
            url = URL[indexPath.item]
             play();
        
           }
    
    
    func play()
    {
        
        println (url)
      //  url = NSURL(string: "http://techslides.com/demos/sample-videos/small.mp4")!
        println (url)
        
        moviePlayer = MPMoviePlayerController(contentURL: url)
        moviePlayer!.view.frame = CGRect(x: 10, y: 10, width: 0, height: 0)
        
        self.view.addSubview(moviePlayer!.view)
        moviePlayer!.fullscreen = true
        
        moviePlayer!.controlStyle = MPMovieControlStyle.Fullscreen
        moviePlayer!.scalingMode = MPMovieScalingMode.AspectFit
        
    }

}
