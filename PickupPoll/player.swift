//
//  player.swift
//  PickupPoll
//
//  Created by Apurv Suman on 12/23/16.
//  Copyright © 2016 Apurv Suman. All rights reserved.
//

import UIKit

class Player: NSObject {
    
    // MARK: Properties
    var name: String
    var playing: Bool
    
    // MARK: Initialization
    init(name: String, playing: Bool) {
        self.name = name
        self.playing = playing
    }
}
