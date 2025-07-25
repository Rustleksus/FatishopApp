import UIKit

class CartViewController: UIViewController {
    var viewModel: CartViewModel!
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)

        viewModel.cartItems = [CartItem(product: Product(id: 1, name: "Test Product", price: 100.0, description: "Test", categoryId: 1), quantity: 2)]
    }
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cartItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cartItem = viewModel.cartItems[indexPath.row]
        cell.textLabel?.text = "\(cartItem.product.name) x \(cartItem.quantity)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Изменить количество или удалить товар из корзины
    }
}