import UIKit
import PlaygroundSupport
import Foundation

class mainView: UIViewController{
    
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation = 0
    var display = UILabel()
    var canDot = true
    var canOpr = true
            
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .darkGray
        self.view = view
        
        display.translatesAutoresizingMaskIntoConstraints = false
        display.backgroundColor = .white
        display.text = ""
        display.layer.masksToBounds = true
        display.layer.cornerRadius = 10
        display.layer.borderWidth = 1
        display.textAlignment = NSTextAlignment.right     
        display.font = UIFont(name: "Arial", size:40)
        self.view.addSubview(display)
        
        func Number(tag: Int) -> UIButton { 
            
            let NUM = UIButton()
            NUM.tag = tag
            NUM.backgroundColor = UIColor.black
            NUM.layer.cornerRadius = 35
            let Str = String(NUM.tag-1)
            NUM.setTitle(Str, for: [])
            NUM.setTitleColor(UIColor.clear, for: UIControlState.highlighted)
            NUM.titleLabel!.font = UIFont(name: "Arial", size: 40)
            NUM.addTarget(self, action: #selector(numbers(_:)), for: .touchUpInside);  
            NUM.translatesAutoresizingMaskIntoConstraints = false
            return NUM
        }
        
        func Sci(tag: Int, title: String) -> UIButton { 
            
            let sOpr = UIButton()
            sOpr.tag = tag
            sOpr.backgroundColor = UIColor.gray
            sOpr.layer.cornerRadius = 20
            sOpr.setTitle(title, for: [])
            sOpr.setTitleColor(UIColor.clear, for: UIControlState.highlighted)
            sOpr.titleLabel!.font = UIFont(name: "Arial", size: 30)
            sOpr.addTarget(self, action: #selector(buttons(_:)), for: .touchUpInside);  
            sOpr.translatesAutoresizingMaskIntoConstraints = false
            return sOpr
        }
        
        func Operands(tag: Int, title: String) -> UIButton { 
            
            let opr = UIButton()
            opr.tag = tag
            opr.backgroundColor = UIColor.orange
            opr.layer.cornerRadius = 10
            opr.setTitle(title, for: [])
            opr.setTitleColor(UIColor.clear, for: UIControlState.highlighted)
            opr.titleLabel!.font = UIFont(name: "Arial", size: 40)
            opr.addTarget(self, action: #selector(buttons(_:)), for: .touchUpInside);  
            opr.translatesAutoresizingMaskIntoConstraints = false
            return opr
        }
        
        let sevenButton = Number(tag: 8)
        self.view.addSubview(sevenButton)
        let eightButton = Number(tag: 9)
        self.view.addSubview(eightButton)
        let nineButton = Number(tag: 10)
        self.view.addSubview(nineButton)
        let fourButton = Number(tag: 5)
        self.view.addSubview(fourButton)
        let fiveButton = Number(tag: 6)
        self.view.addSubview(fiveButton)
        let sixButton = Number(tag: 7)
        self.view.addSubview(sixButton)
        let oneButton = Number(tag: 2)
        self.view.addSubview(oneButton)
        let twoButton = Number(tag: 3)
        self.view.addSubview(twoButton)
        let threeButton = Number(tag: 4)
        self.view.addSubview(threeButton)
        let zeroButton = Number(tag: 1)
        self.view.addSubview(zeroButton)
        
        let minusButton = Operands(tag: 11, title: "-")
        self.view.addSubview(minusButton)
        let plusButton = Operands(tag: 12, title: "+")
        self.view.addSubview(plusButton)
        let divideButton = Operands(tag: 13, title: "÷")
        self.view.addSubview(divideButton)
        let multiButton = Operands(tag: 14, title: "x")
        self.view.addSubview(multiButton)
        let equalButton = Operands(tag: 15, title: "=")
        self.view.addSubview(equalButton)
        let cButton = Operands(tag: 16, title: "C")
        self.view.addSubview(cButton)
        let percentButton = Operands(tag: 17, title: "%")
        self.view.addSubview(percentButton)
        let commaButton = Operands(tag: 18, title: ".")
        self.view.addSubview(commaButton)
        let plusminusButton = Operands(tag: 19, title: "±")
        self.view.addSubview(plusminusButton)
        let piButton = Sci(tag: 20, title: "π")
        self.view.addSubview(piButton)
        let sqrButton = Sci(tag: 21, title: "√")
        self.view.addSubview(sqrButton)
        let eulerButton = Sci(tag: 22, title: "e")
        self.view.addSubview(eulerButton)
        let powButton = Sci(tag: 23, title: "ˆ")
        self.view.addSubview(powButton)
        let fatButton = Sci(tag: 24, title: "!")
        self.view.addSubview(fatButton)
        let hexButton = Sci(tag: 25, title: "Hex")
        self.view.addSubview(hexButton)
        let binButton = Sci(tag: 26, title: "Bin")
        self.view.addSubview(binButton)
                        
        
        NSLayoutConstraint.activate([
            
            
            display.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            display.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -20),
            display.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.94),
            display.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            multiButton.topAnchor.constraint(equalTo: display.bottomAnchor, constant: 20),
            multiButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            multiButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            multiButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            minusButton.topAnchor.constraint(equalTo: multiButton.bottomAnchor, constant: 20),
            minusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            minusButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            minusButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            plusButton.topAnchor.constraint(equalTo: minusButton.bottomAnchor, constant: 20),
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            plusButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            plusButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            equalButton.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: 20),
            equalButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            equalButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            equalButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.297),
            
            divideButton.topAnchor.constraint(equalTo: display.bottomAnchor, constant: 20),
            divideButton.trailingAnchor.constraint(equalTo: multiButton.leadingAnchor, constant: -22),
            divideButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            divideButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            nineButton.topAnchor.constraint(equalTo: divideButton.bottomAnchor, constant: 20),
            nineButton.trailingAnchor.constraint(equalTo: minusButton.leadingAnchor, constant: -22),
            nineButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            nineButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            sixButton.topAnchor.constraint(equalTo: nineButton.bottomAnchor, constant: 20),
            sixButton.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -22),
            sixButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            sixButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            threeButton.topAnchor.constraint(equalTo: sixButton.bottomAnchor, constant: 20),
            threeButton.trailingAnchor.constraint(equalTo: equalButton.leadingAnchor, constant: -22),
            threeButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            threeButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            commaButton.topAnchor.constraint(equalTo: threeButton.bottomAnchor, constant: 20),
            commaButton.trailingAnchor.constraint(equalTo: equalButton.leadingAnchor, constant: -22),
            commaButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            commaButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            percentButton.topAnchor.constraint(equalTo: display.bottomAnchor, constant: 20),
            percentButton.trailingAnchor.constraint(equalTo: divideButton.leadingAnchor, constant: -22),
            percentButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            percentButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            eightButton.topAnchor.constraint(equalTo: percentButton.bottomAnchor, constant: 20),
            eightButton.trailingAnchor.constraint(equalTo: nineButton.leadingAnchor, constant: -22),
            eightButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            eightButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            fiveButton.topAnchor.constraint(equalTo: eightButton.bottomAnchor, constant: 20),
            fiveButton.trailingAnchor.constraint(equalTo: sixButton.leadingAnchor , constant: -22),
            fiveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            fiveButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            twoButton.topAnchor.constraint(equalTo: fiveButton.bottomAnchor, constant: 20),
            twoButton.trailingAnchor.constraint(equalTo: threeButton.leadingAnchor, constant: -22),
            twoButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            twoButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            plusminusButton.topAnchor.constraint(equalTo: twoButton.bottomAnchor, constant: 20),
            plusminusButton.trailingAnchor.constraint(equalTo: commaButton.leadingAnchor, constant: -22),
            plusminusButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            plusminusButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            cButton.topAnchor.constraint(equalTo: display.bottomAnchor, constant: 20),
            cButton.trailingAnchor.constraint(equalTo: percentButton.leadingAnchor, constant: -22),
            cButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            cButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            sevenButton.topAnchor.constraint(equalTo: cButton.bottomAnchor, constant: 20),
            sevenButton.trailingAnchor.constraint(equalTo: eightButton.leadingAnchor, constant: -22),
            sevenButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            sevenButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
                        
