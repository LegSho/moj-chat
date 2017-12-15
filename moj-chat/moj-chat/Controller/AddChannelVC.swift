import UIKit

class AddChannelVC: UIViewController {
    
    //Outlets
    
    @IBOutlet weak var channelNameTxt: UITextField!
    @IBOutlet weak var descriptionTxt: UITextField!
    @IBOutlet weak var centralView: UIView!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }

    func setupView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.handleTap))
        bgView.addGestureRecognizer(tap)
        let popUp = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.popUpFunc))
        centralView.addGestureRecognizer(popUp)
    }

    @objc func handleTap() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func popUpFunc() {
        view.endEditing(true)
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CreateChannelPressed(_ sender: Any) {
    }
}
