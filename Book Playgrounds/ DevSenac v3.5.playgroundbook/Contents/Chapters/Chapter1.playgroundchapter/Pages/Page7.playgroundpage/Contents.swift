import UIKit
import PlaygroundSupport

// UI

let view = UIView()
view.backgroundColor = .gray

let pageControl = UIPageControl()
pageControl.numberOfPages = 3

view.addSubview(pageControl)

// Layout

pageControl.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    pageControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
    pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
    pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
    ])

PlaygroundPage.current.liveView = view
