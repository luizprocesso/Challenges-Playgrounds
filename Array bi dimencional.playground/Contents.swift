//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport


//model for TableView
class Category{
    
    var name: String //atributo
    
    init(name: String){
       self.name = name
        
    }
    
}


class FormViewController: UIViewController{
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Nome da Seção"
        label.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Nome da Categoria"
        label.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    let categoryTextField: UITextField = {
        let categoryField = UITextField()
        categoryField.borderStyle = .roundedRect
        return categoryField
    }()
    
    let sectionTextField: UITextField = {
        let sectionField = UITextField()
        sectionField.borderStyle = .roundedRect
        return sectionField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        let sectionStackView = UIStackView(frame: self.view.bounds)
        sectionStackView.axis = .horizontal
        sectionStackView.distribution = .fillEqually
        sectionStackView.alignment = .fill
        sectionStackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        sectionStackView.addArrangedSubview(sectionLabel)
        sectionStackView.addArrangedSubview(sectionTextField)
        
        
        let categoryStackView = UIStackView(frame: self.view.bounds)
        categoryStackView.axis = .horizontal
        categoryStackView.distribution = .fillEqually
        categoryStackView.alignment = .fill
        categoryStackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        categoryStackView.addArrangedSubview(categoryLabel)
        categoryStackView.addArrangedSubview(categoryTextField)
        
        
        let formStackView = UIStackView(frame: CGRect(x: 10 , y: 100, width: self.view.frame.width, height: 450))
        formStackView.axis = .vertical
        formStackView.distribution = .fillEqually
        formStackView.alignment = .fill
        formStackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        formStackView.addArrangedSubview(sectionStackView)
         formStackView.addArrangedSubview(categoryStackView)
        
        
        self.view.addSubview(formStackView)

        let button = UIButton(type: .roundedRect)
        button.setTitle("Salvar", for: .normal)
        button.addTarget(self, action: #selector(saveCategory), for: .touchUpInside)
        
        formStackView.addArrangedSubview(button)
        
        } //end of view didLoad
    
    @objc private func saveCategory(){
        
        let myTableViewController = self.tabBarController?.viewControllers?.first as! MyTableViewController
        
        let section = Int(sectionTextField.text!)
        let categoryName = categoryTextField.text
        
        
        
        myTableViewController.createCategory(section: section!, categoryName: categoryName!)
        
    }
    
    
}// end of class formaStackView






class MyTableViewController : UITableViewController{
    
    
    func createCategory (section: Int, categoryName: String){
        let newCategory = Category(name: categoryName)
       
        while(categoryList.count <= section){
            //create new section
            categoryList.append([Category]())
           
        }
        
        categoryList[section].append(newCategory)
        self.tableView.reloadData()
    }
    
    
    
    // data source for tableview
    var categoryList = [[Category]]() //declaration for bi dimensional array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Category List"
        
        //creating section 0
        categoryList.append([Category]())
        categoryList.append([Category]())
        
        //insert element into section 0
        let category1 = Category (name: "Senac")
        categoryList[0].append(category1)
    
        
        //category1.append
        
        
        let category2 = Category(name: "Jogos")
        categoryList[1].append(category2)
        
        let category3 = Category(name: "Mario")
        categoryList[1].append(category3)
        
    }
    
    /*override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Seção \(section)"
        
        view.backgroundColor = .orange
        
        
    }*/
    
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 60))
    
    let label = UILabel(frame: CGRect(x: 10, y: 0, width: tableView.frame.width, height: 60))
    label.text = "Seção \(section)"
    
    view.addSubview(label)
    
    view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    
    return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(categoryList[section].count==0){
            
        return 0
        }
        return 60
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return categoryList.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "GiovaniCell")
        let section = indexPath.section
        let row = indexPath.row
        let category = categoryList[section][row]
        cell.textLabel?.text = category.name
        
        
        return cell
        
    }
    
    
    
}


class MyTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableViewController = MyTableViewController()
        let tabBarItem1 = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
    tableViewController.tabBarItem = tabBarItem1
        
        let formViewController = FormViewController()
        let tabBarItem2 = UITabBarItem(tabBarSystemItem: .featured, tag: 2)
        
        formViewController.tabBarItem = tabBarItem2
        
        
        self.viewControllers = [tableViewController, formViewController]
    }
    
    
    
    
}

//PlaygroundPage.current.lineView = MyTableViewController()


PlaygroundPage.current.liveView = MyTabBarController()
