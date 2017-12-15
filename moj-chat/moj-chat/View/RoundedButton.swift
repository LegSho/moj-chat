import UIKit

@IBDesignable
class RoundedButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBInspectable var corner: CGFloat = 5.0 {
        didSet {
            self.layer.cornerRadius = corner
        }
    }
    
    func setupView() {
        self.layer.cornerRadius = corner
    }
    
    override func prepareForInterfaceBuilder() {
        self.setupView()
    }

}
