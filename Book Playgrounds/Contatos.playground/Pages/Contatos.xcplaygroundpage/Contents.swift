
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

class TableViewController: UITableViewController {
    
    // Array com o conteúdo que será preenchido na UITableView
    var nomes = ["Ares", "São Jorge", "Goku", "Kratos", "Zeus"]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 27
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contatos"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Instanciando uma célula padrão a partir de uma existente
        var cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "Cell \(indexPath.section).\(indexPath.row)"
        
        if cell == nil {
            // Se a célula for vazia, criar uma nova.
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
            cell.accessoryType = .disclosureIndicator
        }
        
        // Configurando a célula padrão
        let state = nomes[indexPath.row]
        cell.detailTextLabel?.text = "Clique para mais informações"
        cell.textLabel?.text = state
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let text = tableView.cellForRow(at: indexPath)?.textLabel?.text else { return }
        
        let detail = SecondViewController()
        detail.labelText = "O estado eh " + text + "."
        navigationController?.pushViewController(detail, animated: true)
    }
    
    // Método para remover linhas.
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

