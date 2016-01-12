//
//  ViewController.swift
//  Multi Threading
//
//  Created by RMK User on 12/01/16.
//  Copyright (c) 2016 RMK User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
         var queue = NSOperationQueue()
        for var i=0;i<5;i++
        {
            var o=op(val: i as Int)
            queue.addOperation(o)
           // label.text=label.text!+String(o.n)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


class op:NSOperation
{
    var n=0
    init(val:Int)
    {
        n=val
    }
    override func main() {
    print(n)
    }
}
    
}