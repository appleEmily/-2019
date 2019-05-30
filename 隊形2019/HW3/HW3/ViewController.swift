//
//  ViewController.swift
//  HW3
//
//  Created by 野崎絵未里 on 2019/05/30.
//  Copyright © 2019年 野崎絵未里. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var minionArray: [String] = ["Kevin.png","bob.png","stuart.png"]
    var nameArray: [String] = ["kevin","Bob","Stuart"]
    var number: Int = 2
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func back(_ sender: Any) {
        if number == 0 {
            number = 2
        } else {
            number -= 1
        }
        image.image = UIImage(named: minionArray[number])
        label.text = nameArray[number]
        
    }
    
    @IBAction func next(_ sender: Any) {
        if number == 2 {
            number = 0
        } else {
            number += 1
        }
        image.image = UIImage(named: minionArray[number])
        label.text = nameArray[number]
    }
    


}

