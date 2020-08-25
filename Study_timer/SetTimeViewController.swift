//
//  SetTimeViewController.swift
//  Study_timer
//
//  Created by Min_MacbookPro on 2020/08/19.
//  Copyright © 2020 Min_MacbookPro. All rights reserved.
//

import UIKit

protocol ChangeViewController {
    func updateViewController()
}

class SetTimeViewController: UIViewController {
    
    
    @IBOutlet weak var Label_alltime: UILabel!
    @IBOutlet weak var Label_timer: UILabel!
    @IBOutlet weak var Text_H1: UITextField!
    @IBOutlet weak var Text_M1: UITextField!
    @IBOutlet weak var Text_H2: UITextField!
    @IBOutlet weak var Text_M2: UITextField!
    
    var H1: Int = 8
    var H2: Int = 0
    var M1: Int = 0
    var M2: Int = 50
    
    var second: Int = 3000
    var allTime: Int = 28800
    
    var setViewControllerDelegate : ChangeViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Text_H1.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        Text_M1.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        Text_H2.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        Text_M2.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        
    }
    @objc func textFieldDidChange(textField: UITextField){
        //총 목표시간, 타이머 시간을 자동으로 계산해서 보여줄 생각
        
        if(Text_H1.text != "")
        {
            H1 = Int(Text_H1.text!)!
            if(Text_M1.text != "")
            {
                M1 = Int(Text_M1.text!)!
            }
            else
            {
                M1 = 0
            }
        }
        else
        {
            H1 = 8
            if(Text_M1.text != "")
            {
                M1 = Int(Text_M1.text!)!
            }
            else
            {
                M1 = 0
            }
        }
        if(Text_H2.text != "")
        {
            H2 = Int(Text_H2.text!)!
            if(Text_M2.text != "")
            {
                M2 = Int(Text_M2.text!)!
            }
            else
            {
                M2 = 50
            }
        }
        else
        {
            H2 = 0
            if(Text_M2.text != "")
            {
                M2 = Int(Text_M2.text!)!
            }
            else
            {
                M2 = 50
            }
        }
        
        Label_alltime.text = String(H1) + ":" + String(M1) + ":00"
        Label_timer.text = String(H2) + ":" + String(M2) + ":00"
        
    }
    
    @IBAction func Button_SET(_ sender: UIButton) {
        allTime = H1*3600 + M1*60
        second = H2*3600 + M2*60
        UserDefaults.standard.set(allTime, forKey: "allTime")
        UserDefaults.standard.set(second, forKey: "second")
        setViewControllerDelegate.updateViewController()
        self.dismiss(animated: true, completion: nil)
    }
    

}
