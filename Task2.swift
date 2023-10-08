// პროდუქტის კლასის შექმნა
class Product {
    var productID: Int
    var name: String
    var price: Double

    init(productID: Int, name: String, price: Double) {
        self.productID = productID
        self.name = name
        self.price = price
    }
}

// სავაჭრო კარტის კლასის შექმნა
class Cart {
    var cartID: Int
    var items: [Product]

    init(cartID: Int) {
        self.cartID = cartID
        self.items = []
    }

    func addProduct(product: Product) {
        items.append(product)
    }

    func removeProduct(productID: Int) {
        items.removeAll { $0.productID == productID }
    }

    func calculateTotalPrice() -> Double {
        return items.reduce(0) { $0 + $1.price }
    }
}

// მომხმარებლის კლასის შექმნა
class User {
    var userID: Int
    var username: String
    var cart: Cart

    init(userID: Int, username: String, cart: Cart) {
        self.userID = userID
        self.username = username
        self.cart = cart
    }

    func addProductToCart(product: Product) {
        cart.addProduct(product: product)
    }

    func removeProductFromCart(productID: Int) {
        cart.removeProduct(productID: productID)
    }

    func checkout() -> Double {
        let totalPrice = cart.calculateTotalPrice()
        cart.items.removeAll()
        return totalPrice
    }
}

// მოქმედებებეის განხორციელება
func simulateECommerceSystem() {
    // პროდუქტების შექმნა
    let product1 = Product(productID: 1, name: "Product 1", price: 10.0)
    let product2 = Product(productID: 2, name: "Product 2", price: 15.0)
    let product3 = Product(productID: 3, name: "Product 3", price: 20.0)

    // კარტების შექმნა
    let cart1 = Cart(cartID: 1)
    let cart2 = Cart(cartID: 2)

    // მომხმარებლების შექმნა
    let user1 = User(userID: 1, username: "User 1", cart: cart1)
    let user2 = User(userID: 2, username: "User 2", cart: cart2)

    // პროდუქტების კარტაზე დამატება
    user1.addProductToCart(product: product1)
    user1.addProductToCart(product: product2)
    user2.addProductToCart(product: product2)
    user2.addProductToCart(product: product3)

    // დავპრინტოთ კარტაზე არსებული მთლიანი ფასები
    print("User 1's cart total price: Gel\(user1.cart.calculateTotalPrice())")
    print("User 2's cart total price: Gel\(user2.cart.calculateTotalPrice())")

    // ჩექაუთის სიმულაცია
    let totalPriceUser1 = user1.checkout()
    let totalPriceUser2 = user2.checkout()

    print("User 1's checkout amount: Gel\(totalPriceUser1)")
    print("User 2's checkout amount: Gel\(totalPriceUser2)")
}

// ტესტ-დრაივი
simulateECommerceSystem()
