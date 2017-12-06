import UIKit
import PlaygroundSupport

class ProfileViewController: UIViewController {
    
    public var imagem: UIImage?
    public var backgroundColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let image = imagem
        let imageView = UIImageView(image: image)
        
        imageView.frame = CGRect(x: 0, y: 0, width: 450, height: 500)
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Layout
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 580),
            imageView.heightAnchor.constraint(equalToConstant: 700)
        
            ])
        
    }
}

class MyCollectionViewCell: UICollectionViewCell {
    
    
    public let button: UIImageView = {  
        let button1 = UIImageView()
        button1.sizeToFit()

        
        // Layout
        button1.translatesAutoresizingMaskIntoConstraints = false
        return button1
    }()
    
//*/
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            button.heightAnchor.constraint(equalTo: self.contentView.heightAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CollectionViewController : UICollectionViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    // CollectionView DataSource
    
    let picker = UIImagePickerController()

    
     var photoList: [UIImage] = [#imageLiteral(resourceName: "IMG_0022.PNG"), #imageLiteral(resourceName: "IMG_0046.JPG"), #imageLiteral(resourceName: "IMG_0063.PNG"), #imageLiteral(resourceName: "IMG_0082.JPG"), #imageLiteral(resourceName: "IMG_0083.PNG"), #imageLiteral(resourceName: "IMG_0001.JPG"), #imageLiteral(resourceName: "IMG_0002.JPG"), #imageLiteral(resourceName: "IMG_0081.JPG"), #imageLiteral(resourceName: "IMG_0012.PNG")]
    
    override func loadView() {
        super.loadView()
        
        picker.delegate = self
        self.title = "miPhotos"
        self.collectionView?.backgroundColor = .lightGray
        self.collectionView?.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "PlayCell")
        
        let AddBtn = UIButton(type: .custom)
        AddBtn.setTitle("ADD", for: .normal)
        AddBtn.titleLabel?.font = UIFont (name: "helvetica", size: 17)
        AddBtn.setTitleColor(AddBtn.tintColor, for: .normal) 
        AddBtn.addTarget(self, action: #selector(addPhoto(sender:)), for: .touchUpInside)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: AddBtn)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCell", for: indexPath) as! MyCollectionViewCell
        
        // UIControlerViewCells does not have viewDidLoad method, so we have to set the value directly into the element (nameLabel in this case). It is not usual.
        cell.button.image = photoList[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let profileCell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        let profileViewController = ProfileViewController()
        profileViewController.imagem  = profileCell.button.image!
        profileViewController.backgroundColor = profileCell.backgroundColor!
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        photoList.append(chosenImage)
        
        DispatchQueue.main.async {
            self.collectionView?.reloadData()


        }
        dismiss(animated:true, completion: nil) 
    }
    
    
    @IBAction func addPhoto(sender:UIButton) {
        
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
        
        }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

PlaygroundPage.current.liveView = UINavigationController(rootViewController:CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))



