import Foundation

class APIService {
    func fetchProducts(completion: @escaping ([Product]) -> Void) {
        // Симуляция запроса продуктов
        completion([
            Product(id: 1, name: "Product 1", price: 100.0, description: "Description 1", categoryId: 1),
            Product(id: 2, name: "Product 2", price: 200.0, description: "Description 2", categoryId: 2)
        ])
    }
}