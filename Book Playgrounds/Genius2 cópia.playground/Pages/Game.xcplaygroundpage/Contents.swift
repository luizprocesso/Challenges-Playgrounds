import UIKit
import PlaygroundSupport
import AVFoundation
import Darwin

class mainView: UIViewController, AVAudioPlayerDelegate {
    var startGameButton = UIButton()
    var levelLabel = UILabel()
    
    var sound1Player:AVAudioPlayer!
    var sound2Player:AVAudioPlayer!
    var sound3Player:AVAudioPlayer!
    var sound4Player:AVAudioPlayer!
    
    var playlist = [Int]()
    var currentItem = 0
    var numberOfTaps = 0
    var readyForUser = false
    
    var redButton = UIButton()
    var yellowButton = UIButton()
    var greenButton = UIButton()
    var blueButton = UIButton()
    
    var level = 1
    
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view        
        
        func style(tag: Int, img: UIImage, imgH: UIImage) -> UIButton { 
            
            let sty = UIButton()
            sty.tag = tag
            sty.setBackgroundImage(img, for: UIControlState.normal)
            sty.setImage(imgH, for: UIControlState.highlighted)
            sty.layer.cornerRadius = 50
            sty.setTitle("", for: [])
            sty.addTarget(self, action: #selector(buttonPressed(sender:)) , for: .touchUpInside);  
            sty.translatesAutoresizingMaskIntoConstraints = false
            return sty
        }
        func setupAudioFiles (){
            let soundFilePath = Bundle.main.path(forResource: "1", ofType: "wav")!
            let soundFileURL = URL(fileURLWithPath: soundFilePath)
            let soundFilePath2 = Bundle.main.path(forResource: "2", ofType: "wav")!
            let soundFileURL2 = URL(fileURLWithPath: soundFilePath2)
            let soundFilePath3 = Bundle.main.path(forResource: "3", ofType: "wav")!
            let soundFileURL3 = URL(fileURLWithPath: soundFilePath3)
            let soundFilePath4 = Bundle.main.path(forResource: "4", ofType: "wav")!
            let soundFileURL4 = URL(fileURLWithPath: soundFilePath4)
            
            
            do {
                try sound1Player = AVAudioPlayer(contentsOf: soundFileURL)
                try sound2Player = AVAudioPlayer(contentsOf: soundFileURL2)
                try sound3Player = AVAudioPlayer(contentsOf: soundFileURL3)
                try sound4Player = AVAudioPlayer(contentsOf: soundFileURL4)
            }catch{
                print(error)
            }
            sound1Player.delegate = self
            sound1Player.numberOfLoops = 0
            sound2Player.delegate = self
            sound2Player.numberOfLoops = 0
            sound3Player.delegate = self
            sound3Player.numberOfLoops = 0
            sound4Player.delegate = self
            sound4Player.numberOfLoops = 0
            
        }
        
        
        redButton = style(tag: 1, img: #imageLiteral(resourceName: "IMG_0040.PNG"), imgH: #imageLiteral(resourceName: "IMG_0041.PNG"))
        self.view.addSubview(redButton)
        greenButton = style(tag: 3, img: #imageLiteral(resourceName: "IMG_0038.PNG"), imgH: #imageLiteral(resourceName: "IMG_0039.PNG"))
        self.view.addSubview(greenButton)
        blueButton = style(tag: 4, img: #imageLiteral(resourceName: "IMG_0035.PNG"), imgH: #imageLiteral(resourceName: "IMG_0037.PNG"))
        self.view.addSubview(blueButton)
        yellowButton = style(tag: 2, img: #imageLiteral(resourceName: "IMG_0042.PNG"), imgH: #imageLiteral(resourceName: "IMG_0043.PNG"))
        self.view.addSubview(yellowButton)
        startGameButton.setBackgroundImage(#imageLiteral(resourceName: "IMG_0044.PNG"), for: UIControlState.normal)
        startGameButton.setTitle("", for: [])
        startGameButton.tag = 10
        startGameButton.layer.cornerRadius = 50
        startGameButton.addTarget(self, action: #selector(startGame(sender:)), for: .touchUpInside)
        startGameButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(startGameButton)
        levelLabel.textColor = .black
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(levelLabel)
        
        NSLayoutConstraint.activate([
            redButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 175),
            redButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            redButton.widthAnchor.constraint(equalToConstant: 100),
            redButton.heightAnchor.constraint(equalToConstant: 100),
            
            yellowButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 175),
            yellowButton.leadingAnchor.constraint(equalTo: redButton.trailingAnchor, constant: 20),
            yellowButton.widthAnchor.constraint(equalToConstant: 100),
            yellowButton.heightAnchor.constraint(equalToConstant: 100),
            
            greenButton.topAnchor.constraint(equalTo: redButton.bottomAnchor, constant: 20),
            greenButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            greenButton.widthAnchor.constraint(equalToConstant: 100),
            greenButton.heightAnchor.constraint(equalToConstant: 100),
            
            blueButton.topAnchor.constraint(equalTo: yellowButton.bottomAnchor, constant: 20),
            blueButton.leadingAnchor.constraint(equalTo: greenButton.trailingAnchor, constant: 20),
            blueButton.widthAnchor.constraint(equalToConstant: 100),
            blueButton.heightAnchor.constraint(equalToConstant: 100),
            
            startGameButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            startGameButton.widthAnchor.constraint(equalToConstant: 100),
            startGameButton.heightAnchor.constraint(equalToConstant: 100),
            
            levelLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            levelLabel.leadingAnchor.constraint(equalTo: startGameButton.trailingAnchor, constant: 20),
            levelLabel.widthAnchor.constraint(equalToConstant: 100),
            levelLabel.heightAnchor.constraint(equalToConstant: 30),
            
            ])
        setupAudioFiles()
    }
    @IBAction func buttonPressed(sender: UIButton){
        if readyForUser {
            switch sender.tag {
            case 1:
                sound1Player.play()
                checkIfCorrect(buttonPressed: 1)
                break
            case 2:
                sound2Player.play() 
                checkIfCorrect(buttonPressed: 2)
                break
            case 3:
                sound3Player.play() 
                checkIfCorrect(buttonPressed: 3)
                break
            case 4:
                sound4Player.play() 
                checkIfCorrect(buttonPressed: 4)
                break
            default:
                break 
            }
        }
        
    }
    
    func checkIfCorrect (buttonPressed: Int){
        if buttonPressed == playlist[numberOfTaps]{
            if numberOfTaps == playlist.count - 1{
                let xSeconds = 2.0
                DispatchQueue.main.asyncAfter(deadline: .now() + xSeconds){
                    self.nextRound()
                }
                return
                
            }
            numberOfTaps += 1
        }else{
            //Game Over
            resetGame()

        }
    }
    
    func resetGame(){
        level = 1
        readyForUser = false
        numberOfTaps = 0
        currentItem = 0
        playlist = []
        levelLabel.text = "Game Over"
        startGameButton.isHidden = false
        disableButtons()
    }
    
    func nextRound(){
        level += 1
        levelLabel.text = "Level " + String(level)
        readyForUser = false
        numberOfTaps = 0
        currentItem = 0
        disableButtons()
        let randomNumber = Int(arc4random_uniform(4) + 1)
        playlist.append(randomNumber)
        playNextItem()
    }
    
    @IBAction func startGame(sender: UIButton){
        levelLabel.text = "Level 1"
        disableButtons()
        let randomNumber = Int(arc4random_uniform(4) + 1)
        playlist.append(randomNumber)
        startGameButton.isHidden = true
        playNextItem()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if (currentItem <= playlist.count-1) {
            playNextItem()
        }else{
            readyForUser = true
            resetHighlights()
            enableButtons()
        }
    }
    func playNextItem (){
        let selectedItem = playlist[currentItem]
        
        switch selectedItem {
        case 1:
            highlightButtonWithTag(tag: 1)
            sound1Player.play()
            break
        case 2:
            highlightButtonWithTag(tag: 2)
            sound2Player.play()
            break
        case 3:
            highlightButtonWithTag(tag: 3)
            sound3Player.play()
            break
        case 4:
            highlightButtonWithTag(tag: 4)
            sound4Player.play()
            break
        default:
            break 
        }
        currentItem += 1
    
    }
    
    func highlightButtonWithTag (tag:Int){
    switch tag {
    case 1:
        resetHighlights()
        redButton.setImage(#imageLiteral(resourceName: "IMG_0041.PNG"), for: UIControlState.normal)
    case 2:
        resetHighlights()
        yellowButton.setImage(#imageLiteral(resourceName: "IMG_0043.PNG"), for: UIControlState.normal)
    case 3:
        resetHighlights()
        greenButton.setImage(#imageLiteral(resourceName: "IMG_0039.PNG"), for: UIControlState.normal)
    case 4:
        resetHighlights()
        blueButton.setImage(#imageLiteral(resourceName: "IMG_0037.PNG"), for: UIControlState.normal)
    default:
        break 
    }
    }
    func resetHighlights(){
        redButton.setImage(#imageLiteral(resourceName: "IMG_0040.PNG"), for: UIControlState.normal)
        yellowButton.setImage(#imageLiteral(resourceName: "IMG_0042.PNG"), for: UIControlState.normal)
        greenButton.setImage(#imageLiteral(resourceName: "IMG_0038.PNG"), for: UIControlState.normal)
        blueButton.setImage(#imageLiteral(resourceName: "IMG_0035.PNG"), for: UIControlState.normal)
    }
    func disableButtons (){
        redButton.isUserInteractionEnabled = false
        yellowButton.isUserInteractionEnabled = false
        greenButton.isUserInteractionEnabled = false
        blueButton.isUserInteractionEnabled = false
    }
    func enableButtons (){
        redButton.isUserInteractionEnabled = true
        yellowButton.isUserInteractionEnabled = true
        greenButton.isUserInteractionEnabled = true
        blueButton.isUserInteractionEnabled = true
    }
    
}
PlaygroundPage.current.liveView = mainView()
