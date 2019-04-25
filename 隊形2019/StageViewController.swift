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
    
    var currentHuman: UIImageView!
    var humans = [UIImageView]()
    var befores = [CGPoint]()
    var afters = [CGPoint]()
    var before_after: Bool = false
    
    
    @IBOutlet weak var taikeiName: UILabel!
    
    //ボタンの名前
    @IBOutlet weak var beforeBtn: UIButton!
    @IBOutlet weak var afterBtn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //taikeiName.text = text
        
//        taikeiName.text = titleName
        // Do any additional setup after loading the view.
        
        /*値を正しく受け取れていないのか。
        受け取ってデータが””になってる
        */
        
        //beforeBtn.tintColor = UIColor.red
        //afterBtn.tintColor = UIColor.black
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //受け取った値を代入
        
        //taikeiName.text = text
        
    }
    
    //これを押したらtitle表示の試しボタン
    @IBAction func tryButton() {
            taikeiName.text = text
            }
    
    @IBAction func goTop(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func before() {
        before_after = false
        //beforeBtn.tintColor = UIColor.black
        //afterBtn.tintColor = UIColor.red
         beforeBtn.setTitleColor(UIColor.black, for: .normal)
        afterBtn.setTitleColor(UIColor.red, for: .normal)

    }
    
    @IBAction func past() {
        before_after = true
//        beforeBtn.tintColor = UIColor.red
//        afterBtn.tintColor = UIColor.black
        
        beforeBtn.setTitleColor(UIColor.red, for: .normal)
        afterBtn.setTitleColor(UIColor.black, for: .normal)
    }
    
    @IBAction func normalHuman() {
        
        
    }
    
    
    

}
