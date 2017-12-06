
import UIKit
import PlaygroundSupport

/*:
 
 # UITableViewController + UINavigationController
 
 Veja que é possível interagir UITableViewController com uma UINavigationController
 
 */

// Segunda classe
class SecondViewController: UIViewController {
    
    public var labelText: String?
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        let label = UILabel()
        label.text = labelText
        label.textColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Layout
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
    }
}
/*:
 
 # UITableViewController
 
 Veja logo abaixo que a nossa classe TableViewController é uma subclasse de UITableViewController.
 Ser uma subclasse significa que a nossa TableViewController pode implementar alguns métodos para manipulação de tabelas em UIKit
 
 */
class TableViewController : UITableViewController {
    
    var nomes = ["Ares", "São Jorge", "Goku", "Kratos", "Zeus"]
    
    let alfabeto = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contatos"
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
     
     // Instanciando uma célula padrão a partir de uma existente
     var cell: UITableViewCell!
     cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
     
     if cell == nil {
     // Se a célula for vazia, criar uma nova.
     cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
     cell?.accessoryType = .disclosureIndicator
     }
     
     // Configurando a célula padrão
     let state = nomes[indexPath.row]
     cell.detailTextLabel?.text = "Clique para abrir uma segunda view"
     cell.textLabel?.text = state
     
     return cell
     }
     
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     guard let text = tableView.cellForRow(at: indexPath)?.textLabel?.text else { return }
     
     let detail = SecondViewController()
     detail.labelText = "O estado eh " + text + "."
     navigationController?.pushViewController(detail, animated: true)
     }
    
    // Esse método define o título para a seção. Se você não declará-lo, a seção não terá titulo.
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Observe que você deve alterar o seu array.
            self.nomes.remove(at: indexPath.row)
            
            // Comando para atualizar a tabela
            self.tableView.reloadData()
        }
    }
    
}


let tableViewController = TableViewController(style: .plain)

PlaygroundPage.current.liveView = UINavigationController(rootViewController: tableViewController)

