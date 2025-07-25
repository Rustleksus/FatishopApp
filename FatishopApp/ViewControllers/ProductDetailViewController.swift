import UIKit

class ProductDetailViewController: UIViewController {

    var product: Product!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = product.name

        let label = UILabel()
        label.text = "\(product.name)\n\n\(product.description)\n\nЦена: \(product.price) ₽"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}