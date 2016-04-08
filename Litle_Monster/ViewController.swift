//
//  ViewController.swift
//  Litle_Monster
//
//  Created by Martynas Klastaitis  on 08/04/16.
//  Copyright © 2016 marty.k7. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var monsterImg: UIImageView!
    @IBOutlet weak var foodImg: UIImageView!
    @IBOutlet weak var heartImg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sukuriam aray[UIImage] ir i ja dedam kiekviena paveiksliuka pagal numerius
        var imgAray = [UIImage]()
        for var x = 1; x <= 4; x += 1 {
            let img = UIImage(named: "idle\(x).png")
            imgAray.append(img!)
        }
        
        monsterImg.animationImages = imgAray //is kur imam paveiksliukus
        monsterImg.animationDuration = 0.8  //animacijos greitis arba kiek trunka
        monsterImg.animationRepeatCount = 0 //kiek kartu pasikartoja, 0 = kartojasi nesustodama
        monsterImg.startAnimating() //pradedam animuoti
        
        
        
    }


}

