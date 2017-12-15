import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //Outlets
    @IBOutlet weak var collectionViewAvatar: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewAvatar.delegate = self
        collectionViewAvatar.dataSource = self
    }
    
    var trenutnaVrednostSegControl = AvatarType.dark
    
    
    @IBAction func segmentedControlChanged(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0 {
            trenutnaVrednostSegControl = AvatarType.dark
        } else if segmentedControl.selectedSegmentIndex == 1 {
            trenutnaVrednostSegControl = AvatarType.light
        }
        collectionViewAvatar.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: avatarCellIdentifier, for: indexPath) as? AvatarCell {
            cell.configureAvatarCell(index: indexPath.item, type: trenutnaVrednostSegControl)
            return cell
        } else {
            return AvatarCell()
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if trenutnaVrednostSegControl == .dark {
            UserServer.instance.postaviImeAvataraNaOsnovuIzabraneSlike(name: "dark\(indexPath.item)")
        } else {
            UserServer.instance.postaviImeAvataraNaOsnovuIzabraneSlike(name: "light\(indexPath.item)")
        }
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var kolona:CGFloat = 3
        let razmak: CGFloat = 10
        let padding: CGFloat = 50
        
        if (UIScreen.main.bounds.width > 320) {
            kolona = 4}
        let cellDimenzija = ((collectionView.bounds.width - padding) - (kolona-1)*razmak)/kolona
        
        return CGSize(width: cellDimenzija, height: cellDimenzija)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
