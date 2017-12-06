import UIKit
import PlaygroundSupport

let view = UIView()
view.backgroundColor = .white

let slider = UISlider()
slider.minimumValue = 10
slider.maximumValue = 100

view.addSubview(slider)

// Layout

slider.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    slider.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
    slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
    slider.widthAnchor.constraint(equalToConstant: 200)
    ])


PlaygroundPage.current.liveView = view
