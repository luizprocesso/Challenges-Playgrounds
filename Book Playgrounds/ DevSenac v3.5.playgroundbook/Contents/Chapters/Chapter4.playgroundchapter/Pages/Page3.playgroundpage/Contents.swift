import UIKit
import PlaygroundSupport

class MyCustomCell: UITableViewCell {
    
    var myLabel = UILabel()
    var myImage = UIImageView(image: UIImage(named: "Apple.jpg"))
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.myLabel.backgroundColor = UIColor.yellow
        
        self.contentView.addSubview(myLabel)
        self.contentView.addSubview(myImage)
        
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 1),
            myLabel.leadingAnchor.constraint(equalTo: myImage.trailingAnchor, constant: 10),
            myLabel.centerYAnchor.constraint(equalTo: myImage.centerYAnchor, constant: 0)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class TableViewController: UITableViewController {
    
    var myArray = ["Fuji Apple", "Braeburn Apple", "Cameo Apple", "Red Delicious Apple"]
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Comando para registrar a UITableViewCell personalizada
        self.tableView.register(MyCustomCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Comando para recuperar uma célula registrada
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! MyCustomCell
        cell.myLabel.text = myArray[indexPath.row]
        
        return cell
    }
    
    // Método para remover linhas.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Observe que você deve alterar o seu array.
            myArray.remove(at: indexPath.row)
            
            // Comando para atualizar a tabela
            self.tableView.reloadData()
        }
    }
    
}

let tableViewController = TableViewController(style: .plain)

PlaygroundPage.current.liveView = tableViewController
