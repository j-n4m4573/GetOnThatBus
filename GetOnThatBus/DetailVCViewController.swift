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
        
        navigationController?.navigationBar.topItem?.title = self.annotation.title!
    }
}
