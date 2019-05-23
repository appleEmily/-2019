//
//  realm.swift
//  隊形2019
//
//  Created by 野崎絵未里 on 2019/05/09.
//  Copyright © 2019年 野崎絵未里. All rights reserved.
//

import Foundation

import RealmSwift

class Save: Object {
    
    //@objc dynamic var beforeMove: Double = 0.0
    //@objc dynamic var afterMove: Double = 0.0
    @objc dynamic var titleName: String = ""
    @objc dynamic var id = 0
    
    
    
    //配列として保存している
    
    var beforeMoveX = List<Double>()
    var beforeMoveY = List<Double>()
    var afterMoveX = List<Double>()
    var afterMoveY = List<Double>()
    
    override static func primaryKey() -> String {
        return "id"
    }
}
