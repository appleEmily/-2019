//
//  TitleViewController.swift
//  隊形2019
//
//  Created by 野崎絵未里 on 2019/04/19.
//  Copyright © 2019年 野崎絵未里. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {

    @IBOutlet weak var titleName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backToTop() {
        self.dismiss(animated: true, completion: nil)
        
        
    }
    

    
    
    @IBAction func start() {
        performSegue(withIdentifier: "goStage", sender: nil)
        
    }
    @IBAction func taikeiTitle() {
        
        //StageViewController.text1 = taikeiTitle.text
        
    }
    
    override func next(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goStage" {
            let next = segue.destination as! StageViewController
            next.navigationItem.title = titleName().text
            
            //navigationBar に名前を出せない
        }
    }
        
    
}
