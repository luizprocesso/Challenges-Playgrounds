import UIKit
import PlaygroundSupport

// Segunda classe
class SecondViewController: UIViewController {
    
    public var labelText: String?
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        let label = UILabel()
        label.text = labelText
        label.textColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Layout
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
    }
}

// Classe principal
class FirstViewController : UIViewController {
    
    override func loadView() {
        super.loadView()
        // UI
        self.view.backgroundColor = .white
        
        let button1 = UIButton(type: .system)
        button1.setTitle("JANUARY", for: .normal)
        button1.tintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button1.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        button1.tag = 1
        
        view.addSubview(button1)
        
        let button2 = UIButton(type: .system)
        button2.setTitle("FEBRUARY", for: .normal)
        button2.tintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button2.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        button2.tag = 2
        
        view.addSubview(button2)
        
        let button3 = UIButton(type: .system)
        button3.setTitle("MARCH", for: .normal)
        button3.tintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button3.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        button3.tag = 3
        
        view.addSubview(button3)
        
        let button4 = UIButton(type: .system)
        button4.setTitle("OTHER", for: .normal)
        button4.tintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button4.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        
        view.addSubview(button4)
        
        // Layout
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        button4.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 10),
            
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 10),
            
            button4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button4.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 10)
            
            ])
        
    }
    
    @objc func openWithNavigation(sender: UIButton) {
        let newVC = SecondViewController()
        
        switch sender.tag {
        case 1:
            newVC.labelText = "THIS IS THE FIRST MONTH"
            break
        case 2:
            newVC.labelText = "THIS IS THE SECOND MONTH"
            break
        case 3:
            newVC.labelText = "THIS IS THE THIRD MONTH"
            break
        default:
            newVC.labelText = "NO MONTH SELECTED"
        }
        
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
}

let firstViewController = FirstViewController()

PlaygroundPage.current.liveView = UINavigationController(rootViewController: firstViewController)

