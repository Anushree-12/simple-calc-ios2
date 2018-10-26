//
//  ViewController.swift
//  simple-calc
//
//  Created by Anushree Gopal on 10/16/18.
//  Copyright © 2018 Anushree Gopal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentNumber: Double = 0
    var prevNumber: Double = 0
    var mathOperation = false
    var operationType = 0
    var counter: Double = 0
    var numAverage: Double = 0
    var history: [String] = []
    
    @IBOutlet weak var lblOutput: UILabel!
    
    @IBAction func btnNumber(_ sender: UIButton) {
        if mathOperation == true {
            lblOutput.text = String(sender.tag - 1)
            currentNumber = Double(lblOutput.text!)!
            mathOperation = false
        } else {
            lblOutput.text = lblOutput.text! + String(sender.tag - 1)
            currentNumber = Double(lblOutput.text!)!
        }
    }
    
    @IBAction func btnOperation(_ sender: UIButton) {
        
        if lblOutput.text != "" && sender.tag != 18 && sender.tag != 20 {
            prevNumber = Double(lblOutput.text!)!
            operationType = sender.tag
            mathOperation = true
            
            if operationType == 13 { // count for factorial
                counter = counter + 1
            } else if operationType == 12 { // adding for average
                numAverage = numAverage + prevNumber
                counter = counter + 1
                
            } else if sender.tag == 11 { // Fact
                if prevNumber == 0 {
                    lblOutput.text = "1"
                }  else {
                    var number = 1
                    for i in 1...Int(prevNumber) {
                        number = number * i
                    }
                    lblOutput.text = String(number)
                    history.append("\(String(prevNumber)) \("Fact") = \(String(describing: lblOutput.text))")
                }
            }
        } else if sender.tag == 18 {
            if operationType == 12 { // Avg
                numAverage = numAverage + currentNumber
                counter = counter + 1
                lblOutput.text = String(numAverage / counter)
                counter = 0
                numAverage = 0
            } else if operationType == 13 { // Count
                lblOutput.text = String(counter + 1)
                counter = 0
            } else if operationType == 14 { // Divide
                lblOutput.text = String(prevNumber / currentNumber)
            } else if operationType == 15 { // Multiply
                lblOutput.text = String(prevNumber * currentNumber)
            } else if operationType == 16 { // Minus
                lblOutput.text = String(prevNumber - currentNumber)
            } else if operationType == 17 { // Add
                lblOutput.text = String(prevNumber + currentNumber)
            } else if operationType == 19 { // Mod
                lblOutput.text = String(prevNumber.truncatingRemainder(dividingBy: currentNumber))
            }
            
            history.append("\(String(prevNumber)) \(String(operationType)) \(String(currentNumber)) = \(String(describing: lblOutput.text))")
            
            
        } else if sender.tag == 20 {
            lblOutput.text = ""
            prevNumber = 0
            currentNumber = 0
            operationType = 0
            counter = 0
            numAverage = 0
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "History" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.inputHistory = self.history
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}
