//
//  ViewController.swift
//  HW2
//
//  Created by 野崎絵未里 on 2019/05/29.
//  Copyright © 2019年 野崎絵未里. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var word: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendNext" {
           let svc = segue.destination as? SecondViewController
            
            svc?.recieve = word.text
        }
    }
    


}

