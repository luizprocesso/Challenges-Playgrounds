//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport


class TimerViewController : UIViewController {
    
    var timeLabel = UILabel()
    
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
        navigationItem.title = "Timer"
        
        view.backgroundColor = .gray
        
        timeLabel.textAlignment = .center
        timeLabel.backgroundColor = .white
        timeLabel.font = UIFont(name: "arial", size: 50)
        
        let startButton = UIButton()
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        startButton.backgroundColor = .black
        startButton.setTitle("Start", for: UIControlState())
        startButton.tintColor = .red
        startButton.layer.borderWidth = 2
        
        let pauseButton = UIButton()
        pauseButton.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        pauseButton.backgroundColor = .black
        pauseButton.setTitle("Pause", for: UIControlState())
        pauseButton.tintColor = .blue
        pauseButton.layer.borderWidth = 2
        
        let resumeButton = UIButton()
        resumeButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        resumeButton.backgroundColor = .black
        resumeButton.setTitle("Reset", for: UIControlState())
        resumeButton.tintColor = .green
        resumeButton.layer.borderWidth = 2
        
        view.addSubview(timeLabel)
        view.addSubview(startButton)
        view.addSubview(pauseButton)
        view.addSubview(resumeButton)
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        resumeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            pauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -60),
            pauseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            pauseButton.widthAnchor.constraint(equalToConstant: 100),
            pauseButton.heightAnchor.constraint(equalToConstant: 30),
            
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            startButton.widthAnchor.constraint(equalToConstant: 220),
            startButton.heightAnchor.constraint(equalToConstant: 30),
            
            resumeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 60),
            resumeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            resumeButton.widthAnchor.constraint(equalToConstant: 100),
            resumeButton.heightAnchor.constraint(equalToConstant: 30),
            
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            timeLabel.widthAnchor.constraint(equalToConstant: 300),
            timeLabel.heightAnchor.constraint(equalToConstant: 100),
            
            
            
            ])
        
        }
    
}



class StopWatchViewController: UIViewController{
    
    var timeLabel = UILabel()
    
    var seconds = 3585
    var timer: Timer?
    var isTimeRunning = false
    var resumeTapped = false
    
    
    @IBAction func startButtonTapped(_sender: UIButton){
        if isTimeRunning == false{
            runTimer()
        }
    }
    
    func runTimer(){
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(StopWatchViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func updateTimer(){
     
            seconds += 1
            timeLabel.text = timeString(time: TimeInterval(seconds))
        
    }
    
    @IBAction func pauseButtonTapped(_sender:UIButton){
        if self.resumeTapped == false{
            timer?.invalidate()
            self.resumeTapped = true
        }
        else {
            runTimer()
            self.resumeTapped = false
        }
        
        
    }
    @IBAction func resetButtonTapped(_ sender: UIButton){
        timer?.invalidate()
        seconds = 0
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
        navigationItem.title = "Stopwatch"
        
        view.backgroundColor = .blue
        
        timeLabel.textAlignment = .center
        timeLabel.backgroundColor = .white
        timeLabel.font = UIFont(name: "arial", size: 50)
        
        let startButton = UIButton()
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        startButton.backgroundColor = .black
        startButton.setTitle("Start", for: UIControlState())
        startButton.tintColor = .red
        startButton.layer.borderWidth = 2
        
        let pauseButton = UIButton()
        pauseButton.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        pauseButton.backgroundColor = .black
        pauseButton.setTitle("Pause", for: UIControlState())
        pauseButton.tintColor = .blue
        pauseButton.layer.borderWidth = 2
        
        let resumeButton = UIButton()
        resumeButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        resumeButton.backgroundColor = .black
        resumeButton.setTitle("Reset", for: UIControlState())
        resumeButton.tintColor = .green
        resumeButton.layer.borderWidth = 2
        
        view.addSubview(timeLabel)
        view.addSubview(startButton)
        view.addSubview(pauseButton)
        view.addSubview(resumeButton)
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        resumeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            pauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -60),
            pauseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            pauseButton.widthAnchor.constraint(equalToConstant: 100),
            pauseButton.heightAnchor.constraint(equalToConstant: 30),
            
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            startButton.widthAnchor.constraint(equalToConstant: 220),
            startButton.heightAnchor.constraint(equalToConstant: 30),
            
            resumeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 60),
            resumeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            resumeButton.widthAnchor.constraint(equalToConstant: 100),
            resumeButton.heightAnchor.constraint(equalToConstant: 30),
            
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            timeLabel.widthAnchor.constraint(equalToConstant: 300),
            timeLabel.heightAnchor.constraint(equalToConstant: 100),
            
            
            
            ])
        
    }
    
    
        
        
}
    
    
    



class MyTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tableViewController = UINavigationController(rootViewController: TimerViewController())
        let tabBarItem1 = UITabBarItem(title: "Timer", image: #imageLiteral(resourceName: "clock-timer-7.png"), tag: 1)
        
        let tableViewController2 = UINavigationController(rootViewController: StopWatchViewController())
        let tabBarItem2 = UITabBarItem(title: "Stopwatch", image: #imageLiteral(resourceName: "clock-stopwatch-7.png"), tag: 2)
        
        tableViewController.tabBarItem = tabBarItem1
        tableViewController2.tabBarItem = tabBarItem2
        
        
        
        self.viewControllers = [tableViewController, tableViewController2]
        
    }
}



PlaygroundPage.current.liveView = MyTabBarController()


