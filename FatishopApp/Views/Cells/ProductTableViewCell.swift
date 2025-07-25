import UIKit

class ProductTableViewCell: UITableViewCell {
    static let identifier = "ProductTableViewCell"

    // MARK: - UI элементы
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 2
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()

    let detailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Подробнее", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    // MARK: - Инициализация
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Разметка
    private func setupLayout() {
        contentView.addSubview(productImageView)

        let textStack = UIStackView(arrangedSubviews: [nameLabel, priceLabel, detailButton])
        textStack.axis = .vertical
        textStack.spacing = 4
        textStack.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(textStack)

        NSLayoutConstraint.activate([
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            productImageView.widthAnchor.constraint(equalToConstant: 80),
            productImageView.heightAnchor.constraint(equalToConstant: 80),

            textStack.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 12),
            textStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }

    // MARK: - Заполнение ячейки
func configure(with product: Product) {
    nameLabel.text = product.name
    priceLabel.text = "Цена: \(product.price) ₽"

    if let imageURLString = product.imageURL, let url = URL(string: imageURLString) {
        loadImage(from: url)
    } else {
        // Заглушка, если нет картинки
        productImageView.image = UIImage(systemName: "photo")
    }
}

    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.productImageView.image = image
            }
        }.resume()
    }
}