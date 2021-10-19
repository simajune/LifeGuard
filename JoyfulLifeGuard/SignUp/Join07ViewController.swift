//
//  Join07ViewController.swift
//  JoyfulLifeGuard
//
//  Created by 정태준 on 2021/10/13.
//

import Foundation
import UIKit

class Join07ViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var okButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
    }
    
    private func setProperties() {
        self.okButton.layer.cornerRadius = 8.0
        
//        self.titleLabel.text = "축하합니다! 하나님 나라의 라이프가드 자격증이 발급되었습니다.이제 마음껏 복음을 전하세요! 성령 충만을 구하세요! 주님이 성령 충만으로 우리와 함께 하십니다!"
//        self.titleLabel.textAlignment = .center
//        self.titleLabel.setLineSpacing(with: 8)
    }
    
    @IBAction func clickedOkButton(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let certVC = mainStoryboard.instantiateViewController(withIdentifier: "CertViewController") as? CertViewController else { return }
        self.navigationController?.pushViewController(certVC, animated: true)
        
        
    }
}
