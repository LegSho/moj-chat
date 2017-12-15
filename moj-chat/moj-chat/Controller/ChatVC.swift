import UIKit

class ChatVC: UIViewController {

    //Outlets
    @IBOutlet weak var chatNameLbl: UILabel!
    @IBOutlet weak var buttonForSW: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonForSW.addTarget(self.revealViewController(), action: #selector(self.revealViewController().revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Actions
    


}
