struct Product: Codable {
    let id: Int
    let name: String
    let price: Double
    let description: String
    let categoryId: Int
    let imageURL: String?
}