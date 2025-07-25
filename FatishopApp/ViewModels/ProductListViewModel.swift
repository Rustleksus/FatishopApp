import Foundation

class ProductListViewModel {
    var products: [Product] = []

    func fetchProducts() {
        // Симуляция запроса данных
        self.products = [
            Product(id: 1, name: "Товар 1", price: 100.0, description: "Описание товара 1", categoryId: 1),
            Product(id: 2, name: "Товар 2", price: 200.0, description: "Описание товара 2", categoryId: 2)
        ]
    }
}