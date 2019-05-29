//
//  SecondViewController.swift
//  HW2
//
//  Created by 野崎絵未里 on 2019/05/29.
//  Copyright © 2019年 野崎絵未里. All rights reserved.
//

import UIKit

class SecondViewController: ViewController {
    
    var recieve: String!

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = recieve

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
