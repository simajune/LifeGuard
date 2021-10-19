import Foundation
import UIKit
import SnapKit

protocol FrontViewDelegate: AnyObject {
    func flipButtonAction()
}

class FrontView: UIView {
    
    // MARK: - UI Components
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Front")
        self.addSubview(imageView)
        return imageView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "SampleProfile")
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13.0, weight: .bold)
        label.textColor = .white
        label.text = "정태준"
        self.addSubview(label)
        return label
    }()
    
    private lazy var birthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13.0, weight: .bold)
        label.textColor = .white
        label.text = "1987.05.07"
        self.addSubview(label)
        return label
    }()
    
    private lazy var validateDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13.0, weight: .bold)
        label.textColor = .white
        label.text = "2021.10.24 ~ FOREVER"
        self.addSubview(label)
        return label
    }()
    
    private lazy var regiserDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13.0, weight: .regular)
        label.textColor = .black
        label.text = "2021.10.24"
        self.addSubview(label)
        return label
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
        
        self.isUserInteractionEnabled = true
        layout()
        
        setProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FrontView {
    private func layout() {
        self.backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.profileImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(90.0)
            $0.width.equalTo(120)
            $0.height.equalTo(150)
        }
        
        self.nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(268.5)
            $0.leading.equalToSuperview().offset(105)
        }
        
        self.birthLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(299.5)
            $0.leading.equalToSuperview().offset(105)
        }
        
        self.validateDate.snp.makeConstraints {
            $0.top.equalToSuperview().offset(330.5)
            $0.leading.equalToSuperview().offset(105)
        }
        
        self.regiserDateLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-50)
            $0.centerX.equalToSuperview()
        }
        
        self.flipButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setProperties() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 10        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 5, height: 5.0)
        self.layer.shadowOpacity = 0.5
        
        self.profileImageView.clipsToBounds = true
        
        self.flipButton.addTarget(self, action: #selector(flipButtonClicked(_:)), for: .touchUpInside)
    }
    
    public func configure() {
        
    }
    
    @objc func flipButtonClicked(_ sender: UIButton) {
        delegate?.flipButtonAction()
    }
}
