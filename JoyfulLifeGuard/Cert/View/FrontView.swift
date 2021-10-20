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
        imageView.image = UIImage(named: "certFront")
        self.addSubview(imageView)
        return imageView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0, weight: .semibold)
        label.textColor = .white
        self.addSubview(label)
        return label
    }()
    
    private lazy var birthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0, weight: .semibold)
        label.textColor = .white
        self.addSubview(label)
        return label
    }()
    
    private lazy var validateDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0, weight: .semibold)
        label.textColor = .white
        self.addSubview(label)
        return label
    }()
    
    private lazy var regiserDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13.0, weight: .regular)
        label.textColor = .black
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
            $0.top.equalToSuperview().offset(267)
            $0.leading.equalToSuperview().offset(120)
        }
        
        self.birthLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(298)
            $0.leading.equalToSuperview().offset(120)
        }
        
        self.validateDate.snp.makeConstraints {
            $0.top.equalToSuperview().offset(330)
            $0.leading.equalToSuperview().offset(120)
        }
        
        self.regiserDateLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-40)
            $0.centerX.equalToSuperview()
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
        self.layer.shadowOffset = CGSize(width: 5, height: 5.0)
        self.layer.shadowOpacity = 0.5
        
        self.profileImageView.clipsToBounds = true
        
        self.flipButton.addTarget(self, action: #selector(flipButtonClicked(_:)), for: .touchUpInside)
    }
    
    public func configure(user: UserModel?) {
        guard let user = user else { return }
        self.profileImageView.image = UIImage(data: user.profile)
        self.nameLabel.text = user.name
        self.birthLabel.text = user.birthDay
        self.validateDate.text = "FOREVER"
        self.regiserDateLabel.text = user.regiserDay
    }
    
    @objc func flipButtonClicked(_ sender: UIButton) {
        delegate?.flipButtonAction()
    }
}
