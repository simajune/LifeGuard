import Foundation
import UIKit

protocol BackViewDelegate: AnyObject {
    func flipButtonAction()
}

class BackView: UIView {
    
    // MARK: - UI Components
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "certBack")
        self.addSubview(imageView)
        return imageView
    }()
    
    private lazy var flipButton: UIButton = {
        let button = UIButton()
        self.addSubview(button)
        return button
    }()
    
    // MARK: - Properties
    weak var delegate: FrontViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
        setProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BackView {
    private func layout() {
        self.backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.flipButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setProperties() {
        self.backgroundColor = .clear
        
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        self.layer.shadowOpacity = 0.5
        
        self.flipButton.addTarget(self, action: #selector(flipButtonClicked(_:)), for: .touchUpInside)
    }
    
    @objc func flipButtonClicked(_ sender: UIButton) {
        delegate?.flipButtonAction()
    }
}
