import UIKit

class UIColor__String: UIColor {

}

extension UIColor {
    func UIColorToString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return ("\(r), \(g), \(b), \(a)")
    }
}
