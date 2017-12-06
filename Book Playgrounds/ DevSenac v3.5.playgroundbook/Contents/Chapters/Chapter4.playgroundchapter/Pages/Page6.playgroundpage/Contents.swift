import UIKit
import PlaygroundSupport

/*:
 
 # Models
 
 Aqui, a classe Contact serve apenas como um modelo para os objetos que serão usados na TableView.
 
 Costumamos chamar esses tipos de classes de Models.
 
 */

class Contact {
    var nome: String // O simbolo ? indica que o atributo pode receber valor nulo nil
    var nomeFonetico: String
    var sobrenome: String
    
    init(nome: String, nomeFonetico: String, sobrenome: String){
        self.nome = nome
        self.nomeFonetico = nomeFonetico
        self.sobrenome = sobrenome
    }
    
}

class TableViewController: UITableViewController {
    
    var sections = [String]()
    var content = [[Contact]]() // 2-dimensional array
    
    override func loadView() {
        super.loadView()
        let contact1 = Contact(nome: "Jose", nomeFonetico: "Josias", sobrenome: "Santos")
        let contact2 = Contact(nome: "Pedro", nomeFonetico: "Pedrones", sobrenome: "Silva")
        let contact3 = Contact(nome: "Jonas", nomeFonetico: "Jonatas", sobrenome: "Silvestre")
        let contact4 = Contact(nome: "Maria", nomeFonetico: "Mary", sobrenome: "Solan")
        
        
        sections.append("J")
        sections.append("M")
        sections.append("P")
        // A secao PRECISA estar em ordem alfabetica.
        sections.sort()
        
        // Precisamos criar espaco para as 26 letras do alfabeto.
        for _ in 0...25{
            content.append([Contact]())
        }
        
        // Em content, não precisa se preocupar com a ordem das letras iniciais. Basta agrupar nomes com primeira letra igual à um índice.
        
        content[0].append(contact1)
        content[0].append(contact3)
        content[0].sort { $0.nome < $1.nome } // Ordena os elementos do indice 0.
        content[1].append(contact4)
        content[2].append(contact2)
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let title = self.tableView(tableView, titleForHeaderInSection: section)
        if (title == "") {
            return 0.0
        }
        return 20.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        
        let key: String = sections[indexPath.section]
        
        // Buscar a chave no array content
        var text = ""
        for array in content {
            if array.count > 0 && array[0].nome.hasPrefix(key) {
                text = array[indexPath.row].nome
            }
        }
        
        cell.textLabel?.text = text
        return cell
    }
}

let tableViewController = TableViewController(style: .plain)
 
PlaygroundPage.current.liveView = tableViewController


