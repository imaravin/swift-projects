//
//  menuViewController.swift
//  iNautix
//
//  Created by R.M.K. Engineering College  on 05/09/15.
//  Copyright (c) 2015 Aravinth. All rights reserved.
//

import UIKit

class menuViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate {
    let menu=["Home","Route Map","Program Details","Leader Profiles","Other Asks","Feedback"]

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
        return menu.count
        }
        else{
            return 0
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text=menu[indexPath.row]
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true

        // Do any additional setup after loading the view.
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1{
            return nil
        }
                     return nil
        
    }

    override func prefersStatusBarHidden() -> Bool {
        return navigationController?.navigationBarHidden == true
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.item
        {
        case 0 :
            var homeViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
            var homeNavController = UINavigationController(rootViewController: homeViewController)
            var appdelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appdelegate.centerContainer!.centerViewController = homeNavController
            appdelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)

            
                print("first")
                break
        case 1 :
            var homeViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RouteViewController") as! RouteViewController
            var homeNavController = UINavigationController(rootViewController: homeViewController)
            var appdelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appdelegate.centerContainer!.centerViewController = homeNavController
            appdelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)

            
            break
        case 2 :
            
            var homeViewController = self.storyboard?.instantiateViewControllerWithIdentifier("programViewController") as! programViewController
            var homeNavController = UINavigationController(rootViewController: homeViewController)
            var appdelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appdelegate.centerContainer!.centerViewController = homeNavController
            appdelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            break
        case 3 :
            var homeViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LeaderViewController") as! LeaderViewController
            var homeNavController = UINavigationController(rootViewController: homeViewController)
            var appdelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appdelegate.centerContainer!.centerViewController = homeNavController
            appdelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
           
            break
        case 4 :
            var homeViewController = self.storyboard?.instantiateViewControllerWithIdentifier("OtherViewController") as! OtherViewController
            var homeNavController = UINavigationController(rootViewController: homeViewController)
            var appdelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

            appdelegate.centerContainer!.centerViewController = homeNavController
            appdelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            
            print ("he");
            break
        case 5 :
            var homeViewController = self.storyboard?.instantiateViewControllerWithIdentifier("feedbackViewController") as! feedbackViewController
            
            var homeNavController = UINavigationController(rootViewController: homeViewController)
            var appdelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appdelegate.centerContainer!.centerViewController = homeNavController
            appdelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
                        
            break
            
        default :
            print ("fjks");
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
