import UIKit

class LoginViewController: UIViewController {
    
    let loginController = LoginController()
    
    private let loginImage: UIImage? = {
        let iamge = UIImage(named: "trendy-birthday-reminder-vector")
        return iamge
    }()
    
    private let loginImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let singInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sing Up"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemBlue
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "Enter your email"
        return textField
    }()
    
    private let separatorEmail: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemBlue
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "Enter your password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let hidePasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.tintColor = .systemGray
        return button
    }()
    
    private let separatorPassword: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private let faceIdSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = true
        return switchControl
    }()
    
    private let faceIdLabel: UILabel = {
        let label = UILabel()
        label.text = "Use Face ID"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let enterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupActions()
        hideKeyboardWhenTappedAround()
    }
    
    private func setupLayout() {
        loginImageView.image = loginImage
        passwordTextField.rightViewMode = .always
        passwordTextField.rightView = hidePasswordButton
        
        [loginImageView, singInLabel, emailLabel, emailTextField, separatorEmail, passwordLabel, passwordTextField, separatorPassword, faceIdSwitch, faceIdLabel, enterButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            loginImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginImageView.widthAnchor.constraint(equalToConstant: 200),
            loginImageView.heightAnchor.constraint(equalToConstant: 200),
            
            singInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            singInLabel.topAnchor.constraint(equalTo: loginImageView.bottomAnchor, constant: 32),
            
            emailLabel.leadingAnchor.constraint(equalTo: singInLabel.leadingAnchor),
            emailLabel.topAnchor.constraint(equalTo: singInLabel.bottomAnchor, constant: 8),
            
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            
            separatorEmail.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            separatorEmail.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            separatorEmail.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
            separatorEmail.heightAnchor.constraint(equalToConstant: 2),
            
            passwordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordLabel.topAnchor.constraint(equalTo: separatorEmail.bottomAnchor, constant: 8),
            
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            
            separatorPassword.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            separatorPassword.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            separatorPassword.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            separatorPassword.heightAnchor.constraint(equalToConstant: 2),
            
            faceIdSwitch.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            faceIdSwitch.topAnchor.constraint(equalTo: separatorPassword.topAnchor, constant: 32),
            
            faceIdLabel.trailingAnchor.constraint(equalTo: faceIdSwitch.leadingAnchor, constant: -8),
            faceIdLabel.centerYAnchor.constraint(equalTo: faceIdSwitch.centerYAnchor),
            
            enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            enterButton.widthAnchor.constraint(equalToConstant: 200),
            enterButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    private func setupActions() {
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        enterButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        hidePasswordButton.addTarget(self, action: #selector(hidePasswordButtonTapped), for: .touchUpInside)
    }
    
    @objc func textFieldDidChange() {
        loginController.updateEmail(emailTextField.text ?? "")
        loginController.updatePassword(passwordTextField.text ?? "")
        
        if loginController.canLogin() {
            enterButton.isEnabled = true
            enterButton.backgroundColor = .systemBlue
        } else {
            enterButton.isEnabled = false
            enterButton.backgroundColor = .systemGray
        }
    }
    
    @objc func loginButtonTapped() {
        let birthdayListViewController = BirthdayListViewController()
        navigationController?.pushViewController(birthdayListViewController, animated: true)
    }
    
    @objc func hidePasswordButtonTapped() {
        passwordTextField.isSecureTextEntry.toggle()
        hidePasswordButton.setImage(passwordTextField.isSecureTextEntry ? UIImage(systemName: "eye") : UIImage(systemName: "eye.slash"), for: .normal)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
