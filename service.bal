import product_subgraph.datasource;

import ballerina/graphql;

service graphql:Service on new graphql:Listener(9091) {
    resource function get products() returns Product[] => datasource:getProducts();

    resource function get product(@graphql:ID string id) returns Product? =>
        datasource:getProduct(id);
}
