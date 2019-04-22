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
    var text = String()
    
    
    @IBOutlet weak var taikeiName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //taikeiName.text = text
        
//        taikeiName.text = titleName
        // Do any additional setup after loading the view.
        
        //値を正しく受け取れていないのか。
        //受け取ってデータが””になってる
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //受け取った値を代入
        
        //taikeiName.text = text
        
    }
    
    @IBAction func tryButton() {
            taikeiName.text = text
            }
    
    @IBAction func goTop(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
