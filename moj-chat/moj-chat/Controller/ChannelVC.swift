import UIKit

class ChannelVC: UIViewController{

    

    @IBOutlet weak var collectionTable: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //AuthService.instance.channels.count
        return 10
    }
    /*
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: tableCell, for: indexPath){
            cell.configureCell()
        } */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN_PAGE, sender: nil)
        
    }
    
    
    @IBAction func addChannelPressed(_ sender: Any) {
        let channel = AddChannelVC()
        channel.modalPresentationStyle = .custom
        present(channel, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){ }
    

  
}
