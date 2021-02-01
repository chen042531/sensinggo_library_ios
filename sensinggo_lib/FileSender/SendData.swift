//
//  SendData.swift
//  sensinggo_lib
//
//  Created by ycchen on 2020/12/4.
//

import Foundation
import NMSSH

public class sendData{
    public init(){
        
    }
    public func send() {
        let fileName = "lib_swift"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("csv")
        
        let session = NMSSHSession.init(host: "140.113.216.51", port: 22, andUsername: "yicchen")
        session.connect()
        print(session.isConnected)
        if session.isConnected{
            session.authenticate(byPassword: "chen66261034")
            if session.isAuthorized == true {
                print("okokokok")
                let sftpsession = NMSFTP(session: session)
                sftpsession.connect()
                if sftpsession.isConnected {
                    sftpsession.writeFile(atPath: fileURL.path, toFileAtPath: "/home/yicchen/Desktop/lib_swift.csv")
                }
            }
            else{
                print("nonono")
            }
        }
    }
    
}
