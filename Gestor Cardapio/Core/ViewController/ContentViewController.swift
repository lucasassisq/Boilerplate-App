import UIKit

protocol NavigationDelegate: AnyObject {
	func leftButtonTap()
}

class ContentViewController: UIViewController {
    weak var delegate: SideMenuDelegate?
	weak var navigationDelegate: NavigationDelegate?
    var barButtonImage: UIImage? = UIImage(systemName: "line.horizontal.3")
	var	leftButtonImage: UIImage? = UIImage(systemName: "chevron.left")
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        let barButtonItem = UIBarButtonItem(image: barButtonImage, style: .plain, target: self, action: #selector(menuTapped))
        barButtonItem.tintColor = .black
        navigationItem.setRightBarButton(barButtonItem, animated: false)
    }

    @objc private func menuTapped() {
        delegate?.menuButtonTapped()		
    }
	
	@objc private func leftButtonTapped() {
		delegate?.leftButtonTapped()
	}
	
	func showLeftButton() {
		
		let leftItem = UIBarButtonItem(image: leftButtonImage,
									   style: .plain,
									   target: self,
									   action: #selector(leftButtonTapped))
		leftItem.tintColor = .black
		navigationItem.setLeftBarButton(leftItem, animated: true)
	}
	
	func hideLeftButton() {
		navigationItem.setLeftBarButton(nil, animated: true)
	}
}
