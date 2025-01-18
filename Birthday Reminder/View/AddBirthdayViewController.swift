import UIKit
import Foundation

class AddBirthdayViewController: UIViewController, UITextFieldDelegate {
    
    private let namelabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .systemBlue
        return label
    }()
    
    private let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter name"
        return tf
    }()
    
    private let nameSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date of Birth"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .systemBlue
        return label
    }()
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            picker.preferredDatePickerStyle = .wheels
        } else {
        }
        picker.locale = Locale(identifier: "ru_RU")
        return picker
    }()
    
    private let dateTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter date"
        return tf
    }()
    
    private let dateSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .systemBlue
        return label
    }()
    
    private let ageTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter age"
        return tf
    }()
    
    private let agePicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    private let ageSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .systemBlue
        return label
    }()
    
    private let genderTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter gender"
        return tf
    }()
    
    private let genderPicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    let genderOptions: [String] = ["Male", "Female", "Other"]
    
    private let genderSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let instagramLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .systemBlue
        return label
    }()
    
    private let instagramTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Instagram"
        return tf
    }()
    
    private lazy var instagramAlertController: UIAlertController = {
        let alertController = UIAlertController(title: "Enter your Instagram", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter your Instagram"
        }
        
        let doneAction = UIAlertAction(title: "Done", style: .default) { [weak self] _ in
            if let text = alertController.textFields?.first?.text, !text.isEmpty {
                self?.instagramTextField.text = text  // Устанавливаем текст в текстовое поле
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(cancelAction)
        alertController.addAction(doneAction)
        
        return alertController
    }()
    
    private let instagramSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupDatePicker()
        setupAgePicker()
        setupGenderPicker()
        setupInstagramAlert()
        hideKeyboardWhenTapptedAround()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        }
    
    private func setupLayout() {
        [namelabel, nameTextField, nameSeparatorView, dateLabel, dateTextField, dateSeparatorView, ageLabel, ageTextField, ageSeparatorView, genderLabel, genderTextField, genderSeparatorView, instagramLabel, instagramTextField, instagramSeparatorView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            namelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            namelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            
            nameTextField.topAnchor.constraint(equalTo: namelabel.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: namelabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 5),
            nameSeparatorView.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            nameSeparatorView.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            nameSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            dateLabel.topAnchor.constraint(equalTo: nameSeparatorView.bottomAnchor, constant: 20),
            dateLabel.leadingAnchor.constraint(equalTo: namelabel.leadingAnchor),
            
            dateTextField.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            dateTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            dateTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            dateSeparatorView.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 5),
            dateSeparatorView.leadingAnchor.constraint(equalTo: dateTextField.leadingAnchor),
            dateSeparatorView.trailingAnchor.constraint(equalTo: dateTextField.trailingAnchor),
            dateSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            ageLabel.topAnchor.constraint(equalTo: dateSeparatorView.bottomAnchor, constant: 20),
            ageLabel.leadingAnchor.constraint(equalTo: namelabel.leadingAnchor),
            
            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 10),
            ageTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            ageTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            ageSeparatorView.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 5),
            ageSeparatorView.leadingAnchor.constraint(equalTo: ageTextField.leadingAnchor),
            ageSeparatorView.trailingAnchor.constraint(equalTo: ageTextField.trailingAnchor),
            ageSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            genderLabel.topAnchor.constraint(equalTo: ageSeparatorView.bottomAnchor, constant: 20),
            genderLabel.leadingAnchor.constraint(equalTo: namelabel.leadingAnchor),
            
            genderTextField.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            genderTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            genderTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            genderSeparatorView.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 5),
            genderSeparatorView.leadingAnchor.constraint(equalTo: genderTextField.leadingAnchor),
            genderSeparatorView.trailingAnchor.constraint(equalTo: genderTextField.trailingAnchor),
            genderSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            instagramLabel.topAnchor.constraint(equalTo: genderSeparatorView.bottomAnchor, constant: 20),
            instagramLabel.leadingAnchor.constraint(equalTo: namelabel.leadingAnchor),
            
            instagramTextField.topAnchor.constraint(equalTo: instagramLabel.bottomAnchor, constant: 10),
            instagramTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            instagramTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            instagramSeparatorView.topAnchor.constraint(equalTo: instagramTextField.bottomAnchor, constant: 5),
            instagramSeparatorView.leadingAnchor.constraint(equalTo: instagramTextField.leadingAnchor),
            instagramSeparatorView.trailingAnchor.constraint(equalTo: instagramTextField.trailingAnchor),
            instagramSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
        ])
    }
    
    private func setupDatePicker() {
        dateTextField.inputView = datePicker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        dateTextField.inputAccessoryView = toolbar
    }
    
    @objc private func donePressed() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        formatter.locale = Locale(identifier: "ru_RU")
        dateTextField.text = formatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    private func setupAgePicker() {
        agePicker.dataSource = self
        agePicker.delegate = self
        ageTextField.inputView = agePicker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ageDonePressed))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        ageTextField.inputAccessoryView = toolbar
    }
    
    @objc private func ageDonePressed() {
        let selectedRow = agePicker.selectedRow(inComponent: 0)
        ageTextField.text = "\(selectedRow + 1)"
        view.endEditing(true)
    }
    
    private func setupGenderPicker() {
        genderPicker.dataSource = self
        genderPicker.delegate = self
        genderTextField.inputView = genderPicker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(genderDonePressed))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        genderTextField.inputAccessoryView = toolbar
    }
    
    @objc private func genderDonePressed() {
        genderTextField.text = genderOptions[genderPicker.selectedRow(inComponent: 0)]
        view.endEditing(true)
    }
    
    private func setupInstagramAlert() {
        instagramTextField.delegate = self
    }
    
    private func setupActions() {
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == instagramTextField {
            present(instagramAlertController, animated: true)
            return false
        }
        return true
    }
    
}

extension AddBirthdayViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == agePicker {
            return 100
        } else if pickerView == genderPicker {
            return genderOptions.count
        }
        return 0
    }
}

extension AddBirthdayViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == agePicker{
            return "\(row + 1)"
        } else if pickerView == genderPicker {
            return genderOptions[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == agePicker {
            ageTextField.text = "\(row + 1)"
        } else if pickerView == genderPicker {
            genderTextField.text = genderOptions[row]
        }
    }
}

extension AddBirthdayViewController {
    func hideKeyboardWhenTapptedAround()  {
        let gestureRecognizer = UITapGestureRecognizer()
        gestureRecognizer.addTarget(self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
