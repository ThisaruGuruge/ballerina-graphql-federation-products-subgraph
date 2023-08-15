import ballerina/graphql;
isolated service class Product {
    private final ProductInfo info;

    isolated function init(ProductInfo info) {
        self.info = info;
    }

    resource function get id() returns @graphql:ID string => self.info.id;

    resource function get name() returns string => self.info.name;

    resource function get description() returns string => self.info.description;

    resource function get price() returns float => self.info.price;
}

type ProductInfo readonly & record {|
    string id;
    string name;
    string description;
    float price;
|};
