import UIKit
import PlaygroundSupport

/*:
 
 # Models
 
 Aqui, a classe Contact serve apenas como um modelo para os objetos que serão usados na TableView.
 
 Costumamos chamar esses tipos de classes de Models.
 
 */

class Contact {
    var nome: String? // O simbolo ? indica que o atributo pode receber valor nulo nil
    var nomeFonetico: String?
    var sobrenome: String?
    
    init(nome: String, nomeFonetico: String, sobrenome: String){
        self.nome = nome
        self.nomeFonetico = nomeFonetico
        self.sobrenome = sobrenome
    }
    
}

class TableViewController: UITableViewController {
    
    /*:
     
     # Dictionary
     
     O Dictionary é uma coleção que associa uma chave (key) com um conteúdo. A chave pode ser numérica, texto, etc. O conteúdo pode ser qualquer tipo de objeto, inclusive um Array.
     
     Nesse exemplo, estamos associando uma chave do tipo String com um Array de objetos.
     
     */
    
    var myContacts = [String: [Contact]]()
    
    // Iniciando a TableView com valores de exemplo
    override func loadView() {
        super.loadView()
        let contact1 = Contact(nome: "Jose", nomeFonetico: "Josias", sobrenome: "Santos")
        let contact2 = Contact(nome: "Pedro", nomeFonetico: "Pedrones", sobrenome: "Silva")
        let contact3 = Contact(nome: "Jonas", nomeFonetico: "Jonatas", sobrenome: "Silvestre")
        let contact4 = Contact(nome: "Maria", nomeFonetico: "Mary", sobrenome: "Solan")
        
        // Para cada letra, você tem que inicializar o Array associado à ela.
        myContacts["J"] = [Contact]()
        myContacts["P"] = [Contact]()
        myContacts["M"] = [Contact]()
        
        
        // Estamos associando cada contato criado no Dictionary.
        myContacts["J"]!.append(contact1)
        myContacts["J"]!.append(contact3)
        myContacts["J"]!.sort { $0.nome < $1.nome }
        
        myContacts["P"]!.append(contact2)
        myContacts["M"]!.append(contact4)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return myContacts.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(myContacts.keys)[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(myContacts.keys)[section]
    }
    
    // Define a altura da seção
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let title = self.tableView(tableView, titleForHeaderInSection: section)
        if (title == "") {
            return 0.0
        }
        return 20.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        // Obtém a chave do dicionário por meio do índice da seção
        let key = Array(myContacts.keys)[indexPath.section]
        
        // Obtém o objeto associado à chave, nesse caso um Array
        let array = myContacts[key]
        
        // Obtém o contato do array
        let contact = array![indexPath.row]
        
        cell.textLabel?.text = contact.nome
        return cell
    }
}

let tableViewController = TableViewController(style: .plain)

PlaygroundPage.current.liveView = tableViewController



