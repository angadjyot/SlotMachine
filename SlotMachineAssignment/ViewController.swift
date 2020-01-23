//
//  ViewController.swift
//  SlotMachineAssignment
//
//  Created by Angadjot singh on 11/01/20.
//  Copyright © 2020 Angadjot singh. All rights reserved.
//

// Author's Name - Angadjot Singh , Garima Prashar , Harnam Kaur
// Student Number - 301060981,      301093329      , 301093907
// Date last Modified - 22th janaury 2020
// Program Descriptor - This file includes the logic of the slot machine game
// Revision History - 1.0

import UIKit
import AVFoundation

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    
//  declaring the outlets for ui components
    
    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var betAmount: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var moneyStepper: UIStepper!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var resetGame: UIButton!
    @IBOutlet weak var quitGame: UIButton!
    
// declaring the variables
    var totalAmount = 1000
    var selectedBetAmount = 0
    var betLine = ["","",""]
    var outcome = [0,0,0]
    
    var check = 0
    
    var beans = 0
    var dragon = 0
    var kiwi = 0
    var watermellon = 0
    var mango = 0
    var orange = 0
    var berries = 0
    var blueBerries = 0
    
    var loss = 0
    var gems = 0
    var chocolate = 0
    var strawberry = 0
    var sprinkleChocolate = 0
    var sprinklepink = 0
    var pinkWhite = 0
    var greenSprinkle = 0
    
    
    
 // declaring audio player reference
    var bombSoundEffect: AVAudioPlayer?
    var timer = Timer()
    var alertTimer = Timer()
    var winMessageTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  //    code for corner radius
        self.playButton.layer.cornerRadius = 10.0
        self.playButton.layer.masksToBounds = true
        money.text = String(totalAmount)
    
        
  //    setting the stepper values
        moneyStepper.minimumValue = 0
        moneyStepper.maximumValue = 1000
        moneyStepper.wraps = true
        moneyStepper.stepValue = 10
    
        
    //    code for corner radius
        self.resetGame.layer.cornerRadius = 10.0
        self.resetGame.layer.masksToBounds = true
        
        self.quitGame.layer.cornerRadius = 10.0
        self.quitGame.layer.masksToBounds = true
        
        
       // checkJackpot()
        
    }
   
 
 // checking the range for values
    
    func checkRange(value:Int,lowerBounds:Int,upperBounds:Int)->Int{
        if (value>=lowerBounds && value<=upperBounds){
               return value
        }
         return 0
//        else{
//            return !value
//        }
    }
   
    
 // function for playing the sound
    func play(sound name : String){
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav") else{
            return
        }
        bombSoundEffect = try? AVAudioPlayer(contentsOf: url)
        bombSoundEffect?.play()
    }
    
    

    func soundFunction(){
    
        play(sound: "spin")
  
  //    calling the play function after the sound function
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(playFunction), userInfo: nil, repeats: false)
    }
    
  // function for checking the winning probability
    func checkTheWinProbability(){
    
        
        if gems == 3 || chocolate == 3 || strawberry == 3 || sprinkleChocolate == 3 || sprinklepink == 3 || pinkWhite == 3 || greenSprinkle == 3{
            print("won")
            play(sound: "win")
            winMessageTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(winMessageAlert), userInfo: nil, repeats: false)
            
        }else{
           
            print("loss")
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(alertMessage), userInfo: nil, repeats: false)
            
        }
    }
    
    @objc func winMessageAlert(){
        
        let alert:UIAlertController = UIAlertController(title: "Message", message: "You Win !! \n Congratulations", preferredStyle: .alert)
        let action:UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @objc func alertMessage(){
        let alert:UIAlertController = UIAlertController(title: "Message", message: "OOPS! Please play again to increase your winning chances.", preferredStyle: .alert)
        let action:UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    

    
//    @objc func playFunction(){
//
//        beans = 0
//        dragon = 0
//        kiwi = 0
//        watermellon = 0
//        mango = 0
//        orange = 0
//        berries = 0
//        blueBerries = 0
//
//        //        play(sound: "spin")
//
//
//        for i in 0..<3{
//            // print("i is ",i)
//            outcome[i] = Int.random(in: 0..<65)
//            //print("outcome is",outcome[i],outcome)
//            let x = outcome[i]
//            //print("x is",x)
//
//            switch(outcome[i]){
//
//            case checkRange(value: x, lowerBounds: 1, upperBounds: 27):
//                //   print("no is between 1 and 27",x)
//                betLine[i] = "Mr_beans"
//                beans = beans+1
//                break
//            case checkRange(value: x, lowerBounds: 28, upperBounds: 37):
//                //    print("no is between 28 and 37",x)
//                betLine[i] = "Dragon-Fruit"
//                dragon = dragon+1
//                break
//            case checkRange(value: x, lowerBounds: 38, upperBounds: 46):
//                //    print("no is between 38 and 46",x)
//                betLine[i] = "kiwi"
//                kiwi = kiwi+1
//                break
//
//            case checkRange(value: x, lowerBounds: 47, upperBounds: 54):
//                //    print("no is between 47 and 54",x)
//                betLine[i] = "watermellon"
//                watermellon = watermellon+1
//                break
//            case checkRange(value: x, lowerBounds: 55, upperBounds: 59):
//                //    print("no is between 55 and 59",x)
//                betLine[i] = "mango"
//                mango = mango+1
//                break
//
//            case checkRange(value: x, lowerBounds: 60, upperBounds: 62):
//                //    print("no is between 60 and 62",x)
//                betLine[i] = "orange"
//                orange = orange+1
//                break
//
//            case checkRange(value: x, lowerBounds: 63, upperBounds: 64):
//                //   print("no is between 63 and 64",x)
//                betLine[i] = "berries"
//                berries = berries+1
//                break
//
//            case checkRange(value: x, lowerBounds: 65, upperBounds: 65):
//
//                //   print("no is 65",outcome[i])
//                betLine[i] = "blueBerries"
//                blueBerries = blueBerries+1
//                break
//
//            default:
//                break
//            }
//
//  //       reloading the collection view
//            self.check = 1
//            self.collectionView.reloadData()
//            checkTheWinProbability()
//        }
//
//  //       function for adding the or removing the money
//           addOrRemoveMoney()
//
//    }
    
 // function for finding the randon numbers and displaying images accordingly .
    
    @objc func playFunction(){
         loss = 0
         gems = 0
         chocolate = 0
         strawberry = 0
         sprinkleChocolate = 0
         sprinklepink = 0
         pinkWhite = 0
         greenSprinkle = 0
        
        
        for i in 0..<3{
            // print("i is ",i)
            outcome[i] = Int.random(in: 0..<65)
            //print("outcome is",outcome[i],outcome)
            let x = outcome[i]
            //print("x is",x)
            
            switch(outcome[i]){
                
            case checkRange(value: x, lowerBounds: 1, upperBounds: 27):
                print("no is between 1 and 27",x)
                betLine[i] = "loss"
                loss = loss+1
                print("loss",loss)
                break
            case checkRange(value: x, lowerBounds: 28, upperBounds: 37):
                print("no is between 28 and 37",x)
                betLine[i] = "gems"
                gems = gems+1
                print("gems",gems)
                break
            case checkRange(value: x, lowerBounds: 38, upperBounds: 46):
                print("no is between 38 and 46",x)
                betLine[i] = "chocolate"
                chocolate = chocolate+1
                print("chocolate",chocolate)
                break
                
            case checkRange(value: x, lowerBounds: 47, upperBounds: 54):
                print("no is between 47 and 54",x)
                betLine[i] = "strawberry-1"
                strawberry = strawberry+1
                print("strawberry",strawberry)
                break
            case checkRange(value: x, lowerBounds: 55, upperBounds: 59):
                print("no is between 55 and 59",x)
                betLine[i] = "sprinkleChocolate"
                sprinkleChocolate = sprinkleChocolate+1
                print("sprinkleChocolate",sprinkleChocolate)

                break
                
            case checkRange(value: x, lowerBounds: 60, upperBounds: 62):
                print("no is between 60 and 62",x)
                betLine[i] = "sprinklePink"
                sprinklepink = sprinklepink+1
                print("sprinklepink",sprinklepink)
                break
                
            case checkRange(value: x, lowerBounds: 63, upperBounds: 64):
                print("no is between 63 and 64",x)
                betLine[i] = "pinkWhite"
                pinkWhite = pinkWhite+1
                print("pinkWhite",pinkWhite)
                break
                
            case checkRange(value: x, lowerBounds: 65, upperBounds: 65):
                
                print("no is 65",outcome[i])
                betLine[i] = "greenSprinkle"
                greenSprinkle = greenSprinkle+1
                print("greenSprinkle",greenSprinkle)
                break
                
            default:
                break
            }
            
            //       reloading the collection view
            self.check = 1
            self.collectionView.reloadData()
//            checkTheWinProbability()
        }
        
        checkTheWinProbability()
//       function for adding the or removing the money
        
        addOrRemoveMoney()
        
    }
    
    
    
  //       function for adding the or removing the money
    func addOrRemoveMoney(){
        
        if dragon == 3 || kiwi == 3 || watermellon == 3 || mango == 3 || orange == 3 || berries == 3 || blueBerries == 3 {
    
  //     adding the winning to the user amount
            totalAmount = totalAmount+selectedBetAmount
            money.text = String(totalAmount)
         
            checkJackpot()
            
            
        }else{
            
            if totalAmount == 0{
                self.moneyStepper.isEnabled = false
                self.betAmount.text = ""
                self.playButton.isEnabled = false
            }else{
                
                print("else")
                print(totalAmount,selectedBetAmount)
                totalAmount = totalAmount-selectedBetAmount
                print(totalAmount)
                money.text = String(totalAmount)
                
                if totalAmount == 0{
                    self.playButton.isEnabled = false
                }else{
                    print("else part")
                }
                
            }
        }
    }
    
    
    func checkJackpot(){
        
        let jackpotTry = (Int.random(in: 0..<51)+1)
        let jackpotWin = (Int.random(in: 0..<51)+1)
        
        print(jackpotTry,jackpotWin)
        if jackpotTry == jackpotWin{
            
           totalAmount = totalAmount+5000
           money.text = String(totalAmount)
            
            
       let alert:UIAlertController = UIAlertController(title: "Congratulations", message: "You won the 5000$ Jackpot!!.", preferredStyle: .alert)
       let action:UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
       alert.addAction(action)
       self.present(alert, animated: true, completion: nil)
            
        }else{
            print("no jackpot sorry")
        }
        
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
  
 // default function for collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell)!
        
        if check == 0{
            cell.image.image = UIImage(named: "win")
        }else if check == 1{
            
            
            let imageIndex = betLine[indexPath.row]
            let animate = UIImage.animatedImageNamed(imageIndex, duration: 2)
            cell.image.image = animate
            cell.image.image = UIImage(named: imageIndex)
            cell.image.layer.cornerRadius = 10.0
            cell.image.layer.masksToBounds = true
            
        }
    
        return cell
        
    }
    
    
//  action for stepper for increasing or decreasing the bet money amount .
    @IBAction func stepperAction(_ sender: UIStepper) {
        
        if totalAmount == 0{
            
            let alert:UIAlertController = UIAlertController(title: "Message", message: "You can't play right now as you have do not have enough balance in your account.", preferredStyle: .alert)
            let action:UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }else{
          
            print(moneyStepper.value)
            betAmount.text = String(moneyStepper.value)
            
            selectedBetAmount = Int(moneyStepper.value)
            print("selectedBetAmount",selectedBetAmount)
            
        }
    }
    
// action for spinning the reel
    @IBAction func playButtonAction(_ sender: UIButton) {

        if totalAmount == 0{
            self.moneyStepper.isEnabled = false
        }else{
            if selectedBetAmount == 0{
                print("please select the betting amount")
                let alert:UIAlertController = UIAlertController(title: "Message", message: "Please add the betting amount", preferredStyle: .alert)
                let action:UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                
            }else{
                
                soundFunction()
            }
            
        }
        
    }
    
    
  //  action for resseting the game
    @IBAction func reset(_ sender: UIButton) {
        self.playButton.isEnabled = true
        self.totalAmount = 1000
        self.money.text = String(totalAmount)
        self.selectedBetAmount = 0
        self.betAmount.text = ""
        self.moneyStepper.value = 0
    }
    
 // action for quitting the game
    @IBAction func quit(_ sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                exit(0)
            }
        }
    }
    
    
}

