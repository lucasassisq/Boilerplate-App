import UIKit
import WebKit

final class StartView: UIView {

    var useUdid = false
	
	lazy var webView: WKWebView = {
        var tokenApp = ""
        if let token = UserDefaults.standard.data(forKey: "tokenNotifications") {
            if let decoded = try? JSONDecoder().decode(String.self, from: token) {
                tokenApp = decoded
            }
        }
        if tokenApp != "" {
            let udid = UIDevice.current.identifierForVendor?.uuidString ?? ""
            if let link = URL(string:"https://staging.cardapio.ai/gestor?udid=\(udid)&token=\(tokenApp)") {
                var request = URLRequest(url: link)
                request.cachePolicy = .useProtocolCachePolicy
                $0.load(request)
            }
        } else {
            let udid = UIDevice.current.identifierForVendor?.uuidString ?? ""
            if let link = URL(string:"https://staging.cardapio.ai/gestor?udid=\(udid)") {
                useUdid = true
                var request = URLRequest(url: link)
                request.cachePolicy = .useProtocolCachePolicy
                $0.load(request)
            }
        }
        $0.allowsLinkPreview = false
		$0.configuration.preferences.javaScriptEnabled = true
		return $0
	}(WKWebView())
	
	let progressView = UIProgressView(progressViewStyle: .default)
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		addComponents()
		webViewConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Extension

extension StartView {
	
	// MARK: - Private methods
	
	private func addComponents() {
		addSubview(webView, constraints: true)
	}
	
	private func webViewConstraints() {
		webView.applyAnchors(ofType: [.top, .leading, .trailing, .bottom], to: self)
	}
	
	// MARK: - Internal methods
	
	func setupProgressView(navigationBar: UINavigationBar) {
	 
	 progressView.translatesAutoresizingMaskIntoConstraints = false
	 navigationBar.addSubview(progressView)

	 progressView.isHidden = true

	 NSLayoutConstraint.activate([
		 progressView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor),
		 progressView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor),

		 progressView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor),
		 progressView.heightAnchor.constraint(equalToConstant: 2.0)
	 ])
 }
	
}
