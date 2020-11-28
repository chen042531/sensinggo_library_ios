//
//  Location.swift
//  sensinggo_lib
//
//  Created by ycchen on 2020/11/28.
//

import Foundation
import CoreLocation
public class Location: NSObject, CLLocationManagerDelegate {
    
    var lm = CLLocationManager()
    var latitude:Double = 0
    var longitude:Double = 0
    override public init(){
        super.init()
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyBest
        lm.requestWhenInUseAuthorization()
        lm.startUpdatingLocation()
    }
   
    public func getLocation (values: ((Double,Double) -> ())? ){
        print("rrrrrrrrrr")
      
        var valX: Double!
        var valY: Double!
        valX = longitude
        valY = latitude
     
        if values != nil{
            values!( valX,valY)
        }
        else{
            print("nonono")
        }

       
    }
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            print("llll",latitude)
            latitude = location.coordinate.latitude
            longitude = location.coordinate.longitude
         
        }
    }
    
}
