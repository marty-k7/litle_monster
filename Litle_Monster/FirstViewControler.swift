//
//  FirstViewControlerViewController.swift
//  Litle_Monster
//
//  Created by Martynas Klastaitis  on 10/04/16.
//  Copyright © 2016 marty.k7. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController {
    
    @IBOutlet weak var secondMonsterBtn: UIButton!
    
    @IBOutlet weak var monsterBtn: UIButton!

    @IBOutlet weak var monsterImg: MonsterImg!
    
    @IBOutlet weak var secondMonsterImg: SecondMonsterImg!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        monsterImg.walkAnimation()
        secondMonsterImg.playIdleAnimation()
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onMonsterTapped(sender: AnyObject) {
    }
  
    @IBAction func onSecondMonsterTapped(sender: AnyObject) {
    }
    

    

}
