import UIKit

@IBDesignable
class RoundImage: UIImageView {

    func setupView(){
       self.layer.cornerRadius  = self.layer.frame.width/2
        self.clipsToBounds = true
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
}
