import UIKit

class CreateAccountVC: UIViewController {
    
    //Outlets
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailLblTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var defaultAvatarName = "profileDefault"
    var defaultUserBGColor = "[0.5, 0.5, 0.5, 1]"
    var avatarColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        spinner.isHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserServer.instance.avatarName != "" && UserServer.instance.avatarName.contains("dark") {
            self.userImage.image = UIImage(named: UserServer.instance.avatarName)
            defaultAvatarName = UserServer.instance.avatarName
        }
        else if UserServer.instance.avatarName.contains("light") {
            self.userImage.image = UIImage(named: UserServer.instance.avatarName)
        }
    }
    
    // Actions
    
    func setupView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    
    @IBAction func createAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func generateBackgroungColorPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255))/255
        let g = CGFloat(arc4random_uniform(255))/255
        let b = CGFloat(arc4random_uniform(255))/255
        let newColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        self.userImage.backgroundColor = newColor
        self.defaultUserBGColor = ("\(r), \(g), \(b), 1")
    }
    
    @IBAction func createAccBtnPressed(_ sender: Any) {

            guard let userName = usernameTxt.text, usernameTxt.text != "" else { return }
            guard let email = emailLblTxt.text, emailLblTxt.text != "" else { return }
            guard let pass = passTxt.text, passTxt.text != "" else { return }
        RegistracioniServer.instance.registrovanjeUsera(email: email, password: pass) { (success) in
                if success {
                    self.spinner.isHidden = false
                    self.spinner.startAnimating()
                    RegistracioniServer.instance.loginUser(email: email, password: pass, completion: { (success) in
                        if success {
                            RegistracioniServer.instance.dodavanjeUsera(name: userName, email: email, avatarName: self.defaultAvatarName, avatarColor: self.defaultUserBGColor, completion: { (success) in
                                if success {
                                    self.spinner.isHidden = true
                                    self.spinner.stopAnimating()
                                    self.performSegue(withIdentifier: UNWIND, sender: nil)
                                }
                            })
                        }
                    })
                }
            }
        }
    
    
    @IBAction func backPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
