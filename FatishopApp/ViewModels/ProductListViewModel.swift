class ProductListViewModel {
    var products: [Product] = []

    func fetchProducts(completion: @escaping () -> Void) {
    products = [
        Product(
            id: 1,
            name: "iPhone 15",
            price: 999.99,
            description: "Флагман Apple",
            categoryId: 1,
            imageURL: "https://via.placeholder.com/150/0000FF/FFFFFF?text=iPhone"
        ),
        Product(
            id: 2,
            name: "MacBook Pro",
            price: 1999.99,
            description: "Мощный ноутбук Apple",
            categoryId: 2,
            imageURL: "https://via.placeholder.com/150/FF0000/FFFFFF?text=MacBook"
        ),
        Product(
            id: 3,
            name: "Apple Watch",
            price: 399.99,
            description: "Смарт-часы Apple",
            categoryId: 3,
            imageURL: nil // Без картинки — покажется иконка photo
        )
    ]
        completion()
    }
}