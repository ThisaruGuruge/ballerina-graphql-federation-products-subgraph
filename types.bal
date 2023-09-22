import product_subgraph.datasource;

import ballerina/graphql;
import ballerina/graphql.subgraph;

# Represents a product in the system
# + id - The unique ID of the product
# + name - The name of the product
# + description - The description of the product
# + price - The price of the product
@subgraph:Entity {
    key: "id",
    resolveReference: resolveProduct
}
public type Product record {|
    @graphql:ID string id;
    string name;
    string description;
    float price;
|};

isolated function resolveProduct(subgraph:Representation representation) returns Product|error? {
    string id = check representation["id"].ensureType();
    return datasource:getProduct(id);
}
