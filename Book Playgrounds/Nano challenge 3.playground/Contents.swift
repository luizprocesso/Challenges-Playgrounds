import UIKit
import PlaygroundSupport

// cheese cake - navigationController


class cakeViewController:
UIViewController{
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: 2835, height: 520)
        scrollView.isPagingEnabled =  true
        scrollView.alwaysBounceVertical = false
        scrollView.flashScrollIndicators()
        
        let brisee = UIButton()
        brisee.setImage(#imageLiteral(resourceName: "IMG_0015.JPG"), for: UIControlState())
        let coulisImage = UIButton()
        coulisImage.setImage(#imageLiteral(resourceName: "IMG_0017.JPG"), for: UIControlState())
        let cheeseCake = UIButton()
        cheeseCake.setImage(#imageLiteral(resourceName: "IMG_0016.JPG"), for: UIControlState())
        
        func info(title: String)-> UILabel {
            let label = UILabel()
            label.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.numberOfLines = 20
            label.textAlignment = NSTextAlignment.justified
            label.text = title
            return label
        }
        let title = UILabel()
        title.text = "Receita de Cheese Cake"
        title.font = UIFont(name: "arial", size: 30)
        
        var cakeRecipe = info(title: "250g de farinha, \n125g de açúcar, \n125g de manteiga, \n1 ovo. \nMisture a farinha e o açúcar e posteriormente a manteiga e misture bem, até ter uma mistura homogênea e mais frosso que a farinha apenas. Adicione o ovo e misture até  incorporar a massa e deixa descançar. abra a massa com o rolo e coloque na forma, tire as rebarbas e faça furos com o garfo na base da massa, leve ao forno pré-aquecido a 150 C.Não deixe dourar apenas cozinhar um pouco, a massa deve ser tirada branca.")
        var coulis = info(title: "300g de frutas vermelhas, \n150g de açúcar, \n75ml de água . \nColoque tudo em uma panela no fogo e deixa ate criar a consistencia desejada. Se quiser pedaços de fruta não  mexa muito para não esmagar os mesmos.")
        
        var cheese = info(title: "400g de cream cheese, \n100ml de leite, \n50g de farinha, \n3 ovos, \n150g de açúcar, \n1 colher de café de essência  de baunilha. \nMisture todos os ingredientes ate obter uma mistura homogênea. Coloque sobre a massa, pré cozida e leve ao forno até  o recheio endurecer, retire e aguarde esfriar. Coloque a cobertura e leve a geladeira.")
        
        scrollView.addSubview(cakeRecipe)
        scrollView.addSubview(cheese)
        scrollView.addSubview(coulis)
        scrollView.addSubview(brisee)
        scrollView.addSubview(coulisImage)
        scrollView.addSubview(cheeseCake)
        view.addSubview(title)
        view.addSubview(scrollView)
        cakeRecipe.translatesAutoresizingMaskIntoConstraints = false
        cheese.translatesAutoresizingMaskIntoConstraints = false
        coulis.translatesAutoresizingMaskIntoConstraints = false
        brisee.translatesAutoresizingMaskIntoConstraints = false
        cheeseCake.translatesAutoresizingMaskIntoConstraints = false
        coulisImage.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        
        // Layout
        NSLayoutConstraint.activate([
            cakeRecipe.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            cakeRecipe.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 50),
            cakeRecipe.heightAnchor.constraint(equalToConstant: 500),
            cakeRecipe.widthAnchor.constraint(equalToConstant: 400),
            brisee.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            brisee.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 500),
            brisee.heightAnchor.constraint(equalToConstant: 500),
            brisee.widthAnchor.constraint(equalToConstant: 400),
            
            cheese.topAnchor.constraint(equalTo: scrollView.topAnchor, constant:40),
            cheese.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 980),
            cheese.heightAnchor.constraint(equalToConstant: 500),
            cheese.widthAnchor.constraint(equalToConstant: 400),
            cheeseCake.topAnchor.constraint(equalTo: scrollView.topAnchor, constant:40),
            cheeseCake.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 1430),
            cheeseCake.heightAnchor.constraint(equalToConstant: 500),
            cheeseCake.widthAnchor.constraint(equalToConstant: 400),
            
            coulis.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            coulis.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 1920),
            coulis.heightAnchor.constraint(equalToConstant: 500),
            coulis.widthAnchor.constraint(equalToConstant: 400),
            coulisImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 60),
            coulisImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 2380),
            coulisImage.heightAnchor.constraint(equalToConstant: 500),
            coulisImage.widthAnchor.constraint(equalToConstant: 400),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant:560),
            scrollView.widthAnchor.constraint(equalToConstant: 945),
            
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title.topAnchor.constraint(equalTo: view.topAnchor, constant: 70)
            ])
        
    }
    
}


//crumbs - navigationController

