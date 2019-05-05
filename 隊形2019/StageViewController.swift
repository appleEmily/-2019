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
        let newImage = UIImageView(image: UIImage(named: "people.png"))
        
        newImage.tag = count
        newImage.image = UIImage(named: "humans.png")
        newImage.center = CGPoint(x: view.center.x, y: view.center.y)
        
        newImage.isUserInteractionEnabled = true
        
        humans.append(newImage)
        befores.append(self.view.center)
        afters.append(self.view.center)
        view.addSubview(newImage)
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
                
                if count == 1 {
                    gapX = touch.location(in: view).x - touchedView.center.x
                    gapY = touch.location(in: view).y - touchedView.center.y
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
                // tagでおじさんかそうでないかを判断する
                if count == 1 {
                    // gapX,gapYの取得は行わない
                    touchedView.center = CGPoint(x: touch.location(in: view).x - gapX, y: touch.location(in: view).y - gapY)
                }
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // gapXとgapYの初期化
        gapX = 0.0
        gapY = 0.0
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
//
//        let aTouch = touches.first //as! UITouch
//        // 移動した先の座標を取得.
//        let location = aTouch?.location(in: self.view)
//        // 移動する前の座標を取得.
//        let prevLocation = aTouch!.previousLocation(in: self.view)
//        // CGRect生成.
//        var myFrame: CGRect = self.view.frame
//        // ドラッグで移動したx, y距離をとる.
//        let deltaX: CGFloat = (location?.x)! - prevLocation.x
//        let deltaY: CGFloat = location!.y - prevLocation.y
//        // 移動した分の距離をmyFrameの座標にプラスする.
//        myFrame.origin.x += deltaX
//        myFrame.origin.y += deltaY
//        // frameにmyFrameを追加.
//        self.view.frame = myFrame
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
