//
//  ViewController.swift
//  PullUps
//
//  Created by Дмитро Селиванов on 19.12.2022.
//

import UIKit
import CoreMotion
import CoreLocation
import AVKit
//import AudioToolbox

class ViewController: UIViewController{
    
    @IBOutlet weak var doneButton: UIButton!
    
    var player: AVAudioPlayer?
    
    @IBOutlet weak var notDoneButton: UIButton!

    @IBOutlet weak var firstSetLabel: UILabel!
    @IBOutlet weak var secondSetLabel: UILabel!
    @IBOutlet weak var thirdSetLabel: UILabel!
    @IBOutlet weak var fourthSetLabel: UILabel!
    @IBOutlet weak var fifthSetLabel: UILabel!
    
    @IBOutlet weak var showListButton: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    
    var plan: [String] = []
    
    var levelNumber = 0
    
    var numberOfSet = 2
    
    var timer = Timer()
    var timerDuration = 120
    
    let proximity = UIDevice()
    
    var customPlan = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserSets.shared.selectionSet)
        
        if customPlan{
            customPlan = false
        } else {
            if UserSets.shared.selectionSet != nil {
                for i in 0...4{
                    let num = UserSets.shared.selectionSet![i]
                    plan.append(num)
                }
            } else {
                plan = ["0", "0", "0", "0", "0"]
            }
        }
        proximity.isProximityMonitoringEnabled = true
        
        firstSetLabel.text = plan[0]
        secondSetLabel.text = plan[1]
        thirdSetLabel.text = plan[2]
        fourthSetLabel.text = plan[3]
        fifthSetLabel.text = plan[4]
        
        timerLabel.text = matching(str: plan[0])
    }
    
    @IBAction func setDone(_ sender: Any) {
        timerLabel.font = UIFont(name: "DIN Condensed Bold", size: 120)
        if timer.isValid {
            timer.invalidate()
            timerLabel.text = matching(str: plan[numberOfSet-2])
        } else {
        switch numberOfSet {
        case 1:
            firstSetLabel.textColor = .red
            startTimer()
        case 2:
            firstSetLabel.textColor = .gray
            secondSetLabel.textColor = .red
            startTimer()
        case 3:
            secondSetLabel.textColor = .gray
            thirdSetLabel.textColor = .red
            startTimer()
        case 4:
            thirdSetLabel.textColor = .gray
            fourthSetLabel.textColor = .red
            startTimer()
        case 5:
            fourthSetLabel.textColor = .gray
            fifthSetLabel.textColor = .red
            startTimer()
        default:
            timerLabel.text = "Готово"
            numberOfSet = 0
            fifthSetLabel.textColor = .gray
        }
        print(numberOfSet)
        numberOfSet += 1
        }
    }
    
    @IBAction func notDone(_ sender: Any) {
        if numberOfSet > 1{
                timerLabel.font = UIFont(name: "DIN Condensed Bold", size: 50)
        timerLabel.text = """
Всмысле
блять
ты не
выполнил?
А ну делай
\(plan[numberOfSet-2]) подтягиваний!
"""
        }
        self.doneButton.titleLabel?.text = "Сделал"
        timer.invalidate()
    }
    
    func startTimer() {
        self.timerDuration = 120
        self.timerLabel.text = """
        Отдых
        \(self.timerDuration) сек.
        """
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self] Timer in
// Разблокируй, если надо будет проговорить
//            let synthesizer = AVSpeechSynthesizer()
            self.doneButton.titleLabel?.text = "Остановить таймер"
            self.timerDuration -= 1
            self.timerLabel.text = """
            Отдых
            \(self.timerDuration) сек.
            """
            if self.timerDuration == 0 {
                AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {   }
                AudioServicesPlaySystemSound(1013)
                self.timer.invalidate()
// Разблокируй, если надо будет проговорить
//                let pullUpsCount = AVSpeechUtterance(string: "Пора сделать \(self.plan[self.numberOfSet-2]) подтягиваний")
//                pullUpsCount.voice = AVSpeechSynthesisVoice(language: "ru-RU")
//                pullUpsCount.rate = 0.5
//                synthesizer.speak(pullUpsCount)
                self.timerLabel.text = self.matching(str: self.plan[self.numberOfSet-2])
                self.doneButton.titleLabel?.text = "Сделал"
            }
            print(self.timerDuration)
        })
        RunLoop.current.add(timer, forMode: .common)
    }
    
    func matching(str: String) -> String {
        var num = Int(str)!
        if num > 10 {
            if num < 20 { num = 1 }
            num = num % 10
        }
        switch num {
        case 2...4: return "\(str) раза"
        default: return "\(str) раз"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let svc = segue.destination as? SetsTableViewController, segue.identifier == "toPlan"{
            svc.delegate = self
            customPlan = true
        }
    }
}

extension ViewController: SetsDelegate{
    func setDelegate(_ data: [String]) {
        firstSetLabel.text = data[0]
        secondSetLabel.text = data[1]
        thirdSetLabel.text = data[2]
        fourthSetLabel.text = data[3]
        fifthSetLabel.text = data[4]
    }
}
