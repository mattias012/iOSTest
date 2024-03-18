//
//  ResultViewController.swift
//  MA
//
//  Created by Mattias Axelsson on 2024-03-12.
//

import UIKit

class ResultViewController: UIViewController {

    

    @IBOutlet weak var resultLabel: UILabel!
    
    var tempValues = (-100...100).map{$0}
    
    var recivingName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = recivingName
    }
    
   
 
}
