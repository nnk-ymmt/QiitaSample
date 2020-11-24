//
//  LoginViewController.swift
//  QiitaSample
//
//  Created by 山本ののか on 2020/11/24.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet private weak var loginButton: UIButton! {
        didSet {
            loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func openURL(_ url: URL) {
        guard let queryItems = URLComponents(string: url.absoluteString)?.queryItems,
            let code = queryItems.first(where: {$0.name == "code"})?.value,
            let state = queryItems.first(where: {$0.name == "state"})?.value,
            state == API.shared.qiitaState else {
            // TODO: エラー処理
            return
        }
        API.shared.postAccessToken(code: code) { accessToken, error  in
            if let error = error {
                // TODO: エラー処理
                return
            }
            guard let accessToken = accessToken,
                  let vc = UIStoryboard.init(name: "Items", bundle: nil).instantiateInitialViewController() else {
                // TODO: エラー処理
                return
            }
            UserDefaults.standard.qiitaAccessToken = accessToken.token
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

private extension LoginViewController {
    @objc func login() {
        UIApplication.shared.open(API.shared.oAuthURL, options: [:], completionHandler: nil)
    }
}
