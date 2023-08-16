import product_subgraph.datasource;

import ballerina/graphql;

service graphql:Service / on new graphql:Listener(8090) {
     resource function get products() returns Product[] {
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
