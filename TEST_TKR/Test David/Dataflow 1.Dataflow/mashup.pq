[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared DefaultDestination = Lakehouse.Contents([EnableFolding = false]){[workspaceId = "e58a04c9-b9e4-44cb-b315-07569b01fee4"]}[Data]{[lakehouseId = "28ea0780-322a-4d49-8e6b-2c2039a676df"]}[Data];
[BindToDefaultDestination = true]
shared dimension_customer = let
  Quelle = Csv.Document(Web.Contents("https://burkert-my.sharepoint.com/personal/david_duong_burkert_com/Documents/Apps/Microsoft Power Query/Uploaded Files/dimension_customer.csv"), [Delimiter = ",", Columns = 11, Encoding = 65001, QuoteStyle = QuoteStyle.None]),
  #"Höher gestufte Header" = Table.PromoteHeaders(Quelle, [PromoteAllScalars = true]),
  #"Geänderter Spaltentyp" = Table.TransformColumnTypes(#"Höher gestufte Header", {{"CustomerKey", Int64.Type}, {"WWICustomerID", Int64.Type}, {"Customer", type text}, {"BillToCustomer", type text}, {"Category", type text}, {"BuyingGroup", type text}, {"PrimaryContact", type text}, {"PostalCode", type text}, {"ValidFrom", type datetime}, {"ValidTo", type datetime}, {"LineageKey", Int64.Type}}, "de")
in
  #"Geänderter Spaltentyp";
