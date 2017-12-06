
/* 
 Contatos developed by Luiz Processo, Matheus Tusi.
 For Nano-Challange #04 - Apple Developer Academy Senac-SP - Swift Playgrounds Program
 */
import UIKit
import PlaygroundSupport

class Contact {
    var nome: String // O simbolo ? indica que o atributo pode receber valor nulo nil
    var nomeFonetico: String
    var sobrenome: String
    var telefone: String
    init(nome: String, nomeFonetico: String, sobrenome: String, telefone: String){
        self.nome = nome
        self.nomeFonetico = nomeFonetico
        self.sobrenome = sobrenome
        self.telefone = telefone
    }
    
}

class TableViewController: UITableViewController {
    
    public var myContacts = [String: [Contact]]()
    var Sorted = [String]()
    // Iniciando a TableView com valores de exemplo
    override func viewDidLoad() {
        super.viewDidLoad()
        let contact1 = Contact(nome: "Jose", nomeFonetico: "Josias", sobrenome: "Santos", telefone: "123")
        let contact2 = Contact(nome: "Pedro", nomeFonetico: "Pedrones", sobrenome: "Silva", telefone: "123")
        let contact3 = Contact(nome: "Jonas", nomeFonetico: "Jonatas", sobrenome: "Silvestre", telefone: "123")
        let contact4 = Contact(nome: "Maria", nomeFonetico: "Mary", sobrenome: "Solan", telefone: "123")
        
        // Para cada letra, você tem que inicializar o Array associado à ela.
        myContacts["M"] = [Contact]()
        myContacts["J"] = [Contact]()
        myContacts["P"] = [Contact]()
        
        
        
        // Estamos associando cada contato criado no Dictionary.
        
        myContacts["M"]!.append(contact4)
        
        myContacts["J"]!.append(contact1)
        myContacts["J"]!.append(contact3)
        myContacts["J"]!.sort { $0.nome < $1.nome }
        
        myContacts["P"]!.append(contact2)
        
        // Da append na sections automaticamente - matheus
        //OrdenaSessao()
        var buttonPlus = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(AddBtn))
        self.navigationItem.rightBarButtonItem = buttonPlus
        
        
        myContacts.sorted(by: {$0.key < $1.key})
        

        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return myContacts.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = Array(myContacts.keys)[section]
        //let key = Sorted[section]
        let array = myContacts[key]
        return array!.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var Sorted = Array(myContacts.keys)
        //Sorted.sort()
        print(Sorted)
        var test = Sorted[section]
        return test
    }
    
    // Define a altura da seção
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let title = self.tableView(tableView, titleForHeaderInSection: section)
        if (title == "") {
            return 0.0
        }
        return 20.0
    }
    
    func addNewContact(firstLetter: String, newContact : Contact){
        self.myContacts[firstLetter]?.append(newContact)
        self.myContacts[firstLetter]?.sort { $0.nome < $1.nome }
        
        // FAZER DE MODO ASSINCRONO
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func AddBtn(sender: UIBarButtonItem) {
        self.navigationController?.pushViewController(FormViewController(), animated: true)
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //when an item is pressed this function runs
        print("Sec: \(indexPath.section)")
        print("row: \(indexPath.row)")
        var key = Array(myContacts.keys)[indexPath.section]
        var NomeArr = myContacts[key]
        var Nome = NomeArr![indexPath.row]
         let newVC = ContatoViewController()
         newVC.contatoS = Nome
         self.navigationController?.pushViewController(newVC, animated: true)
        
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

class ContatoViewController: UIViewController {
    public var contatoS: Contact?
    override func viewDidLoad() {
        guard let nome = contatoS?.nome else {
            return
        }
        guard let sobrenome = contatoS?.sobrenome else {
            return
                print("error")
        }
        guard let fonetico = contatoS?.nomeFonetico else {return}
        guard let telefone = contatoS?.telefone else {return}
        var view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        print(nome)
        print(sobrenome)
        var nomeLbl = UILabel()
        nomeLbl.text = nome + " " + sobrenome
        nomeLbl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nomeLbl)
        var sobreLbl = UILabel()
        sobreLbl.text = fonetico + " Telefone: " + telefone
        view.addSubview(sobreLbl)
        sobreLbl.translatesAutoresizingMaskIntoConstraints = false
        nomeLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nomeLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        sobreLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sobreLbl.topAnchor.constraint(equalTo: nomeLbl.bottomAnchor, constant: 20).isActive = true
        
        self.view = view
        
    }
}
class FormViewController: UIViewController {
    var NomeTxt = UITextField()
    var SobreNomeTxt = UITextField()
    
    override func viewDidLoad() {
        var view = UIView()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        var AddBtn = UIButton(type: .system)
        
        var nomeLbl = UILabel()
        var sobreLbl = UILabel()
        var VoltarBtn = UIButton(type: .system)
        AddBtn.setTitle("Adicionar Contato", for: .normal)
        AddBtn.addTarget(self, action: #selector(ADD), for: .touchUpInside)
        VoltarBtn.setTitle("Voltar", for: .normal)
        VoltarBtn.addTarget(self, action: #selector(Voltar), for: .touchUpInside)
        nomeLbl.text = "Nome:"
        sobreLbl.text = "Sobrenome:"
        NomeTxt.borderStyle = .roundedRect
        NomeTxt.placeholder = "Coloque o nome aqui"
        SobreNomeTxt.borderStyle = .roundedRect
        SobreNomeTxt.placeholder = "Coloque o sobrenome aqui"
        view.addSubview(AddBtn)
        view.addSubview(nomeLbl)
        view.addSubview(sobreLbl)
        view.addSubview(NomeTxt)
        view.addSubview(SobreNomeTxt)
        view.addSubview(VoltarBtn)
        nomeLbl.translatesAutoresizingMaskIntoConstraints = false
        sobreLbl.translatesAutoresizingMaskIntoConstraints = false
        NomeTxt.translatesAutoresizingMaskIntoConstraints = false
        SobreNomeTxt.translatesAutoresizingMaskIntoConstraints = false
        
        AddBtn.translatesAutoresizingMaskIntoConstraints = false
        
        VoltarBtn.translatesAutoresizingMaskIntoConstraints = false
        nomeLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 20 ).isActive = true
        
        nomeLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20 ).isActive = true
        NomeTxt.topAnchor.constraint(equalTo: nomeLbl.bottomAnchor, constant: 10).isActive = true
        NomeTxt.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        NomeTxt.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        sobreLbl.topAnchor.constraint(equalTo: NomeTxt.bottomAnchor, constant: 10 ).isActive = true
        
        sobreLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        SobreNomeTxt.topAnchor.constraint(equalTo: sobreLbl.bottomAnchor, constant: 10).isActive = true
        SobreNomeTxt.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        SobreNomeTxt.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        AddBtn.topAnchor.constraint(equalTo: SobreNomeTxt.bottomAnchor, constant: 20).isActive = true
        
        AddBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        VoltarBtn.topAnchor.constraint(equalTo: AddBtn.bottomAnchor, constant: 20).isActive = true
        
        VoltarBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        self.view = view
    }
    @objc func Voltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func ADD(_ sender: UIButton) {
        guard let nomeAdd = NomeTxt.text else {return}
        guard let sobrenomeAdd = SobreNomeTxt.text else {return}
        let letraInicialChar = nomeAdd[nomeAdd.startIndex]
        var letraInical = String(letraInicialChar).uppercased()
        
        
        let ascii = letraInical.unicodeScalars.first?.value
        let alphabetP = Int(ascii!) - 65
        print(alphabetP)
        let contatoAdd = Contact(nome: nomeAdd, nomeFonetico: "", sobrenome: sobrenomeAdd, telefone: "")
        
        // WILLIAN - 27/10/17
        
        
        if let nav = self.navigationController {
            
            let tableViewController = self.navigationController?.viewControllers.first as! TableViewController
            var HasKey = false
            for i in tableViewController.myContacts.keys {
                if letraInical == i {
                    HasKey = true
                } 
            }
            if !HasKey {
                tableViewController.myContacts[letraInical] = [Contact]()
            }
            
            tableViewController.addNewContact(firstLetter: letraInical, newContact: contatoAdd)
            
            nav.popViewController(animated: true)
        }
        
        
        dismiss(animated: true, completion: nil)
        
    }
}


let tableViewController = TableViewController(style: .plain)

PlaygroundPage.current.liveView = UINavigationController(rootViewController: tableViewController)


