import UIKit
import PlaygroundSupport

// UI
let view = UIView()
view.backgroundColor = .white

let datePicker = UIDatePicker()
datePicker.datePickerMode = .date

view.addSubview(datePicker)

// Layout

datePicker.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
    datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
    datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
    ])

PlaygroundPage.current.liveView = view
