import Foundation
import UIKit
import SnapKit

final class CertViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var frontView: FrontView = {
        let frontView = FrontView()
        frontView.delegate = self
        self.view.addSubview(frontView)
        return frontView
    }()
    
    private lazy var backView: BackView = {
        let backView = BackView()
        backView.isHidden = true
        backView.delegate = self
        self.view.addSubview(backView)
        return backView
    }()

    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
//        perform(#selector(flip), with: nil, afterDelay: 2)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    @objc func flip() {
        let transitionOptions: UIView.AnimationOptions = .transitionFlipFromLeft
        if !frontView.isHidden {
            UIView.transition(with: frontView, duration: 0.5, options: transitionOptions, animations: nil) { isFinished in
                if isFinished {
                    self.frontView.isHidden = true
                    self.backView.isHidden = false
                    self.view.bringSubviewToFront(self.frontView)
                }
            }
            UIView.transition(with: backView, duration: 0.5, options: transitionOptions, animations: {
                self.backView.isHidden = false
            })
        } else {

            UIView.transition(with: backView, duration: 0.5, options: transitionOptions, animations: nil) { isFinished in
                if isFinished {
                    self.frontView.isHidden = false
                    self.backView.isHidden = true
                    self.view.bringSubviewToFront(self.backView)
                }
            }
            UIView.transition(with: frontView, duration: 0.5, options: transitionOptions, animations: {
                self.frontView.isHidden = false
            })
        }
        
    }
}

extension CertViewController {
    private func layout() {
        self.frontView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(300.0)
            $0.height.equalTo(525.0)
//            $0.edges.equalToSuperview()
        }
        
        self.backView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(300.0)
            $0.height.equalTo(525.0)
//            $0.edges.equalToSuperview()
        }
    }
}


extension CertViewController: FrontViewDelegate, BackViewDelegate {
    func flipButtonAction() {
        self.flip()
    }
}
