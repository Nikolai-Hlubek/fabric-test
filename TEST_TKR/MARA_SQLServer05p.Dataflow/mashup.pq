[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "T_STG_SAP_MARA_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared T_STG_SAP_MARA = let
  Quelle = Sql.Database("deingsql05p.local.burkert.com", "DATALAKE", [EnableCrossDatabaseFolding = true]),
  #"Navigation 1" = Quelle{[Schema = "dbo", Item = "T_STG_SAP_MARA"]}[Data]
in
  #"Navigation 1";
shared T_STG_SAP_MARA_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "e58a04c9-b9e4-44cb-b315-07569b01fee4"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "cd16236a-9bc9-42f4-b3bf-b31be7430d8b"]}[Data],
  TableNavigation = Navigation_2{[Id = "T_STG_SAP_MARA_SQLServer05p", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