class crumbsViewController:
    UIViewController{
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: 945, height: 520)
        scrollView.isPagingEnabled =  true
        scrollView.alwaysBounceVertical = false
        scrollView.flashScrollIndicators()
        
        let title = UILabel()
        title.text = "Receita de Farofa Caseira"
        title.font = UIFont(name: "arial", size: 30)
        
        let farofaImage = UIButton()
        farofaImage.setImage(#imageLiteral(resourceName: "IMG_0022.JPG"), for: UIControlState())
        
        func info(title: String)-> UILabel {
            let label = UILabel()
            label.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.numberOfLines = 20
            label.textAlignment = NSTextAlignment.justified
            label.text = title
            return label
        }
        
        var farofa = info(title: "1 liguiça calabresa, \n100g de bacon em cubos, \n1 cebola em meia lua, \n2 dentes de algo picado, \n1kg de farinha de manioca média, \nCoentro e cebolinha a gosto, \nsal e pimenta. \nColoque em uma frigideira o bacon e a linguiça, em fogo alto, aguarde até  a gordura espalhar e fritar estes ingredientes, em seguida o alho e posteriormente a cebola. Adicione a farinha de mandioca até  que fique cozida, tempere com sal e pimenta a gosto. Desligue o fogo e adicione as ervas picadas.")
        
        
        view.addSubview(title)
        view.addSubview(scrollView)
        scrollView.addSubview(farofaImage)
        scrollView.addSubview(farofa)
        title.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        farofa.translatesAutoresizingMaskIntoConstraints = false
        farofaImage.translatesAutoresizingMaskIntoConstraints = false
        
        // Layout
        NSLayoutConstraint.activate([
            farofa.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            farofa.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 50),
            farofa.heightAnchor.constraint(equalToConstant: 500),
            farofa.widthAnchor.constraint(equalToConstant: 400),
            farofaImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            farofaImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 500),
            farofaImage.heightAnchor.constraint(equalToConstant: 500),
            farofaImage.widthAnchor.constraint(equalToConstant: 400),
            
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant:560),
            scrollView.widthAnchor.constraint(equalToConstant: 945),
            
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title.topAnchor.constraint(equalTo: view.topAnchor, constant: 70)
            
            ])
        
    }
    
}



// bbq - NavigationController
class SecondViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: 2835, height: 520)
        scrollView.isPagingEnabled =  true
        scrollView.bounces = false
        scrollView.flashScrollIndicators()
        
        let title = UILabel()
        title.text = "Receita de Costela ao Barbecue"
        title.font = UIFont(name: "arial", size: 30)
        
        let ribsImage = UIButton()
        ribsImage.setImage(#imageLiteral(resourceName: "IMG_0013.JPG"), for: UIControlState())
        let mirepoixImage = UIButton()
        mirepoixImage.setImage(#imageLiteral(resourceName: "IMG_0012.JPG"), for: UIControlState())
        let bbqImage = UIButton()
        bbqImage.setImage(#imageLiteral(resourceName: "IMG_0019.JPG"), for: UIControlState())
        
        func info(title: String)-> UILabel {
            let label = UILabel()
            label.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.numberOfLines = 20
            label.textAlignment = NSTextAlignment.justified
            label.text = title
            return label
        }
        
        var ribs = info(title: "Tempere a costela com sal e pimenta do reino. \nCozinhe a costela no mirepoix em fogo baixo até, ao espetar com o garfo, o mesmo não  prender na carne e retire. passe o molho barbecue e leve a grelha apenas para dourar, quando o molho secar retire e passe um pouco mais antes de servir.")
        var mirepoix = info(title: "500g de cebola, \n250g de salsão, \n250g de cenoura, \n5l de água. \nLave e decasque todos os ingredientes e coloque-os na água e deixe em fogo baixo por 30 minutos. Reserve o liquido e descarte os legumes.")
        var bbq = info(title: "utilize um molho pronto de sua preferência. \nSugestão: Heinz.")
        
        view.addSubview(scrollView)
        view.addSubview(title)
        scrollView.addSubview(ribsImage)
        scrollView.addSubview(mirepoixImage)
        scrollView.addSubview(bbqImage)
        scrollView.addSubview(ribs)
        scrollView.addSubview(mirepoix)
        scrollView.addSubview(bbq)
        ribs.translatesAutoresizingMaskIntoConstraints = false
        bbq.translatesAutoresizingMaskIntoConstraints = false
        mirepoix.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        ribsImage.translatesAutoresizingMaskIntoConstraints = false
        bbqImage.translatesAutoresizingMaskIntoConstraints = false
        mirepoixImage.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        // Layout
        NSLayoutConstraint.activate([
            mirepoix.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            mirepoix.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 50),
            mirepoix.heightAnchor.constraint(equalToConstant: 500),
            mirepoix.widthAnchor.constraint(equalToConstant: 400),
            mirepoixImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            mirepoixImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 500),
            mirepoixImage.heightAnchor.constraint(equalToConstant: 500),
            mirepoixImage.widthAnchor.constraint(equalToConstant: 400),
            
            ribs.topAnchor.constraint(equalTo: scrollView.topAnchor, constant:20),
            ribs.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 980),
            ribs.heightAnchor.constraint(equalToConstant: 500),
            ribs.widthAnchor.constraint(equalToConstant: 400),
            ribsImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant:20),
            ribsImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 1430),
            ribsImage.heightAnchor.constraint(equalToConstant: 500),
            ribsImage.widthAnchor.constraint(equalToConstant: 400),
            
            bbq.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            bbq.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 1920),
            bbq.heightAnchor.constraint(equalToConstant: 500),
            bbq.widthAnchor.constraint(equalToConstant: 400),
            bbqImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            bbqImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 2380),
            bbqImage.heightAnchor.constraint(equalToConstant: 500),
            bbqImage.widthAnchor.constraint(equalToConstant: 400),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant:560),
            scrollView.widthAnchor.constraint(equalToConstant: 945),
            
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title.topAnchor.constraint(equalTo: view.topAnchor, constant: 70)
            
            ])
        
    }
}