            fourButton.topAnchor.constraint(equalTo: sevenButton.bottomAnchor, constant: 20),
            fourButton.trailingAnchor.constraint(equalTo: fiveButton.leadingAnchor, constant: -22),
            fourButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            fourButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            oneButton.topAnchor.constraint(equalTo: fourButton.bottomAnchor, constant: 20),
            oneButton.trailingAnchor.constraint(equalTo: twoButton.leadingAnchor, constant: -22),
            oneButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            oneButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            zeroButton.topAnchor.constraint(equalTo: oneButton.bottomAnchor, constant: 20),
            zeroButton.trailingAnchor.constraint(equalTo: plusminusButton.leadingAnchor, constant: -22),
            zeroButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.17),
            zeroButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            
            sqrButton.topAnchor.constraint(equalTo: display.bottomAnchor, constant: 20),
            sqrButton.trailingAnchor.constraint(equalTo: cButton.leadingAnchor, constant: -55),
            sqrButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            sqrButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.097),
            
            powButton.topAnchor.constraint(equalTo: sqrButton.bottomAnchor, constant: 10),
            powButton.trailingAnchor.constraint(equalTo: sevenButton.leadingAnchor, constant: -55),
            powButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            powButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.097),
            
            piButton.topAnchor.constraint(equalTo: powButton.bottomAnchor, constant: 10),
            piButton.trailingAnchor.constraint(equalTo: fourButton.leadingAnchor, constant: -55),
            piButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            piButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.097),
            
            eulerButton.topAnchor.constraint(equalTo: piButton.bottomAnchor, constant: 10),
            eulerButton.trailingAnchor.constraint(equalTo: oneButton.leadingAnchor, constant: -55),
            eulerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            eulerButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.097),
            
            fatButton.topAnchor.constraint(equalTo: eulerButton.bottomAnchor, constant: 10),
            fatButton.trailingAnchor.constraint(equalTo: zeroButton.leadingAnchor, constant: -55),
            fatButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            fatButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.097),
            
            hexButton.topAnchor.constraint(equalTo: fatButton.bottomAnchor, constant: 10),
            hexButton.trailingAnchor.constraint(equalTo: zeroButton.leadingAnchor, constant: -55),
            hexButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            hexButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.097),
            
            binButton.topAnchor.constraint(equalTo: hexButton.bottomAnchor, constant: 10),
            binButton.trailingAnchor.constraint(equalTo: zeroButton.leadingAnchor, constant: -55),
            binButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            binButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.097)
            
            ])
    
        
        
        
    }
    
    @IBAction func numbers(_ sender: UIButton){
        if performingMath == true {
            display.text = String(sender.tag-1)
            numberOnScreen = Double(display.text!)!
            performingMath = false
        }
        else {
        display.text = display.text! + String(sender.tag-1)
        numberOnScreen = Double(display.text!)!  
        }
        
    }
    
    @IBAction func buttons(_ sender: UIButton){
        if display.text != "" && sender.tag != 16 && sender.tag != 15 && sender.tag != 19 &&
            sender.tag != 18 && sender.tag != 20 && sender.tag != 21 && sender.tag != 22 && sender.tag != 24 && sender.tag != 25 && sender.tag != 26
        {
            if canOpr == true
            {
            previousNumber = Double(display.text!)!
            }
            if sender.tag == 11 //minus
            {
                display.text = "-"
                canOpr = false
            }
            else if sender.tag == 12 //plus
            {
                display.text = "+"
                canOpr = false
            }
            else if sender.tag == 13 //divide
            {
                display.text = "÷"
                canOpr = false
            }
            else if sender.tag == 14 //multiply
            {
                display.text = "X"
                canOpr = false
            }
            else if sender.tag == 17 //percent
            {
                display.text = "%"
                canOpr = false
            }
            else if sender.tag == 23 //power
            {
                display.text = "ˆ"
                canOpr = false
            }
            operation = sender.tag
            canDot = true
            performingMath = true;
        }
        else if sender.tag == 15 //equal
        {
            if operation == 11 //minus
            {
                display.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 12 //plus
            {
                display.text = String(previousNumber + numberOnScreen)
            }
            else if operation == 13 //divide
            {
                display.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 14 //multiply
            {
                display.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 17 //percent
            {
                display.text = String(previousNumber / 100 * numberOnScreen)
            }
            else if operation == 23 //power
            {
                display.text = String(pow(previousNumber, numberOnScreen))
            }
            canOpr = true
        }
        else if sender.tag == 16 // cButton
        {
            display.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
            canDot = true
            canOpr = true
        }
        else if sender.tag == 19 // plusminusButton
        {
            display.text = String(numberOnScreen * -1)
            numberOnScreen = Double(display.text!)!
        }
        else if sender.tag == 18 // commaButton
        {
            if (canDot == true && display.text != "")
                {
                    display.text = display.text! + String(".")
                    numberOnScreen = Double(display.text!)!
                    canDot = false
            }      
            if (canDot == true && display.text == "")
            {
                display.text = "0"
                display.text = display.text! + String(".")
                numberOnScreen = Double(display.text!)!
                canDot = false
            }
        }
        else if sender.tag == 20 //pi
        {
            display.text = "3.1415926535897932"
            numberOnScreen = Double(display.text!)!
        }
        else if sender.tag == 21 //sqrr
        {
            display.text = String(sqrt(numberOnScreen))
            canDot = false
        }
        else if sender.tag == 22 //e
        {
            display.text = "2.7182818284590452"
            numberOnScreen = Double(display.text!)!
        }
        else if sender.tag == 24 //fat
        {
            func factorial( n: Double) -> Double{  
                if (n == floor(n)){  
                    if n == 0 || n == 1  {
                    return 1
                    }
                    else {  
                        return n * factorial(n: n - 1)
                    }
                }
                else{  
                    return n
                }
            }
            display.text = String(factorial(n: numberOnScreen))
            numberOnScreen = Double(display.text!)!
            canDot = false
        }
        else if sender.tag == 25 //Hex
        {
            display.text = String(Int(numberOnScreen), radix: 16)
            canOpr = false
            canDot = false
        }
        else if sender.tag == 26 //Bin
        {
            display.text = String(Int(numberOnScreen), radix: 2)
            canOpr = false
            canDot = false
        }
    }
    
}

PlaygroundPage.current.liveView = mainView()
