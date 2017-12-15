import UIKit
class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = 5.0
//        self.layer.frame.width = 50.0
//        self.layer.frame.height = 50.0
        
    }
    
    func configureAvatarCell(index: Int, type: AvatarType){
        if type == AvatarType.dark {
            self.layer.backgroundColor = UIColor.clear.cgColor
            cellImage.image = UIImage(named: "dark\(index)")
        } else {
            self.layer.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            cellImage.image = UIImage(named: "light\(index)")
        }
    }
}

enum AvatarType {
    case light
    case dark
}
