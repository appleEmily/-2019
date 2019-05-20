//
//  TableViewController.swift
//  隊形2019
//
//  Created by 野崎絵未里 on 2019/05/10.
//  Copyright © 2019年 野崎絵未里. All rights reserved.
//

import UIKit
import RealmSwift


class TableViewController: UITableViewController {
    
    @IBOutlet weak var back: UIBarButtonItem!
    
    let realm = try! Realm()
    
    var text2:String!
    //保存したデータを入れる箱
    var data:Results<Save>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        //用意した箱にあデータを受け取る。ここで初めてデータが入る
        data = realm.objects(Save.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return data.count
          
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルの内容を取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        var titleNameBox = data[indexPath.row].titleName
        let bmoveX = data[indexPath.row].beforeMoveX
        let bmoveY = data[indexPath.row].beforeMoveY
        let amoveX = data[indexPath.row].afterMoveX
        let amoveY = data[indexPath.row].afterMoveY
        
        cell.saveTitleName.text = titleNameBox
        
        text2 = titleNameBox
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var titleNameBox = data[indexPath.row].titleName
        let bmoveX = data[indexPath.row].beforeMoveX
        let bmoveY = data[indexPath.row].beforeMoveY
        let amoveX = data[indexPath.row].afterMoveX
        let amoveY = data[indexPath.row].afterMoveY
        
        //_print(bmoveX)
        text2 = titleNameBox

        performSegue(withIdentifier: "reopen", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "reopen" {
            
            let stageViewController = segue.destination as? StageViewController
            
            //stageViewController?.text = text2
            stageViewController?.recievedId = sender as? Int
            
            stageViewController?.isFromList = true
        }
    }
    
    @IBAction func back(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}
