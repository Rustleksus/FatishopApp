import UIKit

class ProductListViewController: UIViewController {

    var tableView: UITableView!
    var segmentedControl: UISegmentedControl!
    var viewModel = ProductListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Товары"
        view.backgroundColor = .systemBackground
        setupSegmentedControl()
        setupTableView()
        loadProducts()
    }

    private func setupSegmentedControl() {
        let categories = viewModel.categories.map { $0.name }
        segmentedControl = UISegmentedControl(items: categories)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(categoryChanged), for: .valueChanged)

        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)

        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

    private func setupTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 12),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    private func loadProducts() {
        viewModel.fetchProducts {
            self.tableView.reloadData()
        }
    }

    @objc private func categoryChanged() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ProductListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let selectedCategoryId = viewModel.categories[segmentedControl.selectedSegmentIndex].id
        return viewModel.products.filter { $0.categoryId == selectedCategoryId }.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }

        let selectedCategoryId = viewModel.categories[segmentedControl.selectedSegmentIndex].id
        let filteredProducts = viewModel.products.filter { $0.categoryId == selectedCategoryId }
        let product = filteredProducts[indexPath.row]

        cell.configure(with: product)
        cell.detailButton.tag = indexPath.row
        cell.detailButton.addTarget(self, action: #selector(detailTapped(_:)), for: .touchUpInside)
        return cell
    }

    @objc func detailTapped(_ sender: UIButton) {
        let selectedCategoryId = viewModel.categories[segmentedControl.selectedSegmentIndex].id
        let filteredProducts = viewModel.products.filter { $0.categoryId == selectedCategoryId }
        let product = filteredProducts[sender.tag]

        let detailVC = ProductDetailViewController()
        detailVC.product = product
        navigationController?.pushViewController(detailVC, animated: true)
    }
}