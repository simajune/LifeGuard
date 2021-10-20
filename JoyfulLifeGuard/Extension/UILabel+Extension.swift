import UIKit

public extension UILabel {
    func setLineSpacing(with spacing: CGFloat) {
        guard let text = self.text else {
            return
        }
        let attrString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attrString.length))
        self.attributedText = attrString
    }
    
    func setFontToRegular(ofSize: CGFloat) {
        font = .systemFont(ofSize: ofSize)
    }
}
