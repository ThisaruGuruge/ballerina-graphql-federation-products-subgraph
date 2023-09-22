public isolated function getProducts() returns readonly & Product[] {
    lock {
        return from Product product in products select product;
    }
}

public isolated function getProduct(string id) returns Product? {
    lock {
        return products[id];
    }
}
