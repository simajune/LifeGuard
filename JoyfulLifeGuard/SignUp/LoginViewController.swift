import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
    }
    
    private func setProperties() {
        self.signupButton.layer.cornerRadius = 8.0
    }
    
    @IBAction func clickedSignupButton(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let join01VC = mainStoryboard.instantiateViewController(withIdentifier: "Join01ViewController") as? Join01ViewController else { return }
        self.navigationController?.pushViewController(join01VC, animated: true)
    }
    
}
