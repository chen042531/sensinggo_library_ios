//
//  ViewController.swift
//  sensing
//
//  Created by ycchen on 2020/11/28.
//

import UIKit
import sensinggo_lib
import CoreLocation
import CoreMotion
import CoreTelephony
import Network
import SystemConfiguration.CaptiveNetwork
class ViewController: UIViewController, CLLocationManagerDelegate {
    //
    let lm = CLLocationManager()
    var mg = CMMotionManager()
    //
    var s = sensorInfo()
    var loc = Location()
    var phinfo = PhoneInfo()
    
    var netstate = NetworkState()
    var n = NetworkState()
    var file_maker = fileMaker()
    var send_Data = sendData()
    var start = 0;
    var end = 0;
    var first_ = true;
    var count = 0;
    var type = 0;
    var ROUND = 10 ;
    
    var wifi = WiFiInfo()
    var cell = CellularInfo()
    var pi = PhoneInfo()
    var ps = PhoneInfo()
    
    @IBOutlet var myLabel:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        var a = netstate.getNetworkType()
//        print(a)
        myLabel.text="haha"
        s.getAccelerometerValues() { (X, Y, Z) -> () in
                        DispatchQueue.main.async {
//                            print(X,Y,Z)
                            self.myLabel.text = String(X)
                        }
                    }
      
    }

  
}

