//
//  ViewController.swift
//  Study_timer
//
//  Created by Min_MacbookPro on 2020/07/26.
//  Copyright © 2020 Min_MacbookPro. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet weak var Label_Persent: UILabel!
    @IBOutlet weak var Label_AllTime: UILabel!
    @IBOutlet weak var Label_SumTime: UILabel!
    @IBOutlet weak var Label_Timer: UILabel!
    
    @IBOutlet weak var Button_START_Outlet: UIButton!
    @IBOutlet weak var Button_STOP_Outlet: UIButton!
    @IBOutlet weak var Button_RESTART_Outlet: UIButton!
    
    @IBOutlet weak var Button_RESET_outlet: UIButton!
    @IBOutlet weak var Button_Time_SET: UIButton!
    
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
    
    let BUTTON_CLICK = UIColor(named: "ButtonClick")
    let BUTTON_COLOR = UIColor(named: "ButtonColor")
    let BACKGROUND_COLOR = UIColor(named: "BackgroundColor")
    
    
    
    //화면에 들어왔을 시 실행되는 메소드
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Button_START_Outlet.layer.cornerRadius = 8
        Button_STOP_Outlet.layer.cornerRadius = 8
        Button_RESTART_Outlet.layer.cornerRadius = 8
        getTimeData2()
        updateShow()
    }

    @IBAction func Button_START_Action(_ sender: UIButton) {
        //버튼 클릭했을 때 타이머 작동할수 있는 상태일 경우 -> 타이머 작동
        if(timeTrigger)
        {
            checkTimeTrigger()
            timeTrigger = false
        }
        //실행시 배경색을 검은색으로 바꾸겠다
        startColor()
        //시작을 누른 경우 시작, 재시작 버튼 비활성화, stop 버튼 활성
        startEnable()
    }
    @IBAction func Button_STOP_Action(_ sender: UIButton) {
        endGame()
        //스탑된 경우 배경색을 바꾸겠다
        stopColor()
        //스탑이 된 경우 START 버튼을 클릭할 수 있게 설정하겠다
        stopEnable()
    }
    @IBAction func Button_RESTART_Action(_ sender: UIButton) {
        Int_seconds = 3000
        updateShow()
        stopColor()
        stopEnable()
        Button_RESTART_Outlet.backgroundColor = BUTTON_CLICK
        Button_RESTART_Outlet.isUserInteractionEnabled = false
    }
    @IBAction func Button_RESET_Action(_ sender: UIButton) {
        getTimeData()
        updateShow()
        stopColor()
        stopEnable()
        Button_RESTART_Outlet.backgroundColor = BUTTON_CLICK
        Button_RESTART_Outlet.isUserInteractionEnabled = false
    }
    @IBAction func Button_TimeSET_Action(_ sender: UIButton) {
        Label_Timer.text = "시간 설정!"
    }
    
    //타이머 작동 메소드, 실행시 1초마다 updateCounter가 실행된다
    func checkTimeTrigger() {
        realTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter(){
        //종료될 경우 생성
        
        //타이머 시간이 종료된 경우
        if(Int_seconds < 1)
        {
            endGame()
            stopColor()
            stopEnable()
            AudioServicesPlaySystemSound(1254) //진동
            AudioServicesPlaySystemSound(4095) //특정한 소리
        }
        //총 남은시간이 종료된 경우
        else if(Int_allTimes < 1)
        {
            endGame()
        }
        //그외에 타이머가 실행되어야 하는 경우
        else
        {
            Int_seconds = Int_seconds - 1
            Int_sum = Int_sum + 1
            Int_allTimes = Int_allTimes - 1
            saveTimeData()
        }
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
        
        //삼항연산자를 이용하여 만약에 10보다 작은 경우 0을 추가하여 출력하겠다
        let stringS = S<10 ? "0"+String(S) : String(S)
        let stringM = M<10 ? "0"+String(M) : String(M)
        
        let returnString = String(H) + ":" + stringM + ":" + stringS
        return returnString
    }
    
    //정지되는 경우의 메소드
    func endGame()
    {
        realTime.invalidate()
        timeTrigger = true
    }
    
    func startColor()
    {
        self.view.backgroundColor = UIColor.black
        Button_START_Outlet.backgroundColor = BUTTON_CLICK
        Button_STOP_Outlet.backgroundColor = BUTTON_COLOR
        Button_RESTART_Outlet.backgroundColor = BUTTON_CLICK
    }
    
    func startEnable()
    {
        Button_START_Outlet.isUserInteractionEnabled = false
        Button_STOP_Outlet.isUserInteractionEnabled = true
        Button_RESTART_Outlet.isUserInteractionEnabled = false
        Button_RESET_outlet.isUserInteractionEnabled = false
        Button_Time_SET.isUserInteractionEnabled = false
    }
    
    func stopColor()
    {
        self.view.backgroundColor = BACKGROUND_COLOR
        Button_START_Outlet.backgroundColor = BUTTON_COLOR
        Button_STOP_Outlet.backgroundColor = BUTTON_CLICK
        Button_RESTART_Outlet.backgroundColor = BUTTON_COLOR
    }
    
    func stopEnable()
    {
        Button_START_Outlet.isUserInteractionEnabled = true
        Button_STOP_Outlet.isUserInteractionEnabled = false
        Button_RESTART_Outlet.isUserInteractionEnabled = true
        Button_RESET_outlet.isUserInteractionEnabled = true
        Button_Time_SET.isUserInteractionEnabled = true
    }
    
    //저장되어 있는 시간을 불러오는 메소드, 8시간, 50분을 재설정 해주는 메소드
    func getTimeData()
    {
        Int_seconds = UserDefaults.standard.value(forKey: "second") as? Int ?? 3000
        Int_allTimes = UserDefaults.standard.value(forKey: "allTime") as? Int ?? 28800
        Int_sum = 0
    }
    
    //위의 getTimeData 메소드는 남은시간, 타이머를 정한 크기,
    //아리의 getTimeData 메소드는 실시간으로 변경된 시간을 가져오는 메소드
    func getTimeData2()
    {
        Int_seconds = UserDefaults.standard.value(forKey: "second2") as? Int ?? 3000
        Int_allTimes = UserDefaults.standard.value(forKey: "allTime2") as? Int ?? 28800
        Int_sum = UserDefaults.standard.value(forKey: "sum2") as? Int ?? 0
    }
    
    //타이머가 1초마다 각 시간을 저장하는 메소드
    func saveTimeData()
    {
        UserDefaults.standard.set(Int_allTimes, forKey: "allTime2")
        UserDefaults.standard.set(Int_seconds, forKey: "second2")
        UserDefaults.standard.set(Int_sum, forKey: "sum2")
    }
    
}

