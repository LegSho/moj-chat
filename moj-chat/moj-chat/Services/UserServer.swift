import Foundation

class UserServer {
    static let instance = UserServer()
    
    public private(set) var username = ""
    public private(set) var email = ""
    public private(set) var avatarName = ""
    public private(set) var avatarColor = ""
    public private(set) var id = ""

    func setUserData(name: String, email: String, avatarName: String, avatarColor: String, id: String) {
        username = name
        self.email = email
        self.avatarName = avatarName
        self.avatarColor = avatarColor
        self.id = id
    }
    
    func postaviImeAvataraNaOsnovuIzabraneSlike(name: String){
        self.avatarName = name
    }
    
    // [0.111111, 0.41313131, 0.563436, 0.3113131]
    
    func returnUIColor(componenta: String) -> UIColor {
        
        let scanner = Scanner(string: componenta)
        let skippedChar = CharacterSet(charactersIn: "[], ")
        let zarez = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skippedChar
        var r, g, b, a: NSString?
        scanner.scanUpToCharacters(from: zarez, into: &r)
        scanner.scanUpToCharacters(from: zarez, into: &g)
        scanner.scanUpToCharacters(from: zarez, into: &b)
        scanner.scanUpToCharacters(from: zarez, into: &a)
        
        let defaultColor = UIColor.gray
        guard let rUnwrapped = r else { return defaultColor}
        guard let gUnwrapped = g else { return defaultColor}
        guard let bUnwrapped = b else { return defaultColor}
        guard let aUnwrapped = a else { return defaultColor}
        
        let rFloat = CGFloat(rUnwrapped.doubleValue)
        let gFloat = CGFloat(gUnwrapped.doubleValue)
        let bFloat = CGFloat(bUnwrapped.doubleValue)
        let aFloat = CGFloat(aUnwrapped.doubleValue)
        
        let newUIColor = UIColor(displayP3Red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        return newUIColor
    }
    
    
    
    
}
