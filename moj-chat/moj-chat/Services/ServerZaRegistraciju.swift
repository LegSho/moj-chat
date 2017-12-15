import Foundation
import Alamofire
import SwiftyJSON

class RegistracioniServer{
    static let instance = RegistracioniServer()
    
    let defaults = UserDefaults.standard
    
    var ulogovan: Bool {
        get {
           return defaults.bool(forKey: ULOGOVAN)
        } set {
            defaults.set(newValue, forKey: ULOGOVAN)
        }
    }
    
    var AuthToken: String {
        get {
            return defaults.value(forKey: AUTHTOKEN) as! String
        } set {
            defaults.set(newValue, forKey: AUTHTOKEN)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USEREMAIL) as! String
        } set {
            defaults.set(newValue, forKey: USEREMAIL)
        }
    }
    
    
    func registrovanjeUsera(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        let body: [String: Any] = [ "email":lowerCaseEmail, "password":password]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headerForRegAndLog).responseString { (response) in
            if response.result.error == nil {
                print("Uspela registracija")
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        let body: [String: Any] = [ "email": lowerCaseEmail, "password": password]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headerForRegAndLog).responseJSON { (response) in
            if response.result.error == nil {
                guard let daTa = response.data else { return }
                let json = try? JSON(data: daTa)
                self.userEmail = json!["user"].stringValue
                self.AuthToken = json!["token"].stringValue
                self.ulogovan = true
                print("Uspelo logovanje")
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    
    func dodavanjeUsera(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        let body: [String: Any] = [
            "name": name,
            "email": lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor" : avatarColor]
        
        Alamofire.request(URL_ADD_USER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: bearerHeader).responseJSON { (response) in
            if response.result.error == nil{
                guard let daTa = response.data else { return }
                let json = try? JSON(data: daTa)
                let name = json!["name"].stringValue
                let email = json!["email"].stringValue
                let avatarName = json!["avatarName"].stringValue
                let avatarColor = json!["avatarColor"].stringValue
                let _id = json!["_id"].stringValue
                
                UserServer.instance.setUserData(name: name, email: email, avatarName: avatarName, avatarColor: avatarColor, id: _id)
                print("Uspelo dodavanje usera i cuvanje njegovih podataka")
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func pronadjiUseraPremaEmail(completion: @escaping CompletionHandler) {
        
        Alamofire.request(URL_FIND_USER, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: bearerHeader).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                let json = try? JSON(data: data)
                let id = json!["_id"].stringValue
                let avatarColor = json!["avatarColor"].stringValue
                let avatarName = json!["avatarName"].stringValue
                let email = json!["email"].stringValue
                let name = json!["name"].stringValue
                
                UserServer.instance.setUserData(name: name, email: email, avatarName: avatarName, avatarColor: avatarColor, id: id)
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
        
    }
}

