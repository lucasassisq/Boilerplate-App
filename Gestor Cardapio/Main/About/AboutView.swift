// MARK: - Class

import UIKit

final class AboutView: UIView {

    // MARK: - Internal properties

    let imageLogo: UIImageView = {
        $0.image = UIImage(named: "cardapio-logo")
        $0.width(size: 198)
        $0.height(size: 36)
        return $0
    }(UIImageView())

    let versionLabel: UILabel = {
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 20)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05

        // Line height: 25 pt
        // (identical to box height)

        $0.textAlignment = .center
        $0.attributedText = NSMutableAttributedString(string: "Versão 1.0.0", attributes: [NSAttributedString.Key.kern: 0.38, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return $0
    }(UILabel())

    let descriptionLabel: UILabel = {
        $0.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        $0.font = UIFont(name: "SFProText-Regular", size: 17)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08

        // Line height: 22 pt
        $0.attributedText = NSMutableAttributedString(string: "Copyright © 2022 — No Mercado Representacoes LTDA - CNPJ 32.382.845/0001-85", attributes: [NSAttributedString.Key.kern: -0.41, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        $0.textAlignment = .center

        return $0
    }(UILabel())

    let rateButton: UIButton = {
        $0.layer.backgroundColor = UIColor(red: 0.894, green: 0, blue: 0.169, alpha: 1).cgColor
        $0.layer.cornerRadius = 6
        $0.setTitle("Nos avalie na AppStore", for: .normal)
        return $0
    }(UIButton())

    let suggestButton: UIButton = {
        $0.setTitle("Sugestões", for: .normal)
        $0.setTitleColor(UIColor.red, for: .normal)
        return $0
    }(UIButton())


    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        addComponents()
        setImageConstraints()
        setVersionConstraints()
        setDescriptionConstraints()
        setSuggestConstraints()
        setRateConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Extension

extension AboutView {

    // MARK: - Internal methods

    func addComponents() {
        addSubviews([
            imageLogo,
            versionLabel,
            descriptionLabel,
            rateButton,
            suggestButton], constraints: true)
    }

    func setImageConstraints() {
        NSLayoutConstraint.activate([
            imageLogo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            imageLogo.centerX(to: self)
        ])
    }

    func setVersionConstraints() {
        NSLayoutConstraint.activate([
            versionLabel.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 80),
            versionLabel.centerX(to: self)
        ])
    }

    func setDescriptionConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 16.0),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            descriptionLabel.centerX(to: self)
        ])
    }


    func setSuggestConstraints() {
        NSLayoutConstraint.activate([
            suggestButton.centerX(to: self),
            suggestButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 76.0),
            suggestButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -88.0),
            suggestButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -36.0)
        ])
    }

    func setRateConstraints(){
        NSLayoutConstraint.activate([
            rateButton.bottomAnchor.constraint(equalTo: suggestButton.topAnchor, constant: -25),
            rateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 76.0),
            rateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -88.0)
        ])
    }

}
