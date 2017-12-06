import UIKit
import PlaygroundSupport

class Contact {
    var name: String
    var lastName: String
    
    // Construtor
    init(name: String, lastName: String){
        self.name = name
        self.lastName = lastName
    }
    
}

class ProfileViewController: UIViewController {
    
    var name: String?
    var lastName: String?
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let label = UILabel()
        label.text = "\(name!) \(lastName!)"
        label.font = label.font.withSize(20)
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Layout
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
}

class FormTableViewController : UITableViewController{
    private var firstNameCell: UITableViewCell = UITableViewCell()
    private var lastNameCell: UITableViewCell = UITableViewCell()
    
    private var firstNameText: UITextField = UITextField()
    private var lastNameText: UITextField = UITextField()
    
    override func loadView() {
        super.loadView()
        
        self.navigationItem.title = "New Contact"
        
        let buttonSave = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveContact))
        self.navigationItem.rightBarButtonItem = buttonSave
        
        // Set the Navigation title
        self.title = "User Options"
        
        // construct first name cell, section 0, row 0
        self.firstNameCell.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        self.firstNameText = UITextField(frame:  self.firstNameCell.contentView.bounds.insetBy(dx: 15, dy: 0))
        self.firstNameText.placeholder = "First Name"
        self.firstNameCell.addSubview(self.firstNameText)
        
        // construct last name cell, section 0, row 1
        self.lastNameCell.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        self.lastNameText = UITextField(frame: self.lastNameCell.contentView.bounds.insetBy(dx: 15, dy: 0))
        self.lastNameText.placeholder = "Last Name"
        self.lastNameCell.addSubview(self.lastNameText)
        
    }
    
    // Return the number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Return the number of rows for each section in your static table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0: return 2    // section 0 has 2 rows
        default: fatalError("Unknown number of sections")
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.section) {
        case 0:
            switch(indexPath.row) {
            case 0: return self.firstNameCell   // section 0, row 0 is the first name
            case 1: return self.lastNameCell    // section 0, row 1 is the last name
            default: fatalError("Unknown row in section 0")
            }
        default: fatalError("Unknown section")
        }
    }
    
    @objc func saveContact(){
        var name = self.firstNameText.text!
        let lastName = self.lastNameText.text!
        
        // if the name and last name has no values
        if name == "" || lastName == "" {
            let alert = UIAlertController(title: "Atenção", message: "Necessário preencher nome e sobrenome", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        // uppercase on the first letter
        name = name.prefix(1).uppercased() + name.dropFirst()
        
        let contact = Contact(name: name, lastName: lastName)
        
        let tableViewController =  self.navigationController?.viewControllers.first as! TableViewController
        
        tableViewController.addNewContact(contact: contact)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}

class TableViewController: UITableViewController {
    
    private var contactList = [String: [Contact]]()
    
    override func loadView() {
        super.loadView()
        
        self.navigationItem.title = "Contacts"
        
        let buttonPlus = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(pushFormViewController))
        self.navigationItem.rightBarButtonItem = buttonPlus
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return contactList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = Array(contactList.keys).sorted()[section]
        let array = contactList[key]
        return array!.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(contactList.keys).sorted()[section]
    }
    
    // Define the section height
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let title = self.tableView(tableView, titleForHeaderInSection: section)
        if (title == "") {
            return 0.0
        }
        return 20.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = Array(contactList.keys).sorted()[indexPath.section]
        let contact = contactList[key]![indexPath.row]
        
        let profileViewController = ProfileViewController()
        profileViewController.name = contact.name
        profileViewController.lastName = contact.lastName
        self.navigationController?.pushViewController(profileViewController, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        // Get the dictionary key
        let key = Array(contactList.keys).sorted()[indexPath.section]
        
        // Get the array related to the key on the Dictionary
        let array = contactList[key]
        
        // Get the contact from array
        let contact = array![indexPath.row]
        
        cell.textLabel?.text = contact.name
        return cell
    }
    
    // show the FormViewController to create a new contact
    @objc func pushFormViewController(sender: UIBarButtonItem) {
        self.navigationController?.pushViewController(FormTableViewController(), animated: true)
    }
    
    // add a new contact from FormViewController
    public func addNewContact(contact : Contact){
        
        let firstLetter = String(contact.name.first!)
        
        if self.contactList[firstLetter] == nil {
            self.contactList[firstLetter] = [Contact]()
        }
        
        self.contactList[firstLetter]?.append(contact)
        self.contactList[firstLetter]?.sort { $0.name < $1.name }
        
        // Asyncronous reload of TableView
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

let tableViewController = TableViewController(style: .plain)

PlaygroundPage.current.liveView = UINavigationController(rootViewController: tableViewController)


