import product_subgraph.datasource;

import ballerina/graphql;

service graphql:Service / on new graphql:Listener(8091) {
     resource function get products() returns Product[] {
        return from ProductInfo productInfo in datasource:getProducts()
            select new (productInfo);
    }

     resource function get product(string id) returns Product? {
        ProductInfo? productInfo = datasource:getProduct(id);
        if productInfo is () {
            return;
        }
        return new (productInfo);
    }
}
