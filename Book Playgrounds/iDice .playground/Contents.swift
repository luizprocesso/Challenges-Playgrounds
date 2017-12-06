import UIKit
import PlaygroundSupport

// codigo do Luiz
// Luiz, Peter, Stefan

class ButtonViewController : UIViewController {
    
    var dice : UILabel!
    var dice4 : UILabel!
    var dice8 : UILabel!
    var dice10 : UILabel!
    var dice12 : UILabel!
    var dice20 : UILabel!
    
    var D6 = UIButton()
    var D4 = UIButton()
    var D8 = UIButton()
    var D10 = UIButton()
    var D12 = UIButton()
    var D20 = UIButton()
    
    var titulo = UILabel()
    var clear = UIButton(type: .system)
    var rollAll = UIButton(type: .system)
    
    override func viewDidLoad() {
        
        // UI
        
        let view = UIView()
        view.backgroundColor = .white
        
        titulo.text = "iDice"
        titulo.font = UIFont(name: "arial", size: 50)
        titulo.textAlignment = NSTextAlignment.center
        
        
        
        clear.setTitle("Clear", for: UIControlState())
        clear.backgroundColor = .black
        clear.tintColor = .white
        clear.layer.cornerRadius = 25
        clear.titleLabel!.font = UIFont (name: "arial", size: 40)
        clear.addTarget(self, action: #selector(viewDidLoad), for: .touchUpInside)
        
        rollAll.setTitle("Roll All", for: UIControlState())
        rollAll.backgroundColor = .black
        rollAll.tintColor = .white
        rollAll.layer.cornerRadius = 25
        rollAll.titleLabel!.font = UIFont (name: "arial", size: 40)
        rollAll.addTarget(self, action: #selector(dicePressedAll), for: .touchUpInside)
        
        
        
        dice = UILabel()
        dice.textAlignment = NSTextAlignment.center
        dice.font = UIFont(name: "Arial", size: 40)
        D6.setImage(#imageLiteral(resourceName: "IMG_0005.JPG"), for: UIControlState())
        D6.addTarget(self, action: #selector(dicePressed), for: .touchUpInside)
        
        dice4 = UILabel()
        dice4.font = UIFont(name: "Arial", size: 40)
        dice4.textAlignment = NSTextAlignment.center
        D4.setImage(#imageLiteral(resourceName: "IMG_0004.JPG"), for: UIControlState())
        D4.addTarget(self, action: #selector(dicePressed4), for: .touchUpInside)
        
        dice8 = UILabel()
        dice8.font = UIFont(name: "Arial", size: 40)
        dice8.textAlignment = NSTextAlignment.center
        D8.setImage(#imageLiteral(resourceName: "IMG_0006.JPG"), for: UIControlState())
        D8.addTarget(self, action: #selector(dicePressed8), for: .touchUpInside)
        
        dice10 = UILabel()
        dice10.font = UIFont(name: "Arial", size: 40)
        dice10.textAlignment = NSTextAlignment.center
        D10.setImage(#imageLiteral(resourceName: "IMG_0007.JPG"), for: UIControlState())
        D10.addTarget(self, action: #selector(dicePressed10), for: .touchUpInside)
        
        dice12 = UILabel()
        dice12.font = UIFont(name: "Arial", size: 40)
        dice12.textAlignment = NSTextAlignment.center
        D12.setImage(#imageLiteral(resourceName: "IMG_0008.JPG"), for: UIControlState())
        D12.addTarget(self, action: #selector(dicePressed12), for: .touchUpInside)
        
        dice20 = UILabel()
        dice20.font = UIFont(name: "Arial", size: 40)
        dice20.textAlignment = NSTextAlignment.center
        D20.setImage(#imageLiteral(resourceName: "IMG_0009.JPG"), for: UIControlState())
        D20.addTarget(self, action: #selector(dicePressed20), for: .touchUpInside)
        
        view.addSubview(dice)
        view.addSubview(dice4)
        view.addSubview(dice8)
        view.addSubview(dice10)
        view.addSubview(dice12)
        view.addSubview(dice20)
        view.addSubview(D6)
        view.addSubview(D4)
        view.addSubview(D8)
        view.addSubview(D10)
        view.addSubview(D12)
        view.addSubview(D20)
        view.addSubview(clear)
        view.addSubview(rollAll)
        view.addSubview(titulo)
        

        // Layout
        dice.translatesAutoresizingMaskIntoConstraints = false
        dice4.translatesAutoresizingMaskIntoConstraints = false
        dice8.translatesAutoresizingMaskIntoConstraints = false
        dice10.translatesAutoresizingMaskIntoConstraints = false
        dice12.translatesAutoresizingMaskIntoConstraints = false
        dice20.translatesAutoresizingMaskIntoConstraints = false
        D6.translatesAutoresizingMaskIntoConstraints = false
        D4.translatesAutoresizingMaskIntoConstraints = false
        D8.translatesAutoresizingMaskIntoConstraints = false
        D10.translatesAutoresizingMaskIntoConstraints = false
        D12.translatesAutoresizingMaskIntoConstraints = false
        D20.translatesAutoresizingMaskIntoConstraints = false
        clear.translatesAutoresizingMaskIntoConstraints = false
        rollAll.translatesAutoresizingMaskIntoConstraints = false
        titulo.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            dice.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            dice.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50),
            dice.widthAnchor.constraint(equalToConstant: 80),
            dice.heightAnchor.constraint(equalToConstant: 80),
            
            dice4.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            dice4.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50),
            dice4.widthAnchor.constraint(equalToConstant: 80),
            dice4.heightAnchor.constraint(equalToConstant: 80),
            
            dice8.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            dice8.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50),
            dice8.widthAnchor.constraint(equalToConstant: 80),
            dice8.heightAnchor.constraint(equalToConstant: 80),
            
            dice10.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            dice10.leadingAnchor.constraint(equalTo: D10.trailingAnchor, constant: 20),
            dice10.widthAnchor.constraint(equalToConstant: 80),
            dice10.heightAnchor.constraint(equalToConstant: 80),
            
            dice12.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            dice12.leadingAnchor.constraint(equalTo: D12.trailingAnchor, constant: 20),
            dice12.widthAnchor.constraint(equalToConstant: 80),
            dice12.heightAnchor.constraint(equalToConstant: 80),
            
            dice20.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            dice20.leadingAnchor.constraint(equalTo: D20.trailingAnchor, constant: 20),
            dice20.widthAnchor.constraint(equalToConstant: 80),
            dice20.heightAnchor.constraint(equalToConstant: 80),
            
            D4.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            D4.trailingAnchor.constraint(equalTo: dice4.leadingAnchor, constant: -20),
            D4.widthAnchor.constraint(equalToConstant: 80),
            D4.heightAnchor.constraint(equalToConstant: 80),
            
            D6.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            D6.trailingAnchor.constraint(equalTo: dice.leadingAnchor, constant: -20),
            D6.widthAnchor.constraint(equalToConstant: 80),
            D6.heightAnchor.constraint(equalToConstant: 80),
            
            D8.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            D8.trailingAnchor.constraint(equalTo: dice8.leadingAnchor, constant: -20),
            D8.widthAnchor.constraint(equalToConstant: 80),
            D8.heightAnchor.constraint(equalToConstant: 80),
            
            D10.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            D10.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
            D10.widthAnchor.constraint(equalToConstant: 80),
            D10.heightAnchor.constraint(equalToConstant: 80),
            
            D12.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            D12.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
            D12.widthAnchor.constraint(equalToConstant: 80),
            D12.heightAnchor.constraint(equalToConstant: 80),
            
            D20.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            D20.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
            D20.widthAnchor.constraint(equalToConstant: 80),
            D20.heightAnchor.constraint(equalToConstant: 80),
            
            clear.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            clear.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            clear.widthAnchor.constraint(equalToConstant: 160),
            clear.heightAnchor.constraint(equalToConstant: 80),
            
            rollAll.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            rollAll.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            rollAll.widthAnchor.constraint(equalToConstant: 160),
            rollAll.heightAnchor.constraint(equalToConstant: 80),
            
            titulo.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            titulo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titulo.widthAnchor.constraint(equalToConstant: 160),
            titulo.heightAnchor.constraint(equalToConstant: 80),
            
            
            
            
            ])
        
        self.view = view
    }
    
    @IBAction func dicePressed() {
        let RdmD6 = Int(arc4random_uniform(6)+1)
        dice.text = String(RdmD6)
    }
    @IBAction func dicePressed4() {
        let RdmD4 = Int(arc4random_uniform(4)+1)
        dice4.text = String(RdmD4)
    }
    @IBAction func dicePressed8() {
        let RdmD8 = Int(arc4random_uniform(8)+1)
        dice8.text = String(RdmD8)
    }
    @IBAction func dicePressed10() {
        let RdmD10 = Int(arc4random_uniform(10)+1)
        dice10.text = String(RdmD10)
    }
        
    @IBAction func dicePressed12() {
        let RdmD12 = Int(arc4random_uniform(12)+1)
        dice12.text = String(RdmD12)
    }
    @IBAction func dicePressed20() {
        let RdmD20 = Int(arc4random_uniform(20)+1)
        dice20.text = String(RdmD20)
    }
    
    @IBAction func dicePressedAll() {
        let RdmD4 = Int(arc4random_uniform(4)+1)
        let RdmD8 = Int(arc4random_uniform(8)+1)
        let RdmD6 = Int(arc4random_uniform(6)+1)
        let RdmD10 = Int(arc4random_uniform(10)+1)
        let RdmD12 = Int(arc4random_uniform(12)+1)
        let RdmD20 = Int(arc4random_uniform(20)+1)
        
        dice4.text = String(RdmD4)
        dice.text = String(RdmD6)
        dice8.text = String(RdmD8)
        dice10.text = String(RdmD10)
        dice12.text = String(RdmD12)
        dice20.text = String(RdmD20)
    }
        
        
        
    }

PlaygroundPage.current.liveView = ButtonViewController()

