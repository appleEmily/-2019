//
//  ViewController.swift
//  chikichiki
//
//  Created by 野崎絵未里 on 2019/05/11.
//  Copyright © 2019年 野崎絵未里. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var number:Int! = 0
    
    @IBOutlet weak var result: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func plus(_ sender: Any) {
        number = number + 1
        result.text = String(number)
    }
    
    @IBAction func minus(_ sender: Any) {
        number = number - 1
        result.text = String(number)
        
    }
    
    @IBAction func clear(_ sender: Any) {
        number = 0
        result.text = String(number)
    }
    
}

