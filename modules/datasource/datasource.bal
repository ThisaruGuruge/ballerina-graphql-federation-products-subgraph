public isolated function getProducts() returns Product[] {
    lock {
        Product[] result = from Product product in products select product;
        return result.cloneReadOnly();
    }
}

public isolated function getProduct(string id) returns Product? {
    lock {
        if products.hasKey(id) {
            return products.get(id);
        }
    }
    return;
}
