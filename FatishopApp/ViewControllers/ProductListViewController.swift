override func viewDidLoad() {
    super.viewDidLoad()

    // Настройка SearchBar
    let searchController = UISearchController(searchResultsController: nil)
    searchController.searchResultsUpdater = self
    navigationItem.searchController = searchController
    navigationItem.hidesSearchBarWhenScrolling = false

    // Настройка TableView
    tableView = UITableView(frame: view.bounds, style: .plain)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    view.addSubview(tableView)

    // Запрос продуктов
    viewModel.fetchProducts()
}