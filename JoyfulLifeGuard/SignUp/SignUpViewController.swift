import Foundation
import UIKit
import Then
import RxSwift
import RxCocoa

final class SignUpViewController: UIViewController {
    
    // MARK: - UI Components
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var okButton: UIButton!
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    private var selectedYear = String(Calendar.current.component(.year, from: Date()))
    private var selectedMonth = String(Calendar.current.component(.month, from: Date()))
    private var selectedDay = String(Calendar.current.component(.day, from: Date()))
    private var selectedDate = String()

    private let birthDayPickerView = BirthDayPickerView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .grayCw
    }
    private let toolBar = UIToolbar().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.barStyle = .default
        $0.backgroundColor = .white
        $0.isTranslucent = true
        $0.tintColor = .blackCw
        $0.sizeToFit()
    }
    private let flexibleSpace: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        return button
    }()
    private let confirmButton = UIBarButtonItem().then {
        $0.title = "확인"
        $0.style = .plain
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bindView()
        setProperties()
    }
    
    @objc func actionSheetAlert(_sender: UIButton){
        let alert = UIAlertController(title: "선택", message: nil, preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let camera = UIAlertAction(title: "카메라", style: .default) { [weak self] (_) in
            self?.presentPickerVC(mode: .camera)
        }
        let album = UIAlertAction(title: "앨범", style: .default) { [weak self] (_) in
            self?.presentPickerVC(mode: .photoLibrary)
        }
        
        alert.addAction(cancel)
        alert.addAction(camera)
        alert.addAction(album)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func presentPickerVC(mode: UIImagePickerController.SourceType){
        let vc = UIImagePickerController()
        vc.sourceType = mode
        vc.delegate = self
        vc.allowsEditing = true
        
        present(vc, animated: true, completion: nil)
    }
    
    private func setProperties() {
        self.nameTextField.layer.borderColor = UIColor.fromRGB(242, 85, 44).cgColor
        self.nameTextField.layer.borderWidth = 1.0
        self.nameTextField.layer.cornerRadius = 4.0
        
        self.birthTextField.layer.borderColor = UIColor.fromRGB(242, 85, 44).cgColor
        self.birthTextField.layer.borderWidth = 1.0
        self.birthTextField.layer.cornerRadius = 4.0
        
        hideKeyboardWhenTappedAround()
        birthTextField.inputView = birthDayPickerView
        birthTextField.inputAccessoryView = toolBar
        toolBar.setItems([flexibleSpace, confirmButton], animated: true)
        setButton()
        setNotification()
    }
    
    private func setButton() {
        self.okButton.setTitleColor(.veryLightPinkCw, for: .disabled)
        self.okButton.setBackgroundColor(.whiteCw, forState: .disabled)
        self.okButton.clipsToBounds = true
        self.okButton.layer.cornerRadius = 8.0
        self.okButton.isEnabled = isEnableButton()
        self.profileButton.addTarget(self, action: #selector(actionSheetAlert(_sender:)), for: .touchUpInside)
    }
    
    // MARK: - Bind
    
    private func bindView() {
        confirmButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.birthTextField.resignFirstResponder()
                self.birthTextField.text = self.convertFullDate(year: self.selectedYear, month: self.selectedMonth, day: self.selectedDay)
                self.okButton.isEnabled = self.isEnableButton()
            })
        .disposed(by: disposeBag)
        
        birthDayPickerView.rx.itemSelected
            .subscribe(onNext: { [weak self] (index, component) in
                guard let self = self else { return }
                switch component {
                case 0:
                    self.selectedYear = String(index + 1900)
                case 1:
                    if index < 9 {
                        self.selectedMonth = "0" + String(index + 1)
                    } else {
                        self.selectedMonth = String(index + 1)
                    }
                case 2:
                    if index < 9 {
                        self.selectedDay = "0" + String(index + 1)
                    } else {
                        self.selectedDay = String(index + 1)
                    }
                default:
                    break
                }
                self.birthTextField.text = self.convertFullDate(year: self.selectedYear, month: self.selectedMonth, day: self.selectedDay)
                self.okButton.isEnabled = self.isEnableButton()
            })
        .disposed(by: disposeBag)
        
        okButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                guard let self = self,
                      let profileImage = self.profileImageView.image?.pngData(),
                      let name = self.nameTextField.text,
                      let birthDay = self.birthTextField.text else { return }
                let user = UserModel(profile: profileImage, name: name, birthDay: birthDay, regiserDay: self.getCurrentDate())
                let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
                guard let join01VC = mainStoryboard.instantiateViewController(withIdentifier: "Join01ViewController") as? Join01ViewController else { return }
                join01VC.configure(user: user)
                self.navigationController?.pushViewController(join01VC, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    private func setNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillHide(_ notification: NSNotification) {
        self.okButton.isEnabled = self.isEnableButton()
    }
    
    private func isEnableButton() -> Bool {
        if profileImageView.image == nil {
            return false
        }
        if nameTextField.text == "" {
            return false
        }
        if birthTextField.text == "" {
            return false
        }
        
        return true
    }
    
    private func convertFullDate(year: String, month: String, day: String) -> String {
        self.selectedYear = year
        let month = self.makeTwoLength(strNum: month)
        let day = self.makeTwoLength(strNum: day)
        self.selectedDate = self.selectedYear + month + day
        return "\(year)년 \(month)월 \(day)일"
    }
    
    private func makeTwoLength(strNum: String) -> String {
        if strNum.count < 2 {
            return "0" + strNum
        } else {
            return strNum
        }
    }
    
    private func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = true
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        return dateFormatter.string(from: Date())
    }
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            profileImageView.image = image
        }
         dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
