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

