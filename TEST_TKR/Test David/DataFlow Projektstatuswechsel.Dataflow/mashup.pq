[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"], DestinationTypeSettings = [Kind = "Table"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared DefaultDestination = Lakehouse.Contents([EnableFolding = false]){[workspaceId = "e58a04c9-b9e4-44cb-b315-07569b01fee4"]}[Data]{[lakehouseId = "28ea0780-322a-4d49-8e6b-2c2039a676df"]}[Data];
[BindToDefaultDestination = true]
shared #"Projektstatuswechsel xlsx" = let
  Quelle = Excel.Workbook(Web.Contents("https://burkert-my.sharepoint.com/personal/david_duong_burkert_com/Documents/Auswertungen/05_Ad-Hoc/2024_08%20IK%20Office%20WZB/Korrekturschleifen/2025_07_21/Projektstatuswechsel.xlsx"), null, true),
  #"Navigation 1" = Quelle{[Item = "Projektstatuswechsel.xlsx", Kind = "Sheet"]}[Data],
  #"Höher gestufte Header" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Geänderter Spaltentyp" = Table.TransformColumnTypes(#"Höher gestufte Header", {{"Projekt", type text}, {"Projektstatus", type text}, {"Freier Projektstatus", type text}, {"Von", type datetime}, {"Bis", type datetime}}, "de")
in
  #"Geänderter Spaltentyp";
