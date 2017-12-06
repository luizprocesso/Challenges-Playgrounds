import MapKit
import PlaygroundSupport

import UIKit

class AlertViewController: UIViewController {
    var firstButton : UIButton!
    var secondButton : UIButton!
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        
        firstButton = UIButton(type: .system)
        firstButton.setTitle("Show First Alert", for: .normal)
        firstButton.addTarget(self, action: #selector(showFirstAlert), for: .touchUpInside)
        
        secondButton = UIButton(type: .system)
        secondButton.setTitle("Show Second Alert", for: .normal)
        secondButton.addTarget(self, action: #selector(showSecondAlert), for: .touchUpInside)
        
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        
        // Layout
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 20),
            
            secondButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            
            ])
    }
    
    @objc func showFirstAlert() {
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func showSecondAlert() {
        let alertController = UIAlertController(title: "Alert", message: "Are you okay?", preferredStyle: .alert)
        
        // Initialize Actions
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) -> Void in
            print("The user is okay.")
        }
        
        let noAction = UIAlertAction(title: "No", style: .default) { (action) -> Void in
            print("The user is not okay.")
        }
        
        // Add Actions
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        
        // Present Alert Controller
        self.present(alertController, animated: true, completion: nil)
    }
}

PlaygroundPage.current.liveView = AlertViewController()
