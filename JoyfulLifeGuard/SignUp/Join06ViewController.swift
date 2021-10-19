//
//  Join06ViewController.swift
//  JoyfulLifeGuard
//
//  Created by 정태준 on 2021/10/13.
//

import Foundation
import UIKit

class Join06ViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var okButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
    }
    
    private func setProperties() {
        self.okButton.layer.cornerRadius = 8.0
        
//        self.titleLabel.text = "하나님의 말씀에 순종하며 영혼 구원의 사명을 감당하는 라이프가드의 삶을 살아가시겠습니까?"
//        self.titleLabel.textAlignment = .center
//        self.titleLabel.setLineSpacing(with: 8.0)
    }
    
    @IBAction func clickedOkButton(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let join07VC = mainStoryboard.instantiateViewController(withIdentifier: "Join07ViewController") as? Join07ViewController else { return }
        self.navigationController?.pushViewController(join07VC, animated: true)
    }
}
