import ballerina/graphql;

public type Product readonly & record {|
    @graphql:ID string id;
    string name;
    string description;
    float price;
|};
