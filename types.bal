import ballerina/graphql;

# Represents a product in the system
# + id - The unique ID of the product
# + name - The name of the product
# + description - The description of the product
# + price - The price of the product
public type Product record {|
    @graphql:ID string id;
    string name;
    string description;
    float price;
|};
