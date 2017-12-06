//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport


class TimerViewController : UIViewController {
    
    var timeLabel: UILabel!
    
    var seconds = 60
    var timer = Timer()
    var isTimeRunning = false
    var resumeTapped = false
    
    
    @IBAction func startButtonTapped(_sender: UIButton){
        if isTimeRunning == false{
        runTimer()
        }
    }
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func updateTimer(){
        if seconds < 1{
            timer.invalidate()
        } else{
        seconds -= 1
        timeLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    @IBAction func pauseButtonTapped(_sender:UIButton){
        if self.resumeTapped == false{
            timer.invalidate()
            self.resumeTapped = true
        }
        else {
            runTimer()
            self.resumeTapped = false
        }
        
    }
    @IBAction func resetButtonTapped(_ sender: UIButton){
        timer.invalidate()
        seconds = 60
        timeLabel.text = timeString(time: TimeInterval(seconds))
        
        isTimeRunning = false
    }
    
    func timeString(time: TimeInterval) -> String{
        let hours = Int(time)/3600
        let minutes = Int(time)/60%60
        let seconds = Int(time)%60
        return String(format: "%02i: %02i: %02i", hours, minutes, seconds)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        let startButton = UIButton()
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        startButton.setTitle("Start", for: UIControlState())
        startButton.tintColor = .red
        startButton.layer.borderWidth = 2
        
        let pauseButton = UIButton()
       pauseButton.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        pauseButton.setTitle("Start", for: UIControlState())
        pauseButton.tintColor = .blue
        pauseButton.layer.borderWidth = 2
        
        let resumeButton = UIButton()
        resumeButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        resumeButton.setTitle("Start", for: UIControlState())
        resumeButton.tintColor = .green
        resumeButton.layer.borderWidth = 2
        
        view.addSubview(startButton)
        view.addSubview(pauseButton)
        view.addSubview(resumeButton)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        resumeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            pauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pauseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            pauseButton.widthAnchor.constraint(equalToConstant: 30),
            pauseButton.heightAnchor.constraint(equalToConstant: 10),
            
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -60),
            startButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            startButton.widthAnchor.constraint(equalToConstant: 30),
            startButton.heightAnchor.constraint(equalToConstant: 10),
            
            resumeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 60),
            resumeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            resumeButton.widthAnchor.constraint(equalToConstant: 30),
            resumeButton.heightAnchor.constraint(equalToConstant: 10),
            
            
            ])
        
    }
    
}

    

class StopWatchViewController: UIViewController{
    
    
    
    override func viewDidLoad() {
        self.title = "Stopwatch"
        
        let startButton = UIButton()
        startButton.setTitle("Start", for: UIControlState())
        
        let stopButton = UIButton()
        stopButton.setTitle("Stop", for: UIControlState())
        
        
        
    }
    
    
    
}

class MyTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tableViewController = UINavigationController(rootViewController: TimerViewController())
        let tabBarItem1 = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 1)
        
        let tableViewController2 = UINavigationController(rootViewController: StopWatchViewController())
        let tabBarItem2 = UITabBarItem(tabBarSystemItem: .topRated, tag: 2)
        
        tableViewController.tabBarItem = tabBarItem1
        tableViewController2.tabBarItem = tabBarItem2
        
        
        
        self.viewControllers = [tableViewController, tableViewController2]

    }
}



PlaygroundPage.current.liveView = MyTabBarController()
