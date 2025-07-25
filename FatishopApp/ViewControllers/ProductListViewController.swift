import UIKit

class ProductListViewController: UIViewController {

    var tableView: UITableView!
    var viewModel = ProductListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Товары"
        view.backgroundColor = .systemBackground
        setupTableView()

        viewModel.fetchProducts { [weak self] in
            self?.tableView.reloadData()
        }
    }

    private func setupTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

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

    @objc func detailTapped(_ sender: UIButton) {
        let product = viewModel.products[sender.tag]
        let detailVC = ProductDetailViewController()
        detailVC.product = product
        navigationController?.pushViewController(detailVC, animated: true)
    }
}