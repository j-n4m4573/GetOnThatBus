//
//  DetailVCViewController.swift
//  GetOnThatBus
//
//  Created by Jamar Gibbs on 2/2/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit
import MapKit

class DetailVCViewController: UIViewController {
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var busLabel: UILabel!
    @IBOutlet weak var transferLabel: UILabel!
    var busDictionary : [NSDictionary] = []
    var annotation : MKAnnotation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for dict in self.busArray{
            if (annotation.title!!.isEqual(dict.valueForKey("cta_stop_name"))){
                self.addressLabel.text = dict.valueForKey.
            }
        }
        navigationController?.navigationBar.topItem?.title = self.annotation.title!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
