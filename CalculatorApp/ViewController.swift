//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Dedi Dot on 20/04/19.
//  Copyright © 2019 Dedi Dot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var timesButton: UIButton!
    
    @IBAction func onClickButton3(_ sender: UIButton) {
        if let textButton3 = button3.titleLabel?.text {
            resultLabel.text?.append(textButton3)
        }
    }
    
    @IBAction func onClickButtonClear(_ sender: Any) {
        resultLabel.text = ""
    }
    
    @IBAction func onClickButtonEquals(_ sender: Any) {
        if let textLabel = resultLabel?.text{
            
            if(textLabel.contains("=")){
                showToast(controller: self, message: "Aplikasi hanya bisa 2 perhitungan, Bersihkan terlebih dahulu!", seconds: 1)
                return
            }
            
            let splits = textLabel.split(separator:" ")
            var counts = Array<Int>()
            
            for split in splits{
                if(Int(split) != nil){
                    print("Iya ",split)
                    if let ku = Int(split){
                        counts.append(ku)
                    }
                }else{
                    print("Tidak ", split)
                }
            }
            
            if(textLabel.lowercased().contains("x")
                && counts.count == 2){
                
                let timesResult = counts[0] * counts[1]
                resultLabel.text?.append(" = "+String(timesResult))
            }
        }
    }
    
    func showToast(controller: UIViewController, message : String, seconds: Double) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
    
    @IBAction func onClickTimesButton(_ sender: Any) {
        if let textTimesButton = timesButton.titleLabel?.text {
            if let textLabel = resultLabel?.text{
                if(!textLabel.lowercased().contains("x")){ resultLabel.text?.append(" "+textTimesButton+" ")
                } else{
                    print("sudah ada x")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hallo broxxx")
    }
    
}

