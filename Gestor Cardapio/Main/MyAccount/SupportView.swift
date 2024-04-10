import UIKit

final class SupportView: UIView {

    // MARK: - Properties

    private var imageHead: UIImageView = {
        $0.image = UIImage(named: "support-icon-screen")
        return $0
    }(UIImageView())

    private var titleLabel: UILabel = {
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 20)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.attributedText = NSMutableAttributedString(string: "Precisa de ajuda? Contate-nos", attributes: [NSAttributedString.Key.kern: 0.38, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return $0
    }(UILabel())

    private var descriptionLabel: UILabel = {
        $0.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        $0.font = UIFont(name: "SFProText-Regular", size: 17)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08

        // Line height: 22 pt
        $0.attributedText = NSMutableAttributedString(string: "Estamos aqui para te ajudar com qualquer dúvida. Descreva o que precisa que nossos colaboradores retornarão o contato.", attributes: [NSAttributedString.Key.kern: -0.41, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        $0.textAlignment = .center

        return $0
    }(UILabel())

    var contactButton: UIButton = {
        $0.layer.backgroundColor = UIColor(red: 0.145, green: 0.827, blue: 0.4, alpha: 1).cgColor
        $0.layer.cornerRadius = 6
        $0.setImage(UIImage(named: "whatsapp-icon"), for: .normal)
        $0.tintColor = UIColor.white
        $0.setTitle("Entrar em contato", for: .normal)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 0.0)
        $0.contentHorizontalAlignment = .center
        return $0
    }(UIButton(type: .roundedRect))


    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        addComponents()
        setImageConstraints()
        setTitleConstraints()
        setDescriptionConstraints()
        setButtonConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension SupportView {

    // MARK: - Private methods

    func addComponents() {
        addSubviews([imageHead,
                     titleLabel,
                     descriptionLabel,
                     contactButton], constraints: true)
    }

    func setImageConstraints() {
        imageHead.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        imageHead.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        imageHead.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        imageHead.height(size: 208)

    }

    func setTitleConstraints() {
        titleLabel.topAnchor.constraint(equalTo: imageHead.bottomAnchor, constant: 32.0).isActive = true
        titleLabel.centerX(to: self)
    }

    func setDescriptionConstraints() {
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0).isActive = true
        descriptionLabel.centerX(to: self)
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0).isActive = true
    }

    func setButtonConstraints() {
        contactButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32.0).isActive = true
        contactButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0).isActive = true
        contactButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0).isActive = true

        contactButton.height(size: 40.0)
    }
}
