import UIKit

final class MainCoordinator: Coordinator {
	
	var children: [Coordinator] = []
	var navigationController: UINavigationController
	var parent: Coordinator?
    var userDefaults: UserDefaults?

	public init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
		
	func start() { }
	
	static func makeContainer() -> ContainerViewController {
        verifyUserDefaults()
		let startViewController = StartViewController()
		let settingsViewController = SettingsViewController()
		let aboutViewController = AboutViewController()
		let supportViewController = SupportViewController()
		let sideMenuItems = [
			SideMenuItem(icon: UIImage(named: "stores-icon"),
						 name: "Lojas",
						 viewController: .embed(startViewController)),
			SideMenuItem(icon: UIImage(named: "settings-icon"),
						 name: "Preferências",
						 viewController: .push(settingsViewController)),
			SideMenuItem(icon: UIImage(named: "support-icon"),
						 name: "Suporte",
						 viewController: .push(supportViewController)),
			SideMenuItem(icon: UIImage(named: "about-icon"),
						 name: "Sobre o Cardapio.ai",
						 viewController: .embed(aboutViewController)),

            SideMenuItem(icon: UIImage(named: "sell-with-us-icon"),
                         name: "Venda conosco sem taxas",
                         viewController: .push(supportViewController))
		]
		let sideMenuViewController = SideMenuViewController(sideMenuItems: sideMenuItems)
		let container = ContainerViewController(sideMenuViewController: sideMenuViewController,
												rootViewController: startViewController)

		return container
	}

    static func verifyUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: "notificationsSettings") {
                print("has user defaults\(data)")
        } else {
            print("isn't user defaults, we need to save true")
            if let encoded = try? JSONEncoder().encode(true) {
                UserDefaults.standard.set(encoded, forKey: "notificationsSettings")
            }
        }
    }

}
