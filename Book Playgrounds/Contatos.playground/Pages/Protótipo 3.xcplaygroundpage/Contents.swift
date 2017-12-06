
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
var nomes = ["Ares", "Andre", "Goku","Tadaima","Ze", "Zeus", "Kratos", "Ryu", "Cup Head","ż", "Anton", "Levent", "Athenas"]

/*class ContactEntry: NSObject{
    var nomes: String!
    var email: String?
    var tel: String?

init(nomes: String, email: String?, tel: String?){
    self.nomes = nomes
    self.email = email
    self.tel = tel
    
    }
}*/

class TableViewController : UITableViewController {
    
    var sections : [(index: Int, lenght: Int,title: String)] = Array()
    
    var index = 0
    override func loadView() {
        super.loadView()
        self.title = "Contatos"
        nomes.sort{$0 < $1}
        for i in 0 ..< nomes.count {
            let commonPrefix = nomes[i].commonPrefix(with: nomes[index], options: .caseInsensitive)
            if commonPrefix.count == 0
            {
                let string = nomes[index].uppercased()
                let firstCharacter = string[string.startIndex]
                let title = "\(firstCharacter)"
                let newSection = (index: index, lenght: i-index  , title: title)
                sections.append(newSection)
                index = i
            }
        }
        
        
        
        var buttonPlus = UIBarButtonItem(title: "+", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = buttonPlus
    }
    
    /*@objc func addContact(sender: UIBarButtonItem) {
     
    }*/
    
    // Esse é o método necessário para definir a quantidade de seções da UITableView
    // Uma seção é uma divisória na TableView.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    // Esse é o método necessário para definir a quantidade de linhas em cada seção
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].lenght
        
    }// Esse é o método que define o conteúdo de cada célula da tabela.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = nomes[sections[indexPath.section].index+indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let text = tableView.cellForRow(at: indexPath)?.textLabel?.text else { return }
        
        let detail = SecondViewController()
        
        detail.labelText = "O número de " + text + " é 4002-8922."
        navigationController?.pushViewController(detail, animated: true)
    }
    
    // Esse método define o título para a seção. Se você não declará-lo, a seção não terá titulo.
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Observe que você deve alterar o seu array.
            nomes.remove(at: indexPath.row)
            
            
            // Comando para atualizar a tabela
            

            
        }
    }
    
    
    // Esse método define o título para a seção. Se você não declará-lo, a seção não terá titulo.
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections.map {$0.title}
    }
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}


let tableViewController = TableViewController(style: .plain)

PlaygroundPage.current.liveView = UINavigationController(rootViewController: tableViewController)

