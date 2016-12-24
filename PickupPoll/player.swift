//
//  player.swift
//  PickupPoll
//
//  Created by Apurv Suman on 12/23/16.
//  Copyright © 2016 Apurv Suman. All rights reserved.
//

import UIKit
import os.log

class Player: NSObject, NSCoding {
    
    // MARK: Properties
    var name: String
    var playing: Bool
    
    // MARK: Initialization
    init(name: String, playing: Bool) {
        self.name = name
        self.playing = playing
    }
    
    // MARK: Archiving Paths
    static let DocumentsDirectory =
        FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("players")
    
    // MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(playing, forKey: "playing")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: "name") as? String else {
            if #available(iOS 10.0, *) {
                os_log("Unable to decode the name for a Player object.", log: OSLog.default, type: .debug)
            } else {
                // Fallback on earlier versions
            }
            return nil
        }
        
        let playing = aDecoder.decodeBool(forKey: "playing")
        
        // Must call designated initializer
        self.init(name: name, playing: playing as Bool)
    }

}
