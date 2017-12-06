
import UIKit
import PlaygroundSupport

/*:
 
 # UITableViewController
 
 Veja logo abaixo que a nossa classe TableViewController é uma subclasse de UITableViewController.
 Ser uma subclasse significa que a nossa TableViewController pode implementar alguns métodos para manipulação de tabelas em UIKit
 
 */

let alfabeto = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
var nomes = ["Luiz", "Ana","Bianca"]
var sobreNomes: [String] = []
var fones: [Int] = []

class TableViewController : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contatos"
        
        var addContact = UIBarButtonItem(title: "+", style: .plain, target: self, action: nil)
        addContact.tintColor = #colorLiteral(red: 0.745098054409027, green: 0.156862750649452, blue: 0.0745098069310188, alpha: 1.0)
        self.navigationItem.rightBarButtonItem = addContact
        
    }
    
    
    // Esse é o método necessário para definir a quantidade de seções da UITableView
    // Uma seção é uma divisória na TableView.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return alfabeto.count
    }
    
    // Esse é o método necessário para definir a quantidade de linhas em cada seção
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // Esse é o método que define o conteúdo de cada célula da tabela.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "Contato \(indexPath.section).\(indexPath.row)"
        return cell
    }
    
    // Esse método define o título para a seção. Se você não declará-lo, a seção não terá titulo.
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return alfabeto[section]
    }
    
}



let tableViewController = TableViewController(style: .plain)

PlaygroundPage.current.liveView = UINavigationController(rootViewController: tableViewController) 
