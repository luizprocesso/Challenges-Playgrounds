
import UIKit
import PlaygroundSupport

//profiler view controller, definição das variáveis e seus tipos
class ProfileViewController: UIViewController {
    
    public var image: UIImage?
    public var backgroundColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = backgroundColor
        
        //definição da imagem e seu tamanho
        let photo = image
        let imageView = UIImageView(image: photo)
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 450, height: 500)
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

//definição de imagens para a células 
class MyCollectionViewCell: UICollectionViewCell {
    
    public let images: UIImageView = {  
        let image = UIImageView()
        image.sizeToFit()
        
        
        // Layout
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.addSubview(images)
        
        NSLayoutConstraint.activate([
            images.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            images.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            images.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            images.heightAnchor.constraint(equalTo: self.contentView.heightAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//collection view controller
class CollectionViewController : UICollectionViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    // CollectionView DataSource e picker
    
    let picker = UIImagePickerController()
    
    var photoList: [UIImage] = [#imageLiteral(resourceName: "IMG_0029.JPG"), #imageLiteral(resourceName: "IMG_0018.JPG"), #imageLiteral(resourceName: "IMG_0031.JPG"), #imageLiteral(resourceName: "IMG_0054.JPG"), #imageLiteral(resourceName: "IMG_0002.JPG")]
        //função picker para buscar imagens na memoria do ipad 
    override func loadView() {
        super.loadView()
        
        picker.delegate = self
        self.title = "Fotos"
        self.collectionView?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.collectionView?.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "PlayCell")
        
        //botão  add
        let AddBtn = UIButton(type: .custom)
        AddBtn.setTitle("Add", for: .normal)
        AddBtn.titleLabel?.font = UIFont (name: "arial", size: 14)
        AddBtn.setTitleColor(AddBtn.tintColor, for: .normal) 
        AddBtn.addTarget(self, action: #selector(addPhoto(sender:)), for: .touchUpInside)
        
            //  nova view (navigation) para o picker
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: AddBtn)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCell", for: indexPath) as! MyCollectionViewCell
        
        // UIControlerViewCells bt not have viewDidLoad method, so we have to set the value directly into the element (nameLabel in this case). It is not usual.
        cell.images.image = photoList[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let profileCell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        let profileViewController = ProfileViewController()
        profileViewController.image = profileCell.images.image!
        profileViewController.backgroundColor = profileCell.backgroundColor!
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    //função para adicionar no array e dispatch para retcarregar a view controller
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


