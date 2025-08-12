CREATE TABLE [dbo].[om_opportunity] (

	[Id] varchar(8000) NULL, 
	[statecode] bigint NULL, 
	[state_text] varchar(4) NULL, 
	[statuscode] bigint NULL, 
	[budgetstatus] bigint NULL, 
	[burkert_burkertclassification] bigint NULL, 
	[burkert_business_frequency] bigint NULL, 
	[burkert_salesstagecode] bigint NULL, 
	[accountid] varchar(8000) NULL, 
	[accountid_entitytype] varchar(8000) NULL, 
	[estimatedvalue] decimal(34,6) NULL, 
	[estimatedvalue_base] decimal(34,6) NULL, 
	[actualclosedate] datetime2(6) NULL, 
	[estimatedclosedate] datetime2(6) NULL
);