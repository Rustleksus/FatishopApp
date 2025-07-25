import Foundation

class AuthService {
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        // Симуляция процесса логина
        completion(true)
    }

    func logout() {
        // Логаут
    }
}