import UIKit
import PlaygroundSupport

var plusButton = UIButton()
var minusButton = UIButton()
var equalButton = UIButton()
var divisionButton = UIButton()
var multiButton = UIButton()
var label = UILabel()
var zeroButton = UIButton()
var oneButton = UIButton()
var twoButton = UIButton()
var treeButton = UIButton()
var fourButton = UIButton()
var fiveButton = UIButton()
var sixButton = UIButton()
var sevenButton = UIButton()
var eightButton = UIButton()
var nineButton = UIButton()

class ViewController:
UIViewController{
    
    
    override func loadView(){
        
        let View = UIView()
        View.backgroundColor = .gray
        View.layer.borderColor = UIColor.black.cgColor
        View.layer.borderWidth = 10
        View.layer.shadowColor = UIColor.blue.cgColor
        
        
        label.backgroundColor = .white
        label.text = "123#@456$&*789009*#"
        
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 2
        View.addSubview(label)
        
        plusButton = UIButton (type: .system)
        plusButton.setTitle("+", for: .normal)
        plusButton.tintColor = .black
        plusButton.layer.borderColor = UIColor.black.cgColor
        plusButton.layer.borderWidth = 2
        plusButton.backgroundColor = .orange
        plusButton.titleLabel!.font = UIFont(name: "arial", size: 40)
        View.addSubview(plusButton)
        
        minusButton = UIButton(type: .system)
        minusButton.setTitle("-" , for: .normal)
        minusButton.tintColor = .black
        minusButton.layer.borderColor = UIColor.black.cgColor
        minusButton.layer.borderWidth = 2
        minusButton.backgroundColor = .orange
        minusButton.titleLabel!.font = UIFont(name: "arial", size: 40)
        View.addSubview(minusButton)
        
        equalButton = UIButton (type: .system)
        equalButton.setTitle("=", for: .normal)
        equalButton.tintColor = .black
        equalButton.layer.borderColor = UIColor.black.cgColor
        equalButton.layer.borderWidth = 2
        equalButton.backgroundColor = .orange
        equalButton.titleLabel!.font = UIFont(name: "arial", size: 40)
        View.addSubview(equalButton)
        
        multiButton = UIButton (type: .system)
        multiButton.setTitle("*", for: .normal)
        multiButton.tintColor = .black
        multiButton.layer.borderColor = UIColor.black.cgColor
        multiButton.layer.borderWidth = 2
        multiButton.backgroundColor = .orange
        multiButton.titleLabel!.font = UIFont(name: "arial", size: 40)
        View.addSubview(multiButton)
        
        divisionButton = UIButton (type: .system)
        divisionButton.setTitle("/", for: .normal)
        divisionButton.tintColor = .black
        divisionButton.layer.borderColor = UIColor.black.cgColor
        divisionButton.layer.borderWidth = 2
        divisionButton.backgroundColor = .orange
        divisionButton.titleLabel!.font = UIFont(name: "arial", size: 40)
        View.addSubview(divisionButton)
        
        
        zeroButton = UIButton (type: .system)
        zeroButton.setTitle("0", for: .normal)
        zeroButton.tintColor = .white
        zeroButton.layer.borderColor = UIColor.black.cgColor
        zeroButton.layer.borderWidth = 2
        zeroButton.layer.cornerRadius = 35
        zeroButton.backgroundColor = .blue
        zeroButton.titleLabel!.font = UIFont(name: "arial", size: 40)
        View.addSubview(zeroButton)
        
        oneButton = UIButton (type: .system)
        oneButton.setTitle("1", for: .normal)
        oneButton.tintColor = .white
        oneButton.layer.borderColor = UIColor.black.cgColor
        oneButton.layer.borderWidth = 2
        oneButton.layer.cornerRadius = 35
        oneButton.backgroundColor = .blue
        oneButton.titleLabel!.font = UIFont(name: "arial", size: 40)
        View.addSubview(oneButton)
        
        twoButton = UIButton (type: .system)
        twoButton.setTitle("2", for: .normal)
        twoButton.tintColor = .white
        twoButton.layer.borderColor = UIColor.black.cgColor
        twoButton.layer.borderWidth = 2
        twoButton.layer.cornerRadius = 35
        twoButton.backgroundColor = .blue
        twoButton.titleLabel!.font = UIFont(name: "arial", size: 40)
        View.addSubview(twoButton)
        
        treeButton = UIButton (type: .system)
        treeButton.setTitle("3", for: .normal)
        treeButton.tintColor = .white
        treeButton.layer.borderColor = UIColor.black.cgColor
        treeButton.layer.borderWidth = 2
        treeButton.layer.cornerRadius = 35
        treeButton.backgroundColor = .blue
        treeButton.titleLabel!.font = UIFont(name: "arial", size: 40)
        View.addSubview(treeButton)
        
        fourButton = UIButton (type: .system)
        fourButton.setTitle("4", for: .normal)
        fourButton.tintColor = .white
        fourButton.layer.borderColor = UIColor.black.cgColor
        fourButton.layer.borderWidth = 2
        fourButton.layer.cornerRadius = 35
        fourButton.backgroundColor = .blue
        fourButton.titleLabel!.font = UIFont(name: "arial", size: 40)
        View.addSubview(fourButton)
        
        
        
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        equalButton.translatesAutoresizingMaskIntoConstraints = false
        multiButton.translatesAutoresizingMaskIntoConstraints = false
        divisionButton.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        zeroButton.translatesAutoresizingMaskIntoConstraints = false
        oneButton.translatesAutoresizingMaskIntoConstraints = false
        twoButton.translatesAutoresizingMaskIntoConstraints = false
        treeButton.translatesAutoresizingMaskIntoConstraints = false
        fourButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        NSLayoutConstraint.activate([   
            plusButton.topAnchor.constraint(equalTo: View.topAnchor, constant: 360),
            plusButton.leadingAnchor.constraint(equalTo: View.leadingAnchor, constant:320),
            plusButton.heightAnchor.constraint(equalToConstant: 70),
            plusButton.widthAnchor.constraint(equalToConstant: 70),
            
            minusButton.topAnchor.constraint(equalTo: View.topAnchor, constant: 440),
            minusButton.leadingAnchor.constraint(equalTo: View.leadingAnchor, constant:320),
            minusButton.heightAnchor.constraint(equalToConstant: 70),
            minusButton.widthAnchor.constraint(equalToConstant: 70),
            
            equalButton.topAnchor.constraint(equalTo: View.topAnchor, constant: 520),
            equalButton.leadingAnchor.constraint(equalTo: View.leadingAnchor, constant:320),
            equalButton.heightAnchor.constraint(equalToConstant: 70),
            equalButton.widthAnchor.constraint(equalToConstant: 70),
            
            multiButton.topAnchor.constraint(equalTo: View.topAnchor, constant: 280),
            multiButton.leadingAnchor.constraint(equalTo: View.leadingAnchor, constant:320),
            multiButton.heightAnchor.constraint(equalToConstant: 70),
            multiButton.widthAnchor.constraint(equalToConstant: 70),
            
            divisionButton.topAnchor.constraint(equalTo: View.topAnchor, constant: 200),
            divisionButton.leadingAnchor.constraint(equalTo: View.leadingAnchor, constant:320),
            divisionButton.heightAnchor.constraint(equalToConstant: 70),
            divisionButton.widthAnchor.constraint(equalToConstant: 70),
            
            
            label.topAnchor.constraint(equalTo: View.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: View.leadingAnchor, constant:20),
            label.heightAnchor.constraint(equalToConstant: 150),
            label.widthAnchor.constraint(equalToConstant: 390),
            
            
            
            zeroButton.topAnchor.constraint(equalTo: View.topAnchor, constant: 520),
            zeroButton.leadingAnchor.constraint(equalTo: View.leadingAnchor, constant:120),
            zeroButton.heightAnchor.constraint(equalToConstant: 70),
            zeroButton.widthAnchor.constraint(equalToConstant: 70),
            
            
            
            oneButton.topAnchor.constraint(equalTo: View.topAnchor, constant: 420),
            oneButton.leadingAnchor.constraint(equalTo: View.leadingAnchor, constant:20),
            oneButton.heightAnchor.constraint(equalToConstant: 70),
            oneButton.widthAnchor.constraint(equalToConstant: 70),
            
            
            
            twoButton.topAnchor.constraint(equalTo: View.topAnchor, constant: 420),
            twoButton.leadingAnchor.constraint(equalTo: View.leadingAnchor, constant:120),
            twoButton.heightAnchor.constraint(equalToConstant: 70),
            twoButton.widthAnchor.constraint(equalToConstant: 70),
            
            
            
            
            treeButton.topAnchor.constraint(equalTo: View.topAnchor, constant: 420),
            treeButton.leadingAnchor.constraint(equalTo: View.leadingAnchor, constant:220),
            treeButton.heightAnchor.constraint(equalToConstant: 70),
            treeButton.widthAnchor.constraint(equalToConstant: 70),
            
            
            
            fourButton.topAnchor.constraint(equalTo: View.topAnchor, constant: 320),
            fourButton.leadingAnchor.constraint(equalTo: View.leadingAnchor, constant:20),
            fourButton.heightAnchor.constraint(equalToConstant: 70),
            fourButton.widthAnchor.constraint(equalToConstant: 70),
            
            
            
            
            ])
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        self.view = View
        
    }
    
    
}
PlaygroundPage.current.liveView = ViewController()
