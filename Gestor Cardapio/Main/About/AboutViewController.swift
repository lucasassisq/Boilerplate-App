import UIKit

final class AboutViewController: ContentViewController {

    public var customView: AboutView {
        return view as! AboutView
    }

    override func loadView() {
        view = AboutView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sobre nós"
        customView.rateButton.addTarget(self, action: #selector(openAppStore), for: .touchUpInside)
        customView.suggestButton.addTarget(self, action: #selector(openEmail), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .red
    }

    @objc func openAppStore() {
        // TODO: - Upload app to appStore
    }

   @objc func openEmail() {
       let email = "suporte@cardapio.ai"
       if let url = URL(string: "mailto:\(email)") {
           UIApplication.shared.open(url)
       }
    }
}
