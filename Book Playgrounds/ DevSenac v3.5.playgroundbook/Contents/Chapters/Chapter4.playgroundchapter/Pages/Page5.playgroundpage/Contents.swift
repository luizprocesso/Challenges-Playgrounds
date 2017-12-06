import UIKit
import PlaygroundSupport

/*:
 
 # Exemplo vencedor do Scholarship WWDC 2017
 
 Esse exemplo é o envio de um estudante que conseguiu um ingresso para a WWDC 2017.
 
 */

class WWDCDetailViewController: UIViewController {
    var message = ""
    var animator: UIDynamicAnimator?
    
    override func loadView() {
        title = "Please let me go!"
        view = UIView()
        view.backgroundColor = UIColor.white
    }
    
    override func viewDidLayoutSubviews() {
        guard animator == nil else { return }
        
        // 1: split the message up into words
        let words = message.components(separatedBy: " ")
        
        // 2: create an empty array of labels
        var labels = [UILabel]()
        
        // 3: convert each word into a label
        for (index, word) in words.enumerated() {
            let label = UILabel()
            label.font = UIFont.preferredFont(forTextStyle: .title1)
            
            // 4: position the labels one above the other
            label.center = CGPoint(x: view.frame.midX, y: 50 + CGFloat(30 * index))
            label.text = word
            label.sizeToFit()
            view.addSubview(label)
            
            labels.append(label)
        }
        
        // 5: create a gravity behaviour for our labels
        let gravity = UIGravityBehavior(items: labels)
        animator = UIDynamicAnimator(referenceView: view)
        animator?.addBehavior(gravity)
        
        // 6: create a collision behavior for our labels
        let collisions = UICollisionBehavior(items: labels)
        
        // 7: give some boundaries for the collisions
        collisions.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collisions)
    }
}

class TableViewController: UITableViewController {
    
    var reasons = ["the labs are great", "the sessions teach new things", "the people are awesome", "the keynote rocks", "I must hug Joe Groff"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Reasons I should attend WWDC"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reasons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // attempt to dequeue a cell
        var cell: UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if cell == nil {
            // none to dequeue – make a new one
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
            cell?.accessoryType = .disclosureIndicator
        }
        
        // configure cell
        let reason = reasons[indexPath.row]
        cell.detailTextLabel?.text = "I want to attend because \(reason)"
        cell.textLabel?.text = "Reason #\(indexPath.row + 1)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let text = tableView.cellForRow(at: indexPath)?.detailTextLabel?.text else { return }
        
        let detail = WWDCDetailViewController()
        detail.message = text
        navigationController?.pushViewController(detail, animated: true)
    }
    
    // Método para remover linhas.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Observe que você deve alterar o seu array.
            self.reasons.remove(at: indexPath.row)
            
            // Comando para atualizar a tabela
            self.tableView.reloadData()
        }
    }
    
}

let tableViewController = TableViewController(style: .plain)

PlaygroundPage.current.liveView = UINavigationController(rootViewController: tableViewController)
