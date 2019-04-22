//
//  StageViewController.swift
//  隊形2019
//
//  Created by 野崎絵未里 on 2019/04/19.
//  Copyright © 2019年 野崎絵未里. All rights reserved.
//

import UIKit

class StageViewController: UIViewController {
    
    //受け取った名前
    var titleName: String!
    
    
    
    @IBOutlet weak var taikeiName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taikeiName.text = titleName
        
        print(titleName)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goTop(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

}
