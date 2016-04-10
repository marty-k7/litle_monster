//
//  Sounds.swift
//  Litle_Monster
//
//  Created by Martynas Klastaitis  on 09/04/16.
//  Copyright © 2016 marty.k7. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Sounds:  AVAudioPlayer {
    var biteSound: AVAudioPlayer!
    var heartSound: AVAudioPlayer!
    var skullSound: AVAudioPlayer!
    var deathSound: AVAudioPlayer!
    var bgSound: AVAudioPlayer!
    
    let biteSoundPath = NSBundle.mainBundle().pathForResource("bite", ofType: "wav")
    let biteSoundURL = NSURL(fileURLWithPath: biteSoundPath!)
    do {
    try biteSound:
    }
    
    
}
