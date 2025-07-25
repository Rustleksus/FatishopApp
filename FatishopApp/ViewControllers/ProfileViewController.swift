import UIKit

class ProfileViewController: UIViewController {
    var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()

        let loginButton = UIButton(type: .system)
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        loginButton.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        view.addSubview(loginButton)
    }

    @objc func loginTapped() {
        authService.login(username: "user", password: "password") { success in
            if success {
                // Переход в профиль
            } else {
                // Показать ошибку
            }
        }
    }
}