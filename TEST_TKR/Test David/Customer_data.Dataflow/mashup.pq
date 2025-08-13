[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "dimension_customer 1_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared #"dimension_customer 1" = let
  Quelle = Csv.Document(Web.Contents("https://burkert-my.sharepoint.com/personal/david_duong_burkert_com/Documents/Apps/Microsoft Power Query/Uploaded Files/dimension_customer 1.csv"), [Delimiter = ",", Columns = 11, Encoding = 65001, QuoteStyle = QuoteStyle.None]),
  #"Höher gestufte Header" = Table.PromoteHeaders(Quelle, [PromoteAllScalars = true]),
  #"Geänderter Spaltentyp" = Table.TransformColumnTypes(#"Höher gestufte Header", {{"CustomerKey", Int64.Type}, {"WWICustomerID", Int64.Type}, {"Customer", type text}, {"BillToCustomer", type text}, {"Category", type text}, {"BuyingGroup", type text}, {"PrimaryContact", type text}, {"PostalCode", type text}, {"ValidFrom", type datetime}, {"ValidTo", type datetime}, {"LineageKey", Int64.Type}}, "de")
in
  #"Geänderter Spaltentyp";
shared #"dimension_customer 1_DataDestination" = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "e58a04c9-b9e4-44cb-b315-07569b01fee4"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "28ea0780-322a-4d49-8e6b-2c2039a676df"]}[Data],
  TableNavigation = Navigation_2{[Id = "dimension_customer_new", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
