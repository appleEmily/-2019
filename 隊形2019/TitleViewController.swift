//
//  TitleViewController.swift
//  隊形2019
//
//  Created by 野崎絵未里 on 2019/04/19.
//  Copyright © 2019年 野崎絵未里. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {

    @IBOutlet weak var titleName: UITextField!
    
    var text = String()
    
    
    //titleはまだ出せません。。。DAY5でやる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goStage" {
            let next = segue.destination as? StageViewController
            
            
            //let text:String = self.titleName.text!
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backToTop() {
        self.dismiss(animated: true, completion: nil)
        
    }

    
    
    @IBAction func start() {
        performSegue(withIdentifier: "goStage", sender: nil)
        
    }
}
