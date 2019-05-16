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
    
    //dataがとっていた変数を入れる箱
    var data:Results<Save>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        data = realm.objects(Save.self)
        
//        tableView.delegate = self
//        tableView.dataSource = self
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
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete{
    }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "reopen" {
            
            let stageViewController = segue.destination as? StageViewController
            
            stageViewController?.text = text2
            
        }
    }
    
    @IBAction func back(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}
