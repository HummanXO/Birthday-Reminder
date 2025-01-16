import UIKit

class BirthdayListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Birthday List"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        }
    
    @objc func addTapped() {
        let addBirthdayVC = AddBirthdayViewController()
        let navController = UINavigationController(rootViewController: addBirthdayVC)
        present(navController, animated: true, completion: nil)
    }
}
