//
//  ViewController.swift
//  Accelometer
//
//  Created by Kamilia Latifah on 23/07/19.
//  Copyright © 2019 masaksendiri. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
let motionManager = CMMotionManager()
    
    @IBOutlet weak var logoNarutoRun: UIImageView!
    
    @IBOutlet weak var labelX: UILabel!
    
    @IBOutlet weak var labelY: UILabel!
    
    @IBOutlet weak var labelZ: UILabel!
    
    @IBOutlet weak var gifView: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //checking accelerometer data available//
      
        accelerometerMantul()
        self.view.backgroundColor = .black
            
            self.logoNarutoRun.image  = UIImage(named: "narutorun")
        
        var gifImage = UIImage.gifImageWithName("narutonrunGIF")
        self.gifView.image = gifImage
        
        
    }

    func accelerometerMantul() {
    motionManager.accelerometerUpdateInterval = 1.0  //10 updates per second pas diprint//
    motionManager.startAccelerometerUpdates(to: OperationQueue.main) { (Data, Error) in print(Data as Any)
        
        if let trueData = Data {
            self.view.reloadInputViews()
            let x = trueData.acceleration.x
            let y = trueData.acceleration.y
            let z = trueData.acceleration.z
            self.labelX.text = "\(x)"
            self.labelY.text = "\(y)"
            self.labelZ.text = "\(z)"
            
            if x >= 0.1 {
                self.labelX.backgroundColor = .white
               self.gifView.alpha = 1.0
            } else {
                self.labelX.backgroundColor = .red
                
                self.gifView.alpha = 0.0
            }
        
        
        
        
        
        }
    }

}



}
