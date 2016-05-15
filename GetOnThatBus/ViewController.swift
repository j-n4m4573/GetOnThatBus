//
//  ViewController.swift
//  GetOnThatBus
//
//  Created by Jamar Gibbs on 2/2/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {
    
    var busData = NSDictionary()
    var busArray : [NSDictionary]!
    let locationManager = CLLocationManager()
    var tappedAnnotation : MKAnnotation!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchUrlString = "https://s3.amazonaws.com/mmios8week/bus.json"
        let url = NSURL (string: fetchUrlString)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!){
        (data:NSData?,response:NSURLResponse?,error:NSError?)-> Void in
            do {
                self.busData = try NSJSONSerialization.JSONObjectWithData(data!,options:  .AllowFragments)as! NSDictionary
                
                self.busArray = self.busData.objectForKey("row") as! Array<NSDictionary>
                for dict in self.busArray {
                    let latitude = dict.objectForKey("latitude")as! String
                    let longitude = dict.objectForKey("longitude")as! String
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2DMake(Double(latitude)!, Double(longitude)!)
                    let stopName = dict.objectForKey("cta_stop_name")as? String
                    let routeNames = dict.objectForKey("routes")as? String
                    annotation.title = stopName
                    annotation.subtitle = routeNames
                    
                    self.mapView.addAnnotation(annotation)
                    self.mapView.reloadInputViews()
                    
                }
            }
            catch let error as NSError {
                print("JSON Error: \(error.localizedDescription)")
            }
        }
        task.resume()
        
        mapView.setRegion(MKCoordinateRegionMake(CLLocationCoordinate2DMake(Double(41.8369), Double(-87.6847)), MKCoordinateSpanMake(0.4, 0.4)), animated:true)
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
        for dict in self.busArray{
            if (annotation.title!!.isEqual(dict.valueForKey("cta_stop_name"))){
                pin.canShowCallout = true
                
                pin.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
                //pin.tag = dict.objectForKey("_id") as! Int
                print("Inside annotation view")
            }
        }
        return pin
    }
    func mapView(mapView:MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control:UIControl) {
        if control == view.rightCalloutAccessoryView {
            self.tappedAnnotation = view.annotation!
            performSegueWithIdentifier("goToDetail", sender: self)
           
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! DetailVCViewController
        destination.busDictionary = self.busArray
        destination.annotation = self.tappedAnnotation
        
    }
}


