import product_subgraph.datasource;

import ballerina/graphql;

service on new graphql:Listener(9092) {
    isolated resource function get products() returns Product[] {
        return from ProductInfo productInfo in datasource:getProducts()
            select new (productInfo);
    }

    isolated resource function get product(@graphql:ID string id) returns Product? {
        ProductInfo? productInfo = datasource:getProduct(id);
        if productInfo is () {
            return;
        }
        return new (productInfo);
    }
}
