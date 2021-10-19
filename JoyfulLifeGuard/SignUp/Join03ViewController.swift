//
//  Join03ViewController.swift
//  JoyfulLifeGuard
//
//  Created by 정태준 on 2021/10/13.
//

import Foundation
import UIKit

class Join03ViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var okButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
    }
    
    private func setProperties() {
        self.okButton.layer.cornerRadius = 8.0
        
//        self.titleLabel.text = "그러므로 너희는 가서 모든 민족을 제자로 삼아 아버지와 아들과 성령의 이름으로 세례를 베풀고, 내가 너희에게 분부한 모든 것을 가르쳐 지키게 하라. 볼지어다, 내가 세상 끝날까지 너희와 항상 함께 있으리라 하시니라.\n(마태복음 28장 19-20절)"
//        self.titleLabel.textAlignment = .center
//        self.titleLabel.setLineSpacing(with: 8.0)
    }
    
    @IBAction func clickedOkButton(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let join04VC = mainStoryboard.instantiateViewController(withIdentifier: "Join04ViewController") as? Join04ViewController else { return }
        self.navigationController?.pushViewController(join04VC, animated: true)
    }
}
