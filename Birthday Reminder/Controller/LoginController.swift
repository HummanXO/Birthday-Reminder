import Foundation

class LoginController {
    private var user = UserModel()
    
    func updateEmail(_ email: String) {
        user.email = email
    }
    
    func updatePassword(_ password: String) {
        user.password = password
    }
    
    func canLogin() -> Bool {
        user.isValidEmail() && user.isValidPassword()
    }
}
