//
//  ViewController.swift
//  Litle_Monster
//
//  Created by Martynas Klastaitis  on 08/04/16.
//  Copyright © 2016 marty.k7. All rights reserved.
//

import UIKit
import AVFoundation

class SecondMonsterViewController: UIViewController {
    
    
    @IBOutlet weak var secondMonsterImg: SecondMonsterImg!
    @IBOutlet weak var foodImg: DragImg!
    @IBOutlet weak var heartImg: DragImg!
    @IBOutlet weak var coinImg: DragImg!
    
    @IBOutlet weak var penalty1Img: UIImageView!
    @IBOutlet weak var penalty2Img: UIImageView!
    @IBOutlet weak var penalty3Img: UIImageView!
    @IBOutlet weak var replayBtn: UIButton!
    
    
    var sfxBite: AVAudioPlayer!
    var sfxHeart: AVAudioPlayer!
    var sfxSkull: AVAudioPlayer!
    var sfxDeath: AVAudioPlayer!
    var bgSound: AVAudioPlayer!
    
    
    
    
    let DIM_AlPH: CGFloat = 0.2 //sukuriam kostanta kuri leis obijektui buti beveik nematomui
    let OPAQUE: CGFloat = 1  //sukuriam konstanta kuri padarys obj-a matomu( 1 = max)
    let MAX_PENALTIES = 3   //maksimalus obijektu kiekis
    
    var penalties = 0  //current obijektu kiekis
    var timer: NSTimer! //sukuriam timer
    
    var monsterHappy = false
    var currentItem: UInt32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeGame()
        
        
        
    }
    func initializeGame() {
        penalty1Img.alpha = DIM_AlPH
        penalty2Img.alpha = DIM_AlPH
        penalty3Img.alpha = DIM_AlPH
        
        
        foodImg.dropTarget = secondMonsterImg
        heartImg.dropTarget = secondMonsterImg
        coinImg.dropTarget = secondMonsterImg
        
        foodImg.alpha = OPAQUE
        heartImg.alpha = OPAQUE
        coinImg.alpha = OPAQUE
        coinImg.userInteractionEnabled = true
        foodImg.userInteractionEnabled = true
        heartImg.userInteractionEnabled = true
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnCharacter:", name: "onTargetDropped", object: nil)  //duod notification jei veikia
        
        // sukuriam muzikos grotuvus kiekvienam garsui
        do {
            
            try bgSound = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")!))
            
            try sfxBite = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bite", ofType: "wav")!))
            
            try sfxHeart = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("heart", ofType: "wav")!))
            
            try sfxDeath = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("death", ofType: "wav")!))
            
            try sfxSkull = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("skull", ofType: "wav")!))
            
            bgSound.prepareToPlay()
            bgSound.play()
            sfxBite.prepareToPlay()
            sfxDeath.prepareToPlay()
            sfxSkull.prepareToPlay()
            sfxHeart.prepareToPlay()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        
        startTimer()
        
    }
    @IBAction func onReplayTapped(sender: AnyObject) {
        restartGame()
    }
    
    
    //jei uztempiam sirdi ar maista: persuka timer, padaro abu nematomus pasirinktam laikui
    // ir neleidzia naudotis
    
    func itemDroppedOnCharacter(notif: AnyObject) {
        monsterHappy = true
        startTimer()
        
        foodImg.alpha = DIM_AlPH
        heartImg.alpha = DIM_AlPH
        coinImg.alpha = DIM_AlPH
        
        foodImg.userInteractionEnabled = false
        heartImg.userInteractionEnabled = false
        coinImg.userInteractionEnabled = false
        
        
        if currentItem == 0 {
            sfxHeart.play()
        } else if currentItem == 1 {
            sfxBite.play()
        } else {
            sfxHeart.play()
        
    }
        
    }
    
    func startTimer() {
        //jei yra pajungtas timeris, ji sustabdom
        //tas reikalinga tam, kad kai pamaitinsim obijekta prasisuktu timeris per nauja
        if timer != nil {
            timer.invalidate()
        }
        //kas tris sekundes pajungia funkcija "ChangeGameState"
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "changeGameState", userInfo: nil, repeats: true)
    }
    func changeGameState() {
        // jei neuztempiam sirdikes arba maisto uzdeda penalty
        if !monsterHappy {
            penalties += 1
            sfxSkull.play()
            
            if penalties == 1 {
                penalty1Img.alpha = OPAQUE
                penalty2Img.alpha = DIM_AlPH
                penalty3Img.alpha = DIM_AlPH
            } else if penalties == 2 {
                penalty2Img.alpha = OPAQUE
                penalty3Img.alpha = DIM_AlPH
            } else if penalties >= 3 {
                penalty3Img.alpha = OPAQUE
            } else {
                
                penalty1Img.alpha = DIM_AlPH
                penalty2Img.alpha = DIM_AlPH
                penalty3Img.alpha = DIM_AlPH
            }
            if penalties >= MAX_PENALTIES {
                gameOver()
            }
        }
        // kas kazkiek prasuka timeri ir pakeicia random ko reikia monstrui meiles ar maisto
        let rand = arc4random_uniform(3)
        if rand == 0 {
            foodImg.alpha = DIM_AlPH
            coinImg.alpha = DIM_AlPH
            coinImg.userInteractionEnabled = false
            foodImg.userInteractionEnabled = false
            
            heartImg.alpha = OPAQUE
            heartImg.userInteractionEnabled = true
        } else if rand == 1 {
            heartImg.alpha = DIM_AlPH
            coinImg.alpha = DIM_AlPH
            coinImg.userInteractionEnabled = false
            heartImg.userInteractionEnabled = false
            
            foodImg.alpha = OPAQUE
            foodImg.userInteractionEnabled = true
        } else {
            heartImg.alpha = DIM_AlPH
            heartImg.userInteractionEnabled = false
            
            foodImg.alpha = DIM_AlPH
            foodImg.userInteractionEnabled = false
            coinImg.alpha = OPAQUE
            coinImg.userInteractionEnabled = true
        }
        
        // padedam random skaiciu i currentItem
        currentItem = rand
        monsterHappy = false
        
        
    }
        
    func gameOver()  {
        timer.invalidate()
        secondMonsterImg.playDeathAnimation()
        sfxDeath.play()
        replayBtn.hidden = false
    }
    func restartGame() {
        replayBtn.hidden = true
        penalties = 0
        secondMonsterImg.playIdleAnimation()
        initializeGame()
        }
    
}


