//
//  Join04ViewController.swift
//  JoyfulLifeGuard
//
//  Created by 정태준 on 2021/10/13.
//

import Foundation
import UIKit

class Join04ViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var okButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
    }
    
    private func setProperties() {
        self.okButton.layer.cornerRadius = 8.0
    
//        self.titleLabel.text = "모든 민족을 구원하여 제자삼기 원하시는 주님은 우리만 보내지 않으십니다. 세상 끝날까지 우리와 함께 하신다고 말씀하십니다. 나를 살리신 하나님의 구원 받지 못한 영혼을 향한 간절한 마음을 나도 품는 것이 시작입니다.\n시작하시겠습니까?"
//        self.titleLabel.textAlignment = .center
//        self.titleLabel.setLineSpacing(with: 8.0)
    }
    
    @IBAction func clickedOkButton(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let join05VC = mainStoryboard.instantiateViewController(withIdentifier: "Join05ViewController") as? Join05ViewController else { return }
        self.navigationController?.pushViewController(join05VC, animated: true)
    }
}
