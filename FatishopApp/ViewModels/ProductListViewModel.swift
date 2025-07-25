class ProductListViewModel {
    var products: [Product] = []

    func fetchProducts(completion: @escaping () -> Void) {
        self.products = [
            Product(id: 1, name: "Айфон 15", price: 999.99, description: "Флагман Apple", categoryId: 1),
            Product(id: 2, name: "MacBook Pro", price: 1999.99, description: "Мощный ноутбук", categoryId: 2),
            Product(id: 3, name: "Apple Watch", price: 399.99, description: "Смарт-часы", categoryId: 3)
        ]
        completion()
    }
}