//  StageViewController.swift
//  Created by 野崎絵未里 on 2019/04/19.
//  Copyright © 2019年 野崎絵未里. All rights reserved.
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
    
    var gapX:CGFloat = 0.0
    var gapY:CGFloat = 0.0
    
    
    @IBOutlet weak var taikeiName: UILabel!
    
    //ボタンの名前
    @IBOutlet weak var beforeBtn: UIButton!
    @IBOutlet weak var afterBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    
    
    @IBAction func addHuman(){
        for i in (0 ..< humans.count) {
            humans[i].center = befores[i]
            
            humans[i].setNeedsDisplay()
        }
        let newImageView = UIImageView(frame: CGRect(x: -80, y: -80, width: 40, height: 40))
        
        newImageView.image = UIImage(named: "people.png")
        
        newImageView.tag = 1
        
        newImageView.center = self.view.center
        
        newImageView.isUserInteractionEnabled = true //大切な文章だったっぽい
        
        //humans.append(newImageView)
        //befores.append(self.view.center)
        //afters.append(self.view.center)
        view.addSubview(newImageView)
        //count = count + 1
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
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first! //このタッチイベントの場合確実に1つ以上タッチ点があるので`!`つけてOKです
//        let location = touch.location(in: self.view) //in: には対象となるビューを入れます
//        Swift.print(location)
//
//    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 最初にタッチした指のみ取得
        if let touch = touches.first {
            if let touchedView = touch.view {
                
                gapX = touch.location(in: view).x - touchedView.center.x
                gapY = touch.location(in: view).y - touchedView.center.y
                if touchedView.tag == 1 {
                    touchedView.center = CGPoint(x: touch.location(in: view).x - gapX, y: touch.location(in: view).y - gapY)
                    
                }
                
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // touchesBeganと同じ処理だが、gapXとgapYはタッチ中で同じものを使い続ける
        // 最初にタッチした指のみ取得
        if let touch = touches.first {
            // タッチしたビューをviewプロパティで取得する
            if let touchedView = touch.view {
                
                touchedView.center = CGPoint(x: touch.location(in: view).x - gapX, y: touch.location(in: view).y - gapY)
               
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //gapXとgapYの初期化
        gapX = 0.0
        gapY = 0.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        // touchesEndedと同じ処理
        self.touchesEnded(touches, with: event)
    }

    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        // touchesBeganと同じ処理
//        self.touchesBegan(touches, with: event)
//    }
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touchevent = touches.first!
//        let view = touchevent.view!
//        let old = touchevent.previousLocation(in: self.view)
//        let new = touchevent.location(in: self.view)
//        view.frame.origin.x += (new.x - old.x)
//        view.frame.origin.y += (new.y - old.y)
//    }
    
    //きょめ
//        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//            let touch = touches.first!
//            let location = touch.location(in: self.view)
//            currentHuman.center = location
//            if before_after {
//                afters[currentHuman.tag] = location
//            } else {
//                befores[currentHuman.tag] = location
//                afters[currentHuman.tag] = location
//            }
//        }

    //ここから下は昔エミリが書いたやつ未完成
    //おそらく　let の中身の定数にしたいものがはっきりしていない。
    //if let location = touch.location(in: self.view) {
    //   currentHuman.location = location
    // if before_after {
    //    afters[currentHuman.tag] = location
    //} else {
    //     befores[currentHuman.tag] = location
    //    afters[currentHuman.tag] = location

}
