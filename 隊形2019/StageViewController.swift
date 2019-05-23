//  StageViewController.swift
//  Created by 野崎絵未里 on 2019/04/19.
//  Copyright © 2019年 野崎絵未里. All rights reserved.
import UIKit
import RealmSwift

class StageViewController: UIViewController {
    
    let realm = try! Realm()
    var save = Save()
    //受け取った名前
    var text: String!
    var recievedId: Int!
    var data:Results<Save>!
    
    var count: Int = 0
    var humans = [UIImageView]()
    var befores: [CGPoint] = []
    
    var afters:[CGPoint] = []
    var speed: Double = 3.0
    var isAfter: Bool = false
    var deleteCheck: Bool = true
    var first: Bool = true
    var gapX:CGFloat = 0.0
    var gapY:CGFloat = 0.0
    var isFromList = false
    
    var afterSaveBefore = false
    var afterSaveAfter = false
    
    
    //@IBOutlet weak var taikeiName: UILabel!
    //ボタンの名前
    @IBOutlet weak var beforeBtn: UIButton!
    @IBOutlet weak var afterBtn: UIButton!
    
    @IBOutlet weak var taikeiName: UINavigationItem!
    
    var isFirst = true
    
    //この中に書く
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //前のページでtitleを入力した時の話。
        taikeiName.title = text
        //データ全部持ってきた。モデルたくさん
        data = realm.objects(Save.self)
        
