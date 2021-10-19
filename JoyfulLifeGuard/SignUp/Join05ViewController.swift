//
//  Join05ViewController.swift
//  JoyfulLifeGuard
//
//  Created by 정태준 on 2021/10/13.
//

import Foundation
import UIKit

class Join05ViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var okButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
    }
    
    private func setProperties() {
        self.okButton.layer.cornerRadius = 8.0
        
//        self.titleLabel.text = "당신은 영혼을 살리는 하나님의 라이프가드로 부름 받았습니다. 동의하십니까?"
//        self.titleLabel.textAlignment = .center
//        self.titleLabel.setLineSpacing(with: 8.0)
    }
    
    @IBAction func clickedOkButton(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let join06VC = mainStoryboard.instantiateViewController(withIdentifier: "Join06ViewController") as? Join06ViewController else { return }
        self.navigationController?.pushViewController(join06VC, animated: true)
    }
}
