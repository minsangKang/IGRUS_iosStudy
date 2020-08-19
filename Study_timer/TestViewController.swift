//
//  TestViewController.swift
//  Study_timer
//
//  Created by Min_MacbookPro on 2020/08/19.
//  Copyright © 2020 Min_MacbookPro. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var Label_test: UILabel!
    
    override func viewDidLoad() {
        Label_test.alpha = 0
        
        Label_test.transform = CGAffineTransform(translationX: 0, y: 50)
        super.viewDidLoad()

        
    }
    
    @IBAction func Button_animation(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
//            self.Label_test.alpha = 1
//            self.Label_test.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//            self.Label_test.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Label_test.alpha = 1
            self.Label_test.transform = CGAffineTransform(translationX: 0, y: 0)
                .concatenating(CGAffineTransform(scaleX: 1.2, y: 1.2))
        })
    }
    

}
