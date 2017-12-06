import UIKit
import PlaygroundSupport

let imageName = "wally.jpg"
let image = UIImage(named: imageName)
let imageView = UIImageView(image: image!)

imageView.frame = CGRect(x: 0, y: 0, width: 1024, height: 639)

let scrollView = UIScrollView()
scrollView.contentSize = imageView.frame.size
scrollView.addSubview(imageView)
scrollView.flashScrollIndicators()
scrollView.backgroundColor = .white

PlaygroundPage.current.liveView = scrollView
