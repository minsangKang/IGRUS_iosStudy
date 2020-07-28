//
//  ViewController.swift
//  Study_timer
//
//  Created by Min_MacbookPro on 2020/07/26.
//  Copyright © 2020 Min_MacbookPro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Label_hello: UILabel!
    @IBOutlet weak var Text_num: UITextField!
    @IBOutlet weak var Text_name: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Button_click(_ sender: UIButton) {
//        Label_hello.text = "Button Click!"
        
        //버튼을 클릭 했을 시 학번, 이름을 보여준다
//        Label_hello.text = "학번 : " + Text_num.text! + "\n이름 : " + Text_name.text!
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "View2") else {return}
        
        self.present(nextVC, animated: true)
        
    }
    
}

