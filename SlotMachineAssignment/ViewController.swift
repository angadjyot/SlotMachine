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
    
    var totalAmount = 1000.0
    var selectedBetAmount = 0.0
    
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
        
        playFunction()
    }
    
    func checkRange(value:Int,lowerBounds:Int,upperBounds:Int)->Int{
        if (value>=lowerBounds && value<=upperBounds){
               return value
        }
        return 0
//        else{
//            return value
//        }
    }
    
    func playFunction(){
        
        var betLine = ["","","",""]
        var outcome = [0,0,0]

        
        for i in 0..<3{
            print("i is ",i)
            outcome[i] = Int.random(in: 0..<65)
            print("outcome is",outcome[i],outcome)
            let x = outcome[i]
            print("x is",x)
            switch(outcome[i]){
                
            case checkRange(value: x, lowerBounds: 1, upperBounds: 27):

                print("no is between 1 and 27",x)

                break
            case checkRange(value: x, lowerBounds: 28, upperBounds: 37):
                
                print("no is between 28 and 37",x)
                break
            case checkRange(value: x, lowerBounds: 38, upperBounds: 46):
                
                print("no is between 38 and 46",x)
                break
                
            case checkRange(value: x, lowerBounds: 47, upperBounds: 54):
                
                print("no is between 47 and 54",x)
                break
            case checkRange(value: x, lowerBounds: 55, upperBounds: 59):
                
                print("no is between 55 and 59",x)
                break
                
            case checkRange(value: x, lowerBounds: 60, upperBounds: 62):
                
                print("no is between 60 and 62",x)
                break
                
            case checkRange(value: x, lowerBounds: 63, upperBounds: 64):
                
                print("no is between 63 and 64",x)
                break
                
            case checkRange(value: x, lowerBounds: 65, upperBounds: 65):
                
                print("no is 65",outcome[i])
                break
                
                
                
            default:
                break
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
        
        cell.image.image = UIImage(named: "win")
        cell.image.layer.cornerRadius = 10.0
        cell.image.layer.masksToBounds = true
        
        return cell
        
    }
    
    
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        
//        if moneyStepper.value >
        
//        betAmount.text = String(moneyStepper.value)
        
        print(moneyStepper.value)
//        totalAmount = totalAmount-10
        betAmount.text = String(moneyStepper.value)
        
        selectedBetAmount = moneyStepper.value
        print("selectedBetAmount",selectedBetAmount)
        
       
        
    }
    

    @IBAction func playButtonAction(_ sender: UIButton) {
        totalAmount = totalAmount-selectedBetAmount
        money.text = String(totalAmount)
    }
    
    
}

