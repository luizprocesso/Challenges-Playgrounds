import UIKit
import PlaygroundSupport

// Classe da janela Modal
class ModalViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        let newView = UIView()
        newView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        newView.layer.cornerRadius = 10
        
        let label = UILabel()
        label.text = "I'M MODAL"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        newView.addSubview(label)
        
        let button = UIButton(type: .system)
        button.setTitle("X", for: .normal)
        button.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        button.layer.cornerRadius = 15
        
        newView.addSubview(button)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(newView)
        
        NSLayoutConstraint.activate([
            newView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            newView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            newView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: -self.view.frame.height / 5),
            newView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -self.view.frame.width / 5),
            
            label.centerXAnchor.constraint(equalTo: newView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: newView.centerYAnchor),
            
            button.topAnchor.constraint(equalTo: newView.topAnchor, constant: -10),
            button.leadingAnchor.constraint(equalTo: newView.leadingAnchor, constant: -10)
            ])
    }
    
    @objc public func dismissView() {
        
        // Comando para remover a janela modal da tela
        self.dismiss(animated: true, completion:nil)
    }
}

// Segunda classe - NavigationController
class SecondViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        let label = UILabel()
        label.text = "HELLO! I WAS OPENED BY NAVIGATION."
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
        button1.setTitle("OPEN WITH NAVIGATION CONTROLLER", for: .normal)
        button1.tintColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        button1.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        
        view.addSubview(button1)
        
        let button2 = UIButton(type: .system)
        button2.setTitle("OPEN WITH MODAL", for: .normal)
        button2.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        button2.addTarget(self, action: #selector(openWithModal), for: .touchUpInside)
        
        view.addSubview(button2)
        
        // Layout
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 15)
            ])
        
    }
    
    @objc func openWithNavigation() {
        let newVC = SecondViewController()
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    @objc func openWithModal() {
        let newVC = ModalViewController()
        newVC.modalPresentationStyle = .overCurrentContext
        newVC.modalTransitionStyle = .crossDissolve
        
        self.present(newVC, animated: true)
    }
    
}

let firstViewController = FirstViewController()

PlaygroundPage.current.liveView = UINavigationController(rootViewController: firstViewController)


