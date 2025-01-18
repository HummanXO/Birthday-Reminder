import UIKit

class BirthdayListViewController: UIViewController {
    
    private let nameLabel1: UILabel = {
        let label = UILabel()
        label.text = "Jeremy"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let dateLabel1: UILabel = {
        let label = UILabel()
        label.text = "18 дней"
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private let messageLabel1: UILabel = {
        let label = UILabel()
        label.text = "Happy Birthday, Jeremy!"
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private let separatorView1: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .systemGray6
        return separatorView
    }()
    
    private let nameLabel2: UILabel = {
        let label = UILabel()
        label.text = "John"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let dateLabel2: UILabel = {
        let label = UILabel()
        label.text = "20 дней"
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private let messageLabel2: UILabel = {
        let label = UILabel()
        label.text = "Happy Birthday, John!"
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private let separatorView2: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .systemGray6
        return separatorView
    }()
    
    private let nameLabel3: UILabel = {
        let label = UILabel()
        label.text = "Anna"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let dateLabel3: UILabel = {
        let label = UILabel()
        label.text = "25 дней"
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private let messageLabel3: UILabel = {
        let label = UILabel()
        label.text = "Happy Birthday, Anna!"
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private let separatorView3: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .systemGray6
        return separatorView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Birthday List"
        setupLayout()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        }
    
    @objc func addTapped() {
        let addBirthdayVC = AddBirthdayViewController()
        let navController = UINavigationController(rootViewController: addBirthdayVC)
        present(navController, animated: true, completion: nil)
    }
    
    private func setupLayout() {
        [nameLabel1, nameLabel2, nameLabel3, dateLabel1, dateLabel2, dateLabel3, messageLabel1, messageLabel2, messageLabel3, separatorView1, separatorView2, separatorView3].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            
            nameLabel1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            dateLabel1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            dateLabel1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            messageLabel1.topAnchor.constraint(equalTo: nameLabel1.bottomAnchor, constant: 10),
            messageLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            messageLabel1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            separatorView1.topAnchor.constraint(equalTo: messageLabel1.bottomAnchor, constant: 10),
            separatorView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            separatorView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            separatorView1.heightAnchor.constraint(equalToConstant: 2),
            
            nameLabel2.topAnchor.constraint(equalTo: separatorView1.bottomAnchor, constant: 20),
            nameLabel2.leadingAnchor.constraint(equalTo: nameLabel1.leadingAnchor),
            
            dateLabel2.topAnchor.constraint(equalTo: nameLabel2.topAnchor),
            dateLabel2.trailingAnchor.constraint(equalTo: dateLabel1.trailingAnchor),
            
            messageLabel2.topAnchor.constraint(equalTo: nameLabel2.bottomAnchor, constant: 10),
            messageLabel2.leadingAnchor.constraint(equalTo: messageLabel1.leadingAnchor),
            messageLabel2.trailingAnchor.constraint(equalTo: messageLabel1.trailingAnchor),
            
            separatorView2.topAnchor.constraint(equalTo: messageLabel2.bottomAnchor, constant: 10),
            separatorView2.leadingAnchor.constraint(equalTo: separatorView1.leadingAnchor),
            separatorView2.trailingAnchor.constraint(equalTo: separatorView1.trailingAnchor),
            separatorView2.heightAnchor.constraint(equalToConstant: 2),
            
            nameLabel3.topAnchor.constraint(equalTo: separatorView2.bottomAnchor, constant: 20),
            nameLabel3.leadingAnchor.constraint(equalTo: nameLabel1.leadingAnchor),
            
            dateLabel3.topAnchor.constraint(equalTo: nameLabel3.topAnchor),
            dateLabel3.trailingAnchor.constraint(equalTo: dateLabel1.trailingAnchor),
            
            messageLabel3.topAnchor.constraint(equalTo: nameLabel3.bottomAnchor, constant: 10),
            messageLabel3.leadingAnchor.constraint(equalTo: messageLabel1.leadingAnchor),
            messageLabel3.trailingAnchor.constraint(equalTo: messageLabel1.trailingAnchor),
            
            separatorView3.topAnchor.constraint(equalTo: messageLabel3.bottomAnchor, constant: 10),
            separatorView3.leadingAnchor.constraint(equalTo: separatorView1.leadingAnchor),
            separatorView3.trailingAnchor.constraint(equalTo: separatorView1.trailingAnchor),
            separatorView3.heightAnchor.constraint(equalToConstant: 2),
        ])
    }
}
