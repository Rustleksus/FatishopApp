import UIKit

class ProductTableViewCell: UITableViewCell {
    static let identifier = "ProductTableViewCell"

    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let detailButton = UIButton(type: .system)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        nameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        priceLabel.font = .systemFont(ofSize: 14)
        detailButton.setTitle("Подробнее", for: .normal)

        let stack = UIStackView(arrangedSubviews: [nameLabel, priceLabel, detailButton])
        stack.axis = .vertical
        stack.spacing = 4

        contentView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }

    func configure(with product: Product) {
        nameLabel.text = product.name
        priceLabel.text = "Цена: \(product.price) ₽"
    }
}