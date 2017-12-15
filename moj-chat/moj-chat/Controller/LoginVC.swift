import UIKit

class LoginVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        let popUp = UITapGestureRecognizer(target: self, action: #selector(LoginVC.handleTap))
        view.addGestureRecognizer(popUp)
    }
    @objc func handleTap() {
        view.endEditing(true)
    }
    

    @IBAction func loginBtnPressed(_ sender: Any) {
        
    }
    
    
    @IBAction func DontHaveAccPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    
    
    
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   
    
    
    
}
