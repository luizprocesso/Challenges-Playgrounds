import UIKit
import PlaygroundSupport

// Classe da janela Modal
class ModalViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        let label = UILabel()
        label.text = "HELLO!"
        label.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        view.addSubview(label)
        
        let button = UIButton(type: .system)
        button.setTitle("CLICK HERE TO CLOSE THIS VIEW", for: .normal)
        button.tintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        view.addSubview(button)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Layout
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 15)
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
        button.setTitle("OPEN WITH MODAL", for: .normal)
        button.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
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
        self.present(newVC, animated: true)
    }
    
}

let firstViewController = FirstViewController()

PlaygroundPage.current.liveView = firstViewController
