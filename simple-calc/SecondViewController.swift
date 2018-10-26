//
//  SecondViewController.swift
//  simple-calc
//
//  Created by Anushree Gopal on 10/21/18.
//  Copyright © 2018 Anushree Gopal. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var historyScrollView: UIScrollView!
    var numLabel : Int = 0
    var inputHistory : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        createLabel()

        // Do any additional setup after loading the view.
    }
    
    func createLabel() {
        for text in inputHistory {
            
            let inputLabel = UILabel(frame: CGRect(x: 30, y: 50 + (34 * numLabel), width: 345, height: 25))
            
            inputLabel.text = text
            
            inputLabel.textColor = .black
            
            inputLabel.font = UIFont.systemFont(ofSize: 20)
            
            inputLabel.numberOfLines = 0
            
            inputLabel.lineBreakMode = .byTruncatingTail
            
            inputLabel.sizeToFit()
            
            
            self.numLabel = self.numLabel + 1
            self.historyScrollView.addSubview(inputLabel)
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
