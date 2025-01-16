import Foundation

struct UserModel {
    var email: String = ""
    var password: String = ""
    
    func isValidEmail() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
        func isValidPassword() -> Bool {
        return !password.isEmpty
    }
}
