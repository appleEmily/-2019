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
    var text: String!
    
    var count: Int = 0
    var currentHuman: UIImageView!
    var humans = [UIImageView]()
    var befores = [CGPoint]()
    var afters = [CGPoint]()
    var speed: Double = 3.0
    var before_after: Bool = false
    
    
    @IBOutlet weak var taikeiName: UILabel!
    
    //ボタンの名前
    @IBOutlet weak var beforeBtn: UIButton!
    @IBOutlet weak var afterBtn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taikeiName.text = text
        
        /*値を正しく受け取れていないのか。
        受け取ってデータが””になってる
        */
        
        //beforeBtn.tintColor = UIColor.red
        //afterBtn.tintColor = UIColor.black
        
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
    
    
    
    @IBAction func addHuman(){
        for i in (0 ..< humans.count) {
            humans[i].center = befores[i]
            
            humans[i].setNeedsDisplay()
        }
        let newImage = UIImageView(frame: CGRect(x: -80, y: -80, width: 28, height: 28))
        newImage.tag = count
        newImage.image = UIImage(named: "humans.png")
        newImage.center = self.view.center
        humans.append(newImage)
        befores.append(self.view.center)
        afters.append(self.view.center)
        self.view.addSubview(newImage)
        count += 1
        
    }
    
    @IBAction func animation() {
        beforeBtn.setTitleColor(UIColor.black, for: .normal)
        afterBtn.setTitleColor(UIColor.black, for: .normal)
        
        for i in (0 ..< humans.count){
            humans[i].center = befores[i]
            humans[i].setNeedsDisplay()
        }
        UIView.animate(withDuration: speed, animations: {
            for i in (0 ..< self.humans.count) {
                self.humans[i].center = self.afters[i]
            }
        }) { (fin) in
            self.before_after = true
            self.beforeBtn.tintColor = UIColor.red
            self.afterBtn.tintColor = UIColor.black
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.view)
        currentHuman.center = location
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.view)
        currentHuman.center = location
        if before_after {
            afters[currentHuman.tag] = location
        } else {
            befores[currentHuman.tag] = location
            afters[currentHuman.tag] = location
        }
    }
    
    
    
    
    

}
