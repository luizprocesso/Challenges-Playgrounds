import UIKit
import PlaygroundSupport

class CollectionViewController : UICollectionViewController {
    
    override func loadView() {
        super.loadView()
        self.collectionView?.backgroundColor = .white
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PlayCell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCell", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
    
}

PlaygroundPage.current.liveView = CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
