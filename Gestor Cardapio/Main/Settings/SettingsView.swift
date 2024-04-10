// MARK: - Class

import UIKit

final class SettingsView: UIView {

    // MARK: - Properties

    lazy var nottView: UIView = {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 14
        $0.addSubviews([nottImage,
                       nottLabel,
                       nottSwitch], constraints: true)
        return $0
    }(UIView())

    let nottImage: UIImageView = {
        $0.image = UIImage(named: "notifications-icon")
        $0.height(size: 30.0)
        $0.width(size: 30.0)
        return $0
    }(UIImageView())

    let nottLabel: UILabel = {
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        $0.font = UIFont(name: "SFProText-Regular", size: 17)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08

        // Line height: 22 pt
        // (identical to box height)

        $0.attributedText = NSMutableAttributedString(string: "Notificações", attributes: [NSAttributedString.Key.kern: -0.41, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return $0
    }(UILabel())

    let nottSwitch: UISwitch = {
        $0.isOn = true
        return $0
    }(UISwitch())


    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: .zero)
        addComponents()
        setNottViewConstraints()
        setImageConstraints()
        setLabelConstraints()
        setSwitchConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension SettingsView {

    // MARK: - Internal methods


    func addComponents() {
        addSubview(nottView, constraints: true)
    }

    func setNottViewConstraints() {
        nottView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24.0).isActive = true
        nottView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0).isActive = true
        nottView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0).isActive = true
    }

    func setImageConstraints() {
        nottImage.topAnchor.constraint(equalTo: nottView.topAnchor, constant: 8.0).isActive = true
        nottImage.leadingAnchor.constraint(equalTo: nottView.leadingAnchor, constant: 16.0).isActive = true
    }

    func setLabelConstraints() {
        nottLabel.centerY(to: nottImage)
        NSLayoutConstraint.activate([
            nottLabel.leadingAnchor.constraint(equalTo: nottImage.trailingAnchor, constant: 16.0)
        ])
    }

    func setSwitchConstraints() {
        NSLayoutConstraint.activate([
            nottSwitch.topAnchor.constraint(equalTo: nottView.topAnchor, constant: 6.5),
            nottSwitch.trailingAnchor.constraint(equalTo: nottView.trailingAnchor, constant: -16.0),
            nottSwitch.bottomAnchor.constraint(equalTo: nottView.bottomAnchor, constant: -6.5)
        ])
    }
}


