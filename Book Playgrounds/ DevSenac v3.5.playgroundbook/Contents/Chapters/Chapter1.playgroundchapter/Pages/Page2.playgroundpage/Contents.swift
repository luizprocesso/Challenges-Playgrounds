import UIKit
import PlaygroundSupport

let view = UIView()
view.backgroundColor = .white

let activityView = UIActivityIndicatorView()
activityView.color = .gray
activityView.startAnimating()

view.addSubview(activityView)

// Layout

activityView.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    activityView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    activityView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])


PlaygroundPage.current.liveView = view