        if isFromList && isFirst {
            taikeiName.title = data[recievedId].titleName
            
            befores.removeAll()
            afters.removeAll()
            
            for i in 0 ..< data[recievedId].beforeMoveX.count {
                befores.append(CGPoint(x: data[recievedId].beforeMoveX[i],
                                       y: data[recievedId].beforeMoveY[i]))
                afters.append(CGPoint(x: data[recievedId].afterMoveX[i], y:data[recievedId].afterMoveY[i]))
                let newImageView = UIImageView(frame: CGRect(x: data[recievedId].afterMoveX[i], y: data[recievedId].afterMoveY[i], width: 25, height: 25))
                newImageView.image = UIImage(named: "people.png")
                humans.append(newImageView)
                
                print(befores)
                print(afters)
                
                humans[i].center = befores[i]
                humans[i].setNeedsDisplay()
                newImageView.tag = humans.count + 1
                newImageView.isUserInteractionEnabled = true
                view.addSubview(newImageView)
            }
            isFirst = false
        }
    }
    @IBAction func goTop(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        
        if !isFromList {
            if let last = realm.objects(Save.self).sorted(byKeyPath: "id" ,ascending: true).last {
                save.id = last.id + 1
            } else {
              save.id   = 0
            }
            print(realm.objects(Save.self))
            print(save.id)
            save.titleName   = String(text)
            
            save.titleName = taikeiName.title!
            
            //配列の保存
            for i in 0 ..< humans.count {
                //realmに用意したbaforeMoveXの配列（list)にbefores[何番目か]のx座標をDoubleに変換して入れる。
                save.beforeMoveX.append(Double(befores[i].x))
                save.beforeMoveY.append(Double(befores[i].y))
                save.afterMoveX.append(Double(afters[i].x))
                save.afterMoveY.append(Double(afters[i].y))
            }
            //}
            try! realm.write {
                realm.add(save)
            }
        } else {
            try! realm.write {
                data[recievedId].beforeMoveX = List<Double>()
                data[recievedId].beforeMoveY = List<Double>()
                data[recievedId].afterMoveX = List<Double>()
                data[recievedId].afterMoveY = List<Double>()
                
                for i in 0..<befores.count {
                    data[recievedId].beforeMoveX.append(Double(befores[i].x))
                    data[recievedId].beforeMoveY.append(Double(befores[i].y))
                    data[recievedId].afterMoveX.append(Double(afters[i].x))
                    data[recievedId].afterMoveY.append(Double(afters[i].y))
                }
                realm.add(data, update: true)
            }
        }
    }
    @IBAction func before() {
        isAfter = false
        //afterSaveBefore = true
        beforeBtn.setTitleColor(UIColor.white, for: .normal)
        afterBtn.setTitleColor(UIColor.black, for: .normal)
        for i in (0 ..< humans.count) {
            humans[i].center = befores[i]
            humans[i].setNeedsDisplay()
        }
    }
    @IBAction func past() {
        isAfter = true
        //afterSaveAfter = true
        beforeBtn.setTitleColor(UIColor.black, for: .normal)
        afterBtn.setTitleColor(UIColor.white, for: .normal)
        for i in (0 ..< humans.count) {
            if first && !isFromList {
                humans[i].center = befores[i]
            }
            if !first && !isFromList {
                humans[i].center = afters[i]
            }
            if first && isFromList {
                humans[i].center = afters[i]
            }
            if !first && isFromList {
                humans[i].center = afters[i]
            }
            humans[i].setNeedsDisplay()
        }
        first = false
    }
    @IBAction func addHuman(){
        for i in (0 ..< humans.count) {
            humans[i].center = befores[i]
            
            humans[i].setNeedsDisplay()
        }
        let newImageView = UIImageView(frame: CGRect(x: -80, y: -80, width: 25, height: 25))
        
        newImageView.image = UIImage(named: "people.png")
        
        newImageView.tag = humans.count + 1
        
        newImageView.center = self.view.center
        
        newImageView.isUserInteractionEnabled = true //大切な文章だったっぽい
        
        humans.append(newImageView)
        befores.append(self.view.center)
        afters.append(self.view.center)
        view.addSubview(newImageView)
        //count = count + 1
    }
    
    @IBAction func changePink() {
        for i in (0 ..< humans.count) {
            humans[i].center = befores[i]
            
            humans[i].setNeedsDisplay()
        }
        let newImageView = UIImageView(frame: CGRect(x: -80, y: -80, width: 25, height: 25))
        
        newImageView.image = UIImage(named: "pink.png")
        
        newImageView.tag = humans.count + 1
        
        newImageView.center = self.view.center
        
        newImageView.isUserInteractionEnabled = true //大切な文章だったっぽい
        
        humans.append(newImageView)
        befores.append(self.view.center)
        afters.append(self.view.center)
        view.addSubview(newImageView)
        
    }
    
    @IBAction func kyoshu() {
        for i in (0 ..< humans.count) {
            humans[i].center = befores[i]
            
            humans[i].setNeedsDisplay()
        }
        let newImageView = UIImageView(frame: CGRect(x: -80, y: -80, width: 30, height: 40))
        
        newImageView.image = UIImage(named: "kyoshu.png")
        
        newImageView.tag = humans.count + 1
        
        newImageView.center = self.view.center
        
        newImageView.isUserInteractionEnabled = true //大切な文章だったっぽい
        
        humans.append(newImageView)
        befores.append(self.view.center)
        afters.append(self.view.center)
        view.addSubview(newImageView)
    }
    
    
    @IBAction func tree(_ sender: Any) {
        for i in (0 ..< humans.count) {
            humans[i].center = befores[i]
            
            humans[i].setNeedsDisplay()
        }
        let newImageView = UIImageView(frame: CGRect(x: -80, y: -80, width: 45, height: 50))
        
        newImageView.image = UIImage(named: "tree1.png")
        
        newImageView.tag = humans.count + 1
        
        newImageView.center = self.view.center
        
        newImageView.isUserInteractionEnabled = true //大切な文章だったっぽい
        
        humans.append(newImageView)
        befores.append(self.view.center)
        afters.append(self.view.center)
        view.addSubview(newImageView)
        
    }
    
    @IBAction func block(_ sender: Any) {
        for i in (0 ..< humans.count) {
            humans[i].center = befores[i]
            
            humans[i].setNeedsDisplay()
        }
        let newImageView = UIImageView(frame: CGRect(x: -80, y: -80, width: 38, height: 30))
        
        newImageView.image = UIImage(named: "block.png")
        
        newImageView.tag = humans.count + 1
        
        newImageView.center = self.view.center
        
        newImageView.isUserInteractionEnabled = true //大切な文章だったっぽい
        
        humans.append(newImageView)
        befores.append(self.view.center)
        afters.append(self.view.center)
        view.addSubview(newImageView)
    }
    
    @IBAction func red() {
        for i in (0 ..< humans.count) {
            humans[i].center = befores[i]
            
            humans[i].setNeedsDisplay()
        }
        let newImageView = UIImageView(frame: CGRect(x: -80, y: -80, width: 20, height: 45))
        
        newImageView.image = UIImage(named: "redTape.png")
        
        newImageView.tag = humans.count + 1
        
        newImageView.center = self.view.center
        
        newImageView.isUserInteractionEnabled = true //大切な文章だったっぽい
        
        humans.append(newImageView)
        befores.append(self.view.center)
        afters.append(self.view.center)
        view.addSubview(newImageView)
    }
    
    
    
    
    @IBAction func animation() {
        beforeBtn.setTitleColor(UIColor.white, for: .normal)
        afterBtn.setTitleColor(UIColor.white, for: .normal)
        
        for i in (0 ..< humans.count){
            humans[i].center = befores[i]
            humans[i].setNeedsDisplay()
        }
        UIView.animate(withDuration: speed, animations: {
            for i in (0 ..< self.humans.count) {
                self.humans[i].center = self.afters[i]
            }
        }) { (fin) in
            self.isAfter = true
            self.beforeBtn.tintColor = UIColor.white
            self.afterBtn.tintColor = UIColor.black
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 最初にタッチした指のみ取得
        if let touch = touches.first {
            if let touchedView = touch.view {
                
                gapX = touch.location(in: view).x - touchedView.center.x
                gapY = touch.location(in: view).y - touchedView.center.y
                if touchedView.tag >= 1 {
                    
                    touchedView.center = CGPoint(x: touch.location(in: view).x - gapX, y: touch.location(in: view).y - gapY)
                    if !isAfter {
                        befores[touchedView.tag - 1] = touchedView.center
                        
                    } else {
                        afters[touchedView.tag - 1] = touchedView.center
                    }
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
                if touchedView.tag >= 1 {
                    
                    if !isAfter {
                        befores[touchedView.tag - 1] = touchedView.center
                    } else {
                        afters[touchedView.tag - 1] = touchedView.center
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //ここに書いたら毎回なっちゃうよ。ゴミ箱の上に来たらって書かなきゃいけない
        //deleteCheck = true
        
        //gapXとgapYの初期化
        gapX = 0.0
        gapY = 0.0
        if let touch = touches.first {
            
            if !isFromList{
                
            }
            // タッチしたビューをviewプロパティで取得する
//            if let touchedView = touch.view {
//                if touchedView.tag >= 1 {
//                    touchedView.center = CGPoint(x: touch.location(in: view).x - gapX, y: touch.location(in: view).y - gapY)
//
//                    if deleteCheck {
//                        if !isAfter {
//
//                            befores.remove(at: touchedView.tag - 1)
//
//                        } else {
//
//                            afters.remove(at: touchedView.tag - 1)
//                        }
//                        humans.remove(at: touchedView.tag - 1)
//                        humans[touchedView.tag - 1].removeFromSuperview()
            
                        //humans[touchedView.tag - 1] = nil
            
                                            //}
            
            
//                }
//            }
        }
    }
    
    
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        // touchesEndedと同じ処理
        self.touchesEnded(touches, with: event)
    }
    
    @IBAction func changeSpeed(_ sender: UISlider) {
        speed = Double(sender.value)
    }
    
    //    @IBAction func delete() {
    //
    //    }
    
}
