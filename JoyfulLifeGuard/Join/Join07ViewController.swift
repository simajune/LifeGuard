import Foundation
import UIKit

class Join07ViewController: UIViewController {
    
    @IBOutlet private weak var okButton: UIButton!

    // MARK: - Properties
    private var user: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
    }
    
    private func setProperties() {
        self.okButton.layer.cornerRadius = 8.0
    }
    
    public func configure(user: UserModel) {
        self.user = user
    }
    
    private func saveUserData(user: UserModel) {
        let userDefaults = UserDefaults.standard
        do {
            try userDefaults.setObject(user, forKey: "user")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func clickedOkButton(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let certVC = mainStoryboard.instantiateViewController(withIdentifier: "CertViewController") as? CertViewController,
              let user = self.user else { return }
        saveUserData(user: user)
        certVC.modalPresentationStyle = .fullScreen
        self.present(certVC, animated: true, completion: nil)
    }
}
