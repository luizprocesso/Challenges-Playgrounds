import UIKit
import PlaygroundSupport

let webView = UIWebView()
webView.loadHTMLString("<a href='http://www.example.com/'>Hello world</a>", baseURL: nil)

PlaygroundPage.current.liveView = webView
