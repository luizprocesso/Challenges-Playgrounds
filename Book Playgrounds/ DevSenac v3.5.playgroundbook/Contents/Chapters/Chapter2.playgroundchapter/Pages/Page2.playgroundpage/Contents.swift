import UIKit
import PlaygroundSupport

import UIKit

class MyScrollViewController: UIViewController {
    
    let scrollView = UIScrollView()
    var colors:[UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow]
    
    override func loadView() {
        super.loadView()
        
        // Você precisa habilitar as páginas do UIScrollView
        scrollView.isPagingEnabled = true
        
        self.view.addSubview(scrollView)
        
        // Criar páginas como subviews e adicionar em ScrollView
        var frame: CGRect = CGRect(x:0, y:0, width:0, height:0)
        
        // Alterar o tamanho da sua janela
        let pageWidth = CGFloat(350)
        let pageHeight = CGFloat(350)
        
        for index in 0..<4 {
            
            // A origem da página no eixo X será referente ao tamanho da tela.
            frame.origin.x = pageWidth * CGFloat(index)
            frame.size = CGSize(width: pageWidth, height: pageHeight)
            
            let subView = UIView(frame: frame)
            subView.backgroundColor = colors[index]
            
            self.scrollView.addSubview(subView)
            
        }
        
        // Registrar o conteúdo da UIScrollView
        self.scrollView.contentSize = CGSize(width:pageWidth * 4,height: pageHeight)
        
        //Layout
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ])
        
        
    }
}

PlaygroundPage.current.liveView = MyScrollViewController()

