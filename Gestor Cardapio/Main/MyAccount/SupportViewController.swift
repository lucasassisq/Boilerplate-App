import UIKit

final class SupportViewController: ContentViewController {


    public var customView: SupportView {
        return view as! SupportView
    }

    override func loadView() {
        view = SupportView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Suporte"
        customView.contactButton.addTarget(self, action: #selector(setClicks), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .red
    }

    @objc func setClicks() {
        let phoneNumber = "+5531991206478"
        let shareableMessageText = "Mensagem de teste"

        let whatsApp = "https://wa.me/\(phoneNumber)/?text=\(shareableMessageText)"

        if let urlString = whatsApp.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            if let whatsappURL = NSURL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL as URL) {
                    UIApplication.shared.open(URL(string: "\(whatsappURL)")!)
                } else {
                    print("error")
                }
            }
        }
    }
}
