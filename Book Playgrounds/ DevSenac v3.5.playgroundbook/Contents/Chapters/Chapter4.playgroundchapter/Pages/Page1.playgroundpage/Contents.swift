import UIKit
import PlaygroundSupport

/*:

 # UITableViewController
 
 Veja logo abaixo que a nossa classe TableViewController é uma subclasse de UITableViewController.
 Ser uma subclasse significa que a nossa TableViewController pode implementar alguns métodos para manipulação de tabelas em UIKit
 
*/
class TableViewController : UITableViewController {
    
    // Esse é o método necessário para definir a quantidade de seções da UITableView
    // Uma seção é uma divisória na TableView.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    // Esse é o método necessário para definir a quantidade de linhas em cada seção
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // Esse é o método que define o conteúdo de cada célula da tabela.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "Cell \(indexPath.section).\(indexPath.row)"
        return cell
    }
    
    // Esse método define o título para a seção. Se você não declará-lo, a seção não terá titulo.
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
}

let tableViewController = TableViewController(style: .plain)

PlaygroundPage.current.liveView = tableViewController
