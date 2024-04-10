import UIKit
import WebKit

class StartViewController: ContentViewController {
	
	private var estimatedProgressObserver: NSKeyValueObservation?
	let url = URL(string: "https://cardapio.ai/gestor")!
	
	public var customView: StartView {
		return view as! StartView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		guard let navigationBar = navigationController?.navigationBar else { return }
		navigationDelegate = self
		customView.setupProgressView(navigationBar: navigationBar)
		setupEstimatedProgressObserver()
		customView.webView.navigationDelegate = self
		customView.webView.uiDelegate = self
		navigationController?.navigationItem.setLeftBarButton(nil, animated: true)
        if customView.useUdid {
            print("useUdid deu true") 
        }
	}
	
	override func loadView() {
		view = StartView()
	}
	
	private func setupEstimatedProgressObserver() {
		estimatedProgressObserver = customView.webView.observe(\.estimatedProgress, options: [.new]) { [weak self] webView, _ in
			guard let self = self else { return }
			self.customView.progressView.progress = Float(self.customView.webView.estimatedProgress)
		}
	}
}

extension StartViewController: WKNavigationDelegate, WKUIDelegate {
	
	func webView(_ webView: WKWebView, didStartProvisionalNavigation _: WKNavigation!) {
		
		if let url = webView.url?.absoluteString{
			print("url = \(url)")
			if url.contains("https://cardapio.ai/online/") {
				showLeftButton()
			} else {
				hideLeftButton()
			}
		}
		if customView.progressView.isHidden {
			customView.progressView.isHidden = false
		}
		
		UIView.animate(withDuration: 0.33,
					   animations: {
			self.customView.progressView.alpha = 1.0
		})
	}
	
	func webView(_: WKWebView, didFinish _: WKNavigation!) {
		UIView.animate(withDuration: 0.33,
					   animations: {
			self.customView.progressView.alpha = 0.0
		},
					   completion: { isFinished in
			self.customView.progressView.isHidden = isFinished
		})
	}
	
	func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
		customView.webView.loadDiskCookies(for: url.host!){
			decisionHandler(.allow)
		}
	}
	
	public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
		webView.writeDiskCookies(for: url.host!){
			decisionHandler(.allow)
		}
	}
}

extension StartViewController: NavigationDelegate {
	func leftButtonTap() {
		if customView.webView.canGoBack {
			customView.webView.goBack()
		}
	}
}
