import UIKit

open class BaseViewController<View: UIView>: UIViewController {
	
	public var customView: View {
		return view as! View
	}
	
	open override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	public init() {
		super.init(nibName: nil, bundle: nil)
	}
	
	@available(*, unavailable)
	required public init?(coder _: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public override func loadView() {
		view = View()
	}
}
