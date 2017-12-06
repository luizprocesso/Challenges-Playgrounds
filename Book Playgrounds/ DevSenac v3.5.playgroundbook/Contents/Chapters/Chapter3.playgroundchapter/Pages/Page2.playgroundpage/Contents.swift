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
        label.text = "HELLO!"
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

// Classe principal
class FirstViewController : UIViewController {
    
    override func loadView() {
        super.loadView()
        // UI
        self.view.backgroundColor = .white
        
        let button = UIButton(type: .system)
        button.setTitle("OPEN MODAL WINDOW", for: .normal)
        button.tintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        button.addTarget(self, action: #selector(openWithModal), for: .touchUpInside)
        
        view.addSubview(button)
        
        // Layout
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
    }
    
    @objc func openWithModal() {
        let newVC = ModalViewController()
        newVC.modalPresentationStyle = .overCurrentContext
        newVC.modalTransitionStyle = .crossDissolve
        self.present(newVC, animated: true)
    }
    
}

let firstViewController = FirstViewController()

PlaygroundPage.current.liveView = firstViewController
