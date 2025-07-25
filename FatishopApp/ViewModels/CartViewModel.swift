import Foundation

class CartViewModel {
    var cartItems: [CartItem] = []

    func addToCart(product: Product) {
        // Добавить товар в корзину
    }

    func removeFromCart(productId: Int) {
        // Удалить товар из корзины
    }

    func calculateTotal() -> Double {
        return cartItems.reduce(0) { $0 + $1.product.price * Double($1.quantity) }
    }
}