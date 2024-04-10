import UIKit

final class SettingsViewController: ContentViewController {

    var userDefaults: UserDefaults?

    public var customView: SettingsView {
        return view as! SettingsView
    }

    override func loadView() {
        view = SettingsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Preferencias"
        view.layer.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.969, alpha: 1).cgColor
        customView.nottSwitch.addTarget(self, action: #selector(save), for: .valueChanged)
        load()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .red
    }
}

// MARK: - Extension

extension SettingsViewController {

    // MARK: - Internal methods

    @objc func save() {
        let toggle = customView.nottSwitch.isOn
        let app = UIApplication.shared        
        if toggle {
            app.registerForRemoteNotifications()
        } else {
            app.unregisterForRemoteNotifications()
        }
        if let encoded = try? JSONEncoder().encode(toggle) {
            UserDefaults.standard.set(encoded, forKey: "notificationsSettings")
        }
    }

    func load() {
        if let data = UserDefaults.standard.data(forKey: "notificationsSettings") {
            if let decoded = try? JSONDecoder().decode(Bool.self, from: data) {
                customView.nottSwitch.isOn = decoded
            }
        }

        if let token = UserDefaults.standard.data(forKey: "tokenNotifications") {
            print("has token")
            if let decoded = try? JSONDecoder().decode(String.self, from: token) {
                print("decoded token: \(decoded)")                
            }
        }
    }
}
