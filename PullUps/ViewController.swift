import UIKit
import CoreMotion
import CoreLocation
import AVKit
import AudioToolbox

class ViewController: UIViewController{
    
//    @IBOutlet weak var planPicker: UIPickerView!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserSets.shared.selectionSet)
        
        if UserSets.shared.selectionSet != nil {
            for i in 0...4{
                let num = UserSets.shared.selectionSet![i]
                plan.append(num)
            }
        } else {
            plan = ["0", "0", "0", "0", "0"]
        }
        
//        plan = [3, 15, 33, 3, 5] // ListOfSetsViewController.levelFour[5]
        proximity.isProximityMonitoringEnabled = true
        
        firstSetLabel.text = plan[0]
        secondSetLabel.text = plan[1]
        thirdSetLabel.text = plan[2]
        fourthSetLabel.text = plan[3]
        fifthSetLabel.text = plan[4]
        
        timerLabel.text = matching(str: plan[0])
        
/*
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 1
        
        guard let startDate = Calendar.current.date(byAdding: .hour, value: -8, to: Date()) else {
            return
        }
        if CMPedometer.isDistanceAvailable() {
            print("бля")
//            self.pedometer.startUpdates(from: Date()) { data, error in
            pedometer.queryPedometerData(from: startDate, to: Date()) { data, error in
                print("бля2")
                if error == nil{
                    if let response = data {
                        DispatchQueue.main.async {
                            print(response.distance)
                            print(response.numberOfSteps)
                            self.accelerateLabel.text = "\(response.numberOfSteps.intValue)"
                        }
                    }
                }
            }
        }
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if let data = self.manager.accelerometerData {
                    let x = data.acceleration.x
                    let y = data.acceleration.y
                    let z = data.acceleration.z
                    self.accelerateLabel.text = """
x = \(x)
y = \(y)
z = \(z)

Что это значит?
Хуй знает.
Но цыфарки бегают
"""
 
                }
        }
 */
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
            fifthSetLabel.textColor = .white
            startTimer()
        case 2:
            firstSetLabel.textColor = .white
            secondSetLabel.textColor = .red
            startTimer()
        case 3:
            secondSetLabel.textColor = .white
            thirdSetLabel.textColor = .red
            startTimer()
        case 4:
            thirdSetLabel.textColor = .white
            fourthSetLabel.textColor = .red
            startTimer()
        case 5:
            fourthSetLabel.textColor = .white
            fifthSetLabel.textColor = .red
            startTimer()
        default:
            timerLabel.text = "Готово"
            numberOfSet = 0
            fifthSetLabel.textColor = .white
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
            // Говорилка
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
//                for i in 0...self.plan[self.numberOfSet-2]{
//                    AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {   }
//                }
                self.timer.invalidate()
                // разблокируй, если надо будет проговорить
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
            if num < 20{
                num = 1
            }
            num = num % 10
        }
        switch num {
        case 2: return "\(str) раза"
        case 3: return "\(str) раза"
        case 4: return "\(str) раза"
        default: return "\(str) раз"
        }
    }
}
