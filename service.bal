import product_subgraph.datasource;

import ballerina/graphql;

service graphql:Service on new graphql:Listener(9091) {

    # Returns the list of products
    # + return - List of products
    resource function get products() returns Product[] => datasource:getProducts();

    # Returns the product for the given id. If the product does not exist, returns null
    # + id - ID of the product to be retrieved
    # + return - The `Product` for the given id
    resource function get product(@graphql:ID string id) returns Product? =>
        datasource:getProduct(id);
}
