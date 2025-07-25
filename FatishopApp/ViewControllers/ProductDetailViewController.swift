import UIKit

class ProductDetailViewController: UIViewController {

    var product: Product!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        let label = UILabel()
        label.text = product.name
        label.frame = CGRect(x: 20, y: 100, width: 300, height: 40)
        view.addSubview(label)

        // Отображаем другие данные, такие как описание и цена
    }
}