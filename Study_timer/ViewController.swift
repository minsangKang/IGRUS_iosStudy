//
//  ViewController.swift
//  Study_timer
//
//  Created by Min_MacbookPro on 2020/07/26.
//  Copyright © 2020 Min_MacbookPro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Label_Persent: UILabel!
    @IBOutlet weak var Label_AllTime: UILabel!
    @IBOutlet weak var Label_SumTime: UILabel!
    @IBOutlet weak var Label_Timer: UILabel!
    
    @IBOutlet weak var Button_START_Outlet: UIButton!
    @IBOutlet weak var Button_STOP_Outlet: UIButton!
    @IBOutlet weak var Button_RESTART_Outlet: UIButton!
    
    
    //화면에 들어왔을 시 실행되는 메소드
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Button_START_Outlet.layer.cornerRadius = 8
        Button_STOP_Outlet.layer.cornerRadius = 8
        Button_RESTART_Outlet.layer.cornerRadius = 8
    }

    @IBAction func Button_START_Action(_ sender: UIButton) {
        Label_Timer.text = "안녕하세요!"
    }
    @IBAction func Button_STOP_Action(_ sender: UIButton) {
        Label_Timer.text = "종료!"
    }
    @IBAction func Button_RESTART_Action(_ sender: UIButton) {
        Label_Timer.text = "재시작!"
    }
    @IBAction func Button_RESET_Action(_ sender: UIButton) {
        Label_Timer.text = "초기화!"
    }
    @IBAction func Button_TimeSET_Action(_ sender: UIButton) {
        Label_Timer.text = "시간 설정!"
    }
    
    
}

