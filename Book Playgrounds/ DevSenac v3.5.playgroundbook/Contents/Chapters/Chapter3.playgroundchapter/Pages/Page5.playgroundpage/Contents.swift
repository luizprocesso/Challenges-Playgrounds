import UIKit
import PlaygroundSupport

// Classe principal
class MyViewController : UIViewController {
    
    public var bigNumber: Int = 1
    
    override func loadView() {
        super.loadView()
        // UI
        self.view.backgroundColor = .white
        
        let numberLabel = UILabel()
        numberLabel.text = "\(self.bigNumber)"
        numberLabel.font = numberLabel.font.withSize(200) // Tamanho da fonte
        
        view.addSubview(numberLabel)
        
        let button = UIButton(type: .system)
        button.setTitle("PRÓXIMO NÚMERO", for: .normal)
        button.tintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        
        view.addSubview(button)
        
        // Layout
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 15)
            ])
        
    }
    
    @objc func openWithNavigation() {
        let newVC = MyViewController()
        newVC.bigNumber = self.bigNumber + 1
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
}

let firstViewController = MyViewController()

PlaygroundPage.current.liveView = UINavigationController(rootViewController: firstViewController)