// Classe principal
class FirstViewController : UIViewController {
    
    override func loadView() {
        super.loadView()
        // UI
        self.view.backgroundColor = .white
        
        let porkRibs = UIButton()
        porkRibs.setImage(#imageLiteral(resourceName: "IMG_0021.JPG"), for: UIControlState())
        let cake = UIButton()
        cake.setImage(#imageLiteral(resourceName: "IMG_0024.JPG"), for: UIControlState())
        let crumbs = UIButton()
        crumbs.setImage(#imageLiteral(resourceName: "IMG_0022.JPG"), for: UIControlState())
        
        let button1 = UIButton(type: .system)
        button1.backgroundColor = #colorLiteral(red: 0.521568655967712, green: 0.109803922474384, blue: 0.0509803928434849, alpha: 1.0)
        button1.setTitle("BBQ Pork Ribs", for: .normal)
        button1.titleLabel!.font = UIFont(name: "arial", size: 20)
        button1.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button1.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        
        view.addSubview(button1)
        
        let button2 = UIButton(type: .system)
        button2.backgroundColor = #colorLiteral(red: 0.521568655967712, green: 0.109803922474384, blue: 0.0509803928434849, alpha: 1.0)
        button2.setTitle("Cassava Crumbs", for: .normal)
        button2.titleLabel!.font = UIFont(name: "arial", size: 20)
        button2.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button2.addTarget(self, action: #selector(openCassava), for: .touchUpInside)
        
        view.addSubview(button2)
        
        let button3 = UIButton(type: .system)
        button3.backgroundColor = #colorLiteral(red: 0.521568655967712, green: 0.109803922474384, blue: 0.0509803928434849, alpha: 1.0)
        button3.setTitle("Cheese Cake", for: .normal)
        button3.titleLabel!.font = UIFont(name: "arial", size: 20)
        button3.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button3.addTarget(self, action: #selector(openCake), for: .touchUpInside)
        
        view.addSubview(button3)
        
        view.addSubview(cake)
        view.addSubview(crumbs)
        view.addSubview(porkRibs)
        
        // Layout
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        cake.translatesAutoresizingMaskIntoConstraints = false
        crumbs.translatesAutoresizingMaskIntoConstraints = false
        porkRibs.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            porkRibs.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            porkRibs.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            porkRibs.heightAnchor.constraint(equalToConstant: 300),
            porkRibs.widthAnchor.constraint(equalToConstant: 200),
            
            cake.leadingAnchor.constraint(equalTo: porkRibs.leadingAnchor, constant:320),
            cake.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            cake.heightAnchor.constraint(equalToConstant: 300),
            cake.widthAnchor.constraint(equalToConstant: 200),
            
            crumbs.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            crumbs.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            crumbs.heightAnchor.constraint(equalToConstant: 300),
            crumbs.widthAnchor.constraint(equalToConstant: 200),
            
            button2.topAnchor.constraint(equalTo: crumbs.bottomAnchor, constant: 30),
            button2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:50),
            button2.heightAnchor.constraint(equalToConstant: 100),
            button2.widthAnchor.constraint(equalToConstant: 200),
            
            button1.topAnchor.constraint(equalTo: porkRibs.bottomAnchor, constant: 30),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.heightAnchor.constraint(equalToConstant: 100),
            button1.widthAnchor.constraint(equalToConstant: 200),
            
            button3.topAnchor.constraint(equalTo: cake.bottomAnchor, constant: 30),
            button3.leadingAnchor.constraint(equalTo: button1.leadingAnchor, constant:320),
            button3.heightAnchor.constraint(equalToConstant: 100),
            button3.widthAnchor.constraint(equalToConstant: 200),
            
            ])
        
    }
    
    @objc func openWithNavigation() {
        let newVC = SecondViewController()
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    @objc func openCassava() {
        let newVC = crumbsViewController()
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    @objc func openCake() {
        let newVC = cakeViewController()
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
}

let firstViewController = FirstViewController()

PlaygroundPage.current.liveView = UINavigationController(rootViewController: firstViewController)


