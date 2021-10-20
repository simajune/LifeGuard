import Foundation
import UIKit

class Join06ViewController: UIViewController {
    
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
    
    @IBAction func clickedOkButton(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let join07VC = mainStoryboard.instantiateViewController(withIdentifier: "Join07ViewController") as? Join07ViewController,
              let user = self.user else { return }
        join07VC.configure(user: user)
        self.navigationController?.pushViewController(join07VC, animated: true)
    }
}
