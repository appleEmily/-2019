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
    
    let realm = try! Realm()
    var save = Save()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // tableViewにカスタムセルを登録
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルの内容を取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        return cell
        
    }
    


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

}
