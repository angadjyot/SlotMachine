//
//  ViewController.swift
//  SlotMachineAssignment
//
//  Created by Angadjot singh on 11/01/20.
//  Copyright © 2020 Angadjot singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    
    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var betAmount: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var moneyStepper: UIStepper!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var resetGame: UIButton!
    @IBOutlet weak var quitGame: UIButton!
    
    
    var totalAmount = 1000
    var selectedBetAmount = 0
    var betLine = ["","","",""]
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playButton.layer.cornerRadius = 10.0
        self.playButton.layer.masksToBounds = true
        money.text = String(totalAmount)
        
        moneyStepper.minimumValue = 0
        moneyStepper.maximumValue = 1000
        moneyStepper.wraps = true
        moneyStepper.stepValue = 10
        
        
        let randomInt = Int.random(in: 1..<65)
        print(randomInt)
        
      //  playFunction()
    }
    
    func checkRange(value:Int,lowerBounds:Int,upperBounds:Int)->Int{
        if (value>=lowerBounds && value<=upperBounds){
               return value
        }
         return 0
//        else{
//            return !value
//        }
    }
    
    func playFunction(){
    
        beans = 0
        dragon = 0
        kiwi = 0
        watermellon = 0
        mango = 0
        orange = 0
        berries = 0
        blueBerries = 0
        
        for i in 0..<3{
           // print("i is ",i)
            outcome[i] = Int.random(in: 0..<65)
            //print("outcome is",outcome[i],outcome)
            let x = outcome[i]
            //print("x is",x)
            
            switch(outcome[i]){
                
            case checkRange(value: x, lowerBounds: 1, upperBounds: 27):
             //   print("no is between 1 and 27",x)
                betLine[i] = "Mr_beans"
                beans = beans+1
                break
            case checkRange(value: x, lowerBounds: 28, upperBounds: 37):
            //    print("no is between 28 and 37",x)
                betLine[i] = "Dragon-Fruit"
                dragon = dragon+1
                break
            case checkRange(value: x, lowerBounds: 38, upperBounds: 46):
            //    print("no is between 38 and 46",x)
                betLine[i] = "kiwi"
                kiwi = kiwi+1
                break
                
            case checkRange(value: x, lowerBounds: 47, upperBounds: 54):
            //    print("no is between 47 and 54",x)
                betLine[i] = "watermellon"
                watermellon = watermellon+1
                break
            case checkRange(value: x, lowerBounds: 55, upperBounds: 59):
            //    print("no is between 55 and 59",x)
                betLine[i] = "mango"
                mango = mango+1
                break
                
            case checkRange(value: x, lowerBounds: 60, upperBounds: 62):
            //    print("no is between 60 and 62",x)
                betLine[i] = "orange"
                orange = orange+1
                break
                
            case checkRange(value: x, lowerBounds: 63, upperBounds: 64):
             //   print("no is between 63 and 64",x)
                betLine[i] = "berries"
                berries = berries+1
                break
                
            case checkRange(value: x, lowerBounds: 65, upperBounds: 65):
                
             //   print("no is 65",outcome[i])
                betLine[i] = "blueBerries"
                blueBerries = blueBerries+1
                break
                
            default:
                break
            }
            
            
            self.check = 1
            self.collectionView.reloadData()
            checkTheWinProbability()
        }
         addOrRemoveMoney()
    }
    
    
    func checkTheWinProbability(){
         if dragon == 3 || kiwi == 3 || watermellon == 3 || mango == 3 || orange == 3 || berries == 3 || blueBerries == 3 {
            
            let alert:UIAlertController = UIAlertController(title: "Message", message: "You Win !! \n Congratulations", preferredStyle: .alert)
            let action:UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }else{
           
                let alert:UIAlertController = UIAlertController(title: "Message", message: "OOPS! Please play again to increase your winning chances.", preferredStyle: .alert)
                let action:UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func addOrRemoveMoney(){
        
        if dragon == 3 || kiwi == 3 || watermellon == 3 || mango == 3 || orange == 3 || berries == 3 || blueBerries == 3 {
            
            totalAmount = totalAmount+selectedBetAmount
            money.text = String(totalAmount)
        
            
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
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell)!
        
        if check == 0{
            cell.image.image = UIImage(named: "win")
        }else if check == 1{
            let imageIndex = betLine[indexPath.row]
            cell.image.image = UIImage(named: imageIndex)
            cell.image.layer.cornerRadius = 10.0
            cell.image.layer.masksToBounds = true
            
            
        }
    
        return cell
        
    }
    
    
    
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
    

    @IBAction func playButtonAction(_ sender: UIButton) {

        if totalAmount == 0{
            
            self.moneyStepper.isEnabled = false
        
            
            
//            let alert:UIAlertController = UIAlertController(title: "Message", message: "You can't play right now as you have do not have balance in your account.", preferredStyle: .alert)
//            let action:UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
//            alert.addAction(action)
//            self.present(alert, animated: true, completion: nil)
        }else{
            if selectedBetAmount == 0{
                print("please select the betting amount")
                let alert:UIAlertController = UIAlertController(title: "Message", message: "Please add the betting amount", preferredStyle: .alert)
                let action:UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                
            }else{
                
                playFunction()
            }
            
        }
        
    }
    
    
    
    @IBAction func reset(_ sender: UIButton) {
        self.playButton.isEnabled = true
        self.totalAmount = 1000
        self.money.text = String(totalAmount)
        self.selectedBetAmount = 0
        self.betAmount.text = ""
        self.moneyStepper.value = 0
    }
    
    
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

