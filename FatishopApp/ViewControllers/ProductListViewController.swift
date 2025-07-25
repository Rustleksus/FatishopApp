import UIKit

class ProductListViewController: UIViewController {

    var tableView: UITableView!
    var viewModel = ProductListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Товары"
        view.backgroundColor = .systemBackground
        setupTableView()
        loadProducts()
    }

    private func setupTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .singleLine
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    private func loadProducts() {
        viewModel.fetchProducts { [weak self] in
            guard let self = self else { return }

            if self.viewModel.products.isEmpty {
                let emptyLabel = UILabel()
                emptyLabel.text = "Нет товаров"
                emptyLabel.textAlignment = .center
                emptyLabel.textColor = .secondaryLabel
                emptyLabel.font = .systemFont(ofSize: 18)
                emptyLabel.frame = self.tableView.bounds
                self.tableView.backgroundView = emptyLabel
            } else {
                self.tableView.backgroundView = nil
            }

            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension ProductListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }

        let product = viewModel.products[indexPath.row]
        cell.configure(with: product)
        cell.detailButton.tag = indexPath.row
        cell.detailButton.addTarget(self, action: #selector(detailTapped(_:)), for: .touchUpInside)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Снимаем выделение без перехода
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @objc func detailTapped(_ sender: UIButton) {
        let index = sender.tag
        let product = viewModel.products[index]
        let detailVC = ProductDetailViewController()
        detailVC.product = product
        navigationController?.pushViewController(detailVC, animated: true)
    }
}