import Foundation
import UIKit

class Join03ViewController: UIViewController {
    
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
        guard let join04VC = mainStoryboard.instantiateViewController(withIdentifier: "Join04ViewController") as? Join04ViewController,
              let user = self.user else { return }
        join04VC.configure(user: user)
        self.navigationController?.pushViewController(join04VC, animated: true)
    }
}
