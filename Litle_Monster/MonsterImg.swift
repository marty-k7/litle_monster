//
//  MonsterImg.swift
//  Litle_Monster
//
//  Created by Martynas Klastaitis  on 08/04/16.
//  Copyright © 2016 marty.k7. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playIdleAnimation()
    }
    func playIdleAnimation() {
        self.image = UIImage(named: "idle4.png")
        
        self.animationImages = nil
        
        //sukuriam aray[UIImage] ir i ja dedam kiekviena paveiksliuka pagal numerius
        var imgAray = [UIImage]()
        for var x = 1; x <= 4; x += 1 {
            let img = UIImage(named: "idle\(x).png")
            imgAray.append(img!)
        }
        
        self.animationImages = imgAray //is kur imam paveiksliukus
        self.animationDuration = 0.8  //animacijos greitis arba kiek trunka
        self.animationRepeatCount = 0 //kiek kartu pasikartoja, 0 = kartojasi nesustodama
        self.startAnimating() //pradedam animuoti
    }
    func playDeathAnimation() {
        //nustatom kuris paveiksliukas bus paskutinis
        self.image = UIImage(named: "dead5.png")
        //po animacijos padarom kad viskas pradingtu???
        self.animationImages = nil
        
        var imgAray = [UIImage]()
        for var x = 1; x <= 5; x += 1 {
            let img = UIImage(named: "dead\(x).png")
            imgAray.append(img!)
        }
        
        self.animationImages = imgAray //is kur imam paveiksliukus
        self.animationDuration = 0.8  //animacijos greitis arba kiek trunka
        self.animationRepeatCount = 1 //kiek kartu pasikartoja, 0 = kartojasi nesustodama
        self.startAnimating()
    }
    func walkAnimation() {
        self.image = UIImage(named: "walk9.png")
        self.animationImages = nil
        
        var imgAray = [UIImage]()
        for var x = 1; x <= 9; x += 1 {
            let img = UIImage(named: "walk\(x)")
            imgAray.append(img!)
        }
        self.animationImages = imgAray
        self.animationDuration = 1.5
        self.animationRepeatCount = 0
        self.startAnimating()
    }
}
