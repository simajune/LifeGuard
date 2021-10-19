//
//  Join01ViewController.swift
//  JoyfulLifeGuard
//
//  Created by 정태준 on 2021/10/13.
//

import Foundation
import UIKit

class Join01ViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
    }
    
    private func setProperties() {
        self.okButton.layer.cornerRadius = 8.0
        
//        self.titleLabel.text = "우리는 지난 한 주간 구원받은 우리가 어떻게 살아가야 할지 생각해 보았습니다. 그렇다면, 하나님은 우리가 어떻게 살아가기를 원하실까요? 알고 싶다면 버튼을 눌러주세요."
//        self.titleLabel.textAlignment = .center
//        self.titleLabel.setLineSpacing(with: 8)
    }
    
    @IBAction func clickedOkButton(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let join02VC = mainStoryboard.instantiateViewController(withIdentifier: "Join02ViewController") as? Join02ViewController else { return }
        self.navigationController?.pushViewController(join02VC, animated: true)
    }
}
