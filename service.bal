import product_subgraph.datasource;

import ballerina/graphql;

service /graphql on new graphql:Listener(9091) {
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
