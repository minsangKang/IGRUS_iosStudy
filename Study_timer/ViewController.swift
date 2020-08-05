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
    
    //타이머 시간 : 50분으로 설정
    //총 남은시간 : 8시간 설정
    //누적시간 : 0부터 시작
    
    //타이머 시간
    var Int_seconds: Int = 3000
    //총 남은시간
    var Int_allTimes: Int = 28800
    //누적시간
    var Int_sum: Int = 0
    
    //타이머 작동 메소드를 실행할 수 있는지 여부
    var timeTrigger: Bool = true
    //타이머 작동을 위한 기본작업?
    var realTime = Timer()
    
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
        //버튼 클릭했을 때 타이머 작동할수 있는 상태일 경우 -> 타이머 작동
        if(timeTrigger)
        {
            checkTimeTrigger()
            timeTrigger = false
        }
    }
    @IBAction func Button_STOP_Action(_ sender: UIButton) {
        Label_Timer.text = "종료!"
        realTime.invalidate()
        timeTrigger = true
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
    
    //타이머 작동 메소드, 실행시 1초마다 updateCounter가 실행된다
    func checkTimeTrigger() {
        realTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter(){
        Int_seconds = Int_seconds - 1
        Int_sum = Int_sum + 1
        Int_allTimes = Int_allTimes - 1
        print("타이머 시간 : " + String(Int_seconds))
        print("누적 시간 : " + String(Int_sum))
        print("총 남은 시간 : " + String(Int_allTimes))
        updateShow()
    }
    
    //타이머 숫자를 표시해주는 메소드
    func updateShow()
    {
        Label_Timer.text = printTime(temp: Int_seconds)
        Label_AllTime.text = printTime(temp: Int_allTimes)
        Label_SumTime.text = printTime(temp: Int_sum)
    }

    //printTime이라는 이름의 메소드, temp라는 이름으로 값을 가져와 메소드 내에서 사용하겠다. 근데 가져오는 자료형이 Int 형이다
    //메소드 반환 형태는 String
    func printTime(temp: Int) -> String
    {
        //초 -> 60으로 나눈 나머지 : 초
        //초 -> 60으로 나눈 몫 : 분
        //초 -> 60*60으로 나눈 몫 : 시간
        
        //다만, 분 : 61이상으로 뜰수가 있다
        //해결 : 분 - 시간*60
        
        let S: Int = temp%60
        let H: Int = temp/3600
        let M: Int = temp/60 - H*60
        
        let returnString = String(H) + ":" + String(M) + ":" + String(S)
        return returnString
    }
    
}

