//
//  Join02ViewController.swift
//  JoyfulLifeGuard
//
//  Created by 정태준 on 2021/10/13.
//

import Foundation
import UIKit

class Join02ViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var okButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
    }
    
    private func setProperties() {
        self.okButton.layer.cornerRadius = 8.0
        
//        self.titleLabel.text = "십자가에서 부활하신 예수님께서 승천하시기 전에 마지막으로 제자들에게 지상명령을 주셨습니다.\n가장 중요한 명령은 무엇일까요?"
//        self.titleLabel.textAlignment = .center
//        self.titleLabel.setLineSpacing(with: 8.0)
    }
    
    @IBAction func clickedOkButton(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let join03VC = mainStoryboard.instantiateViewController(withIdentifier: "Join03ViewController") as? Join03ViewController else { return }
        self.navigationController?.pushViewController(join03VC, animated: true)
    }
}
