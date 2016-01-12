//
//  RouteViewController.swift
//  iNautix
//
//  Created by R.M.K. Engineering College  on 07/09/15.
//  Copyright (c) 2015 Aravinth. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class RouteViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

   
    @IBOutlet weak var theMap: MKMapView!
    var manager:CLLocationManager!
    var myLocations: [CLLocation] = [CLLocation(latitude: 13.3605562, longitude: 80.1418533),CLLocation(latitude: 13.3225699, longitude: 80.1480531)]
    
    
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        // theLabel.text = "\(locations[0])"
       myLocations.append(locations[0] as! CLLocation)
       // myLocations[1]=locations[0] as! CLLocation
        
//        let spanX = 0.007
//        let spanY = 0.007
//        var newRegion = MKCoordinateRegion(center: theMap.userLocation.coordinate, span: MKCoordinateSpanMake(spanX, spanY))
//        theMap.setRegion(newRegion, animated: true)
//        
//        if (myLocations.count > 1){
//            var sourceIndex = myLocations.count - 1
//            var destinationIndex = myLocations.count - 2
//            
//            let c1 = myLocations[sourceIndex].coordinate
//            let c2 = myLocations[destinationIndex].coordinate
//            var a = [c1, c2]
//            var polyline = MKPolyline(coordinates: &a, count: a.count)
//            theMap.addOverlay(polyline)
//        }
    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        
        if overlay is MKPolyline {
            var polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.redColor()
            polylineRenderer.lineWidth = 0.5
            return polylineRenderer
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.barTintColor = UIColorFromRGB(0xffa000)
        manager = CLLocationManager()
     manager.requestAlwaysAuthorization()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        
        
        theMap.delegate = self
        theMap.mapType = MKMapType.Standard
        theMap.showsUserLocation = true
        
        let spanX = 0.007
        let spanY = 0.007
        var newRegion = MKCoordinateRegion(center: myLocations[0].coordinate, span: MKCoordinateSpanMake(spanX, spanY))
        theMap.setRegion(newRegion, animated: true)
        
       // if (myLocations.count > 1){
            var sourceIndex = myLocations.count - 1
            var destinationIndex = myLocations.count - 2
        var annotation1 = MKPointAnnotation();
        
        annotation1.coordinate = myLocations[0].coordinate;
        
        var annnoation1 = MKPointAnnotation();
        annnoation1.coordinate = myLocations[destinationIndex].coordinate
        
        theMap.addAnnotation(annotation1)
        theMap.addAnnotation(annnoation1)
        
        
        
            let c1 = myLocations[sourceIndex].coordinate
            let c2 = myLocations[destinationIndex].coordinate
            var a = [c1, c2]
            var polyline = MKPolyline(coordinates: &a, count: a.count)
            theMap.addOverlay(polyline)
     //   }

        
   }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func show2(sender: AnyObject) {
        
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
        

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

    
    
    
    
}
