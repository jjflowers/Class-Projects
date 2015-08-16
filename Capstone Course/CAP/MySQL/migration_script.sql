-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: AdventureWorks2014
-- Source Schemata: AdventureWorks2014
-- Created: Fri Feb 27 00:02:00 2015
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;;

-- ----------------------------------------------------------------------------
-- Schema AdventureWorks2014
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `AdventureWorks2014` ;
CREATE SCHEMA IF NOT EXISTS `AdventureWorks2014` ;

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.DatabaseLog
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`DatabaseLog` (
  `DatabaseLogID` INT NOT NULL AUTO_INCREMENT,
  `PostTime` DATETIME(6) NOT NULL,
  `DatabaseUser` VARCHAR(160) NOT NULL,
  `Event` VARCHAR(160) NOT NULL,
  `Schema` VARCHAR(160) NULL,
  `Object` VARCHAR(160) NULL,
  `TSQL` LONGTEXT NOT NULL,
  `XmlEvent` TEXT NOT NULL,
  PRIMARY KEY (`DatabaseLogID`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ErrorLog
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ErrorLog` (
  `ErrorLogID` INT NOT NULL AUTO_INCREMENT,
  `ErrorTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UserName` VARCHAR(160) NOT NULL,
  `ErrorNumber` INT NOT NULL,
  `ErrorSeverity` INT NULL,
  `ErrorState` INT NULL,
  `ErrorProcedure` VARCHAR(126) NULL,
  `ErrorLine` INT NULL,
  `ErrorMessage` VARCHAR(4000) NOT NULL,
  PRIMARY KEY (`ErrorLogID`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.AWBuildVersion
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`AWBuildVersion` (
  `SystemInformationID` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Database Version` VARCHAR(25) NOT NULL,
  `VersionDate` DATETIME(6) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SystemInformationID`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.Shift
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`Shift` (
  `ShiftID` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `StartTime` TIME(6) NOT NULL,
  `EndTime` TIME(6) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ShiftID`),
  UNIQUE INDEX `AK_Shift_Name` (`Name` ASC),
  UNIQUE INDEX `AK_Shift_StartTime_EndTime` (`StartTime` ASC, `EndTime` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.Department
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`Department` (
  `DepartmentID` SMALLINT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `GroupName` VARCHAR(100) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DepartmentID`),
  UNIQUE INDEX `AK_Department_Name` (`Name` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.Employee
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`Employee` (
  `BusinessEntityID` INT NOT NULL,
  `NationalIDNumber` VARCHAR(15) NOT NULL,
  `LoginID` VARCHAR(256) NOT NULL,
  `OrganizationNode` VARCHAR(255) NULL,
  `OrganizationLevel` SMALLINT NULL,
  `JobTitle` VARCHAR(50) NOT NULL,
  `BirthDate` DATE NOT NULL,
  `MaritalStatus` CHAR(1) NOT NULL,
  `Gender` CHAR(1) NOT NULL,
  `HireDate` DATE NOT NULL,
  `SalariedFlag` TINYINT(1) NOT NULL DEFAULT 1,
  `VacationHours` SMALLINT NOT NULL DEFAULT 0,
  `SickLeaveHours` SMALLINT NOT NULL DEFAULT 0,
  `CurrentFlag` TINYINT(1) NOT NULL DEFAULT 1,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BusinessEntityID`),
  INDEX `IX_Employee_OrganizationNode` (`OrganizationNode` ASC),
  INDEX `IX_Employee_OrganizationLevel_OrganizationNode` (`OrganizationLevel` ASC, `OrganizationNode` ASC),
  UNIQUE INDEX `AK_Employee_LoginID` (`LoginID`(255) ASC),
  UNIQUE INDEX `AK_Employee_NationalIDNumber` (`NationalIDNumber` ASC),
  UNIQUE INDEX `AK_Employee_rowguid` (`rowguid` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.EmployeeDepartmentHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`EmployeeDepartmentHistory` (
  `BusinessEntityID` INT NOT NULL,
  `DepartmentID` SMALLINT NOT NULL,
  `ShiftID` TINYINT UNSIGNED NOT NULL,
  `StartDate` DATE NOT NULL,
  `EndDate` DATE NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BusinessEntityID`, `StartDate`, `DepartmentID`, `ShiftID`),
  INDEX `IX_EmployeeDepartmentHistory_DepartmentID` (`DepartmentID` ASC),
  INDEX `IX_EmployeeDepartmentHistory_ShiftID` (`ShiftID` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.EmployeePayHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`EmployeePayHistory` (
  `BusinessEntityID` INT NOT NULL,
  `RateChangeDate` DATETIME(6) NOT NULL,
  `Rate` DECIMAL(19,4) NOT NULL,
  `PayFrequency` TINYINT UNSIGNED NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BusinessEntityID`, `RateChangeDate`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.JobCandidate
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`JobCandidate` (
  `JobCandidateID` INT NOT NULL AUTO_INCREMENT,
  `BusinessEntityID` INT NULL,
  `Resume` TEXT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`JobCandidateID`),
  INDEX `IX_JobCandidate_BusinessEntityID` (`BusinessEntityID` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.Address
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`Address` (
  `AddressID` INT NOT NULL AUTO_INCREMENT,
  `AddressLine1` VARCHAR(60) NOT NULL,
  `AddressLine2` VARCHAR(60) NULL,
  `City` VARCHAR(30) NOT NULL,
  `StateProvinceID` INT NOT NULL,
  `PostalCode` VARCHAR(15) NOT NULL,
  `SpatialLocation` GEOMETRY NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`AddressID`),
  UNIQUE INDEX `AK_Address_rowguid` (`rowguid` ASC),
  UNIQUE INDEX `IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_Post1` (`AddressLine1` ASC, `AddressLine2` ASC, `City` ASC, `StateProvinceID` ASC, `PostalCode` ASC),
  INDEX `IX_Address_StateProvinceID` (`StateProvinceID` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.AddressType
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`AddressType` (
  `AddressTypeID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`AddressTypeID`),
  UNIQUE INDEX `AK_AddressType_rowguid` (`rowguid` ASC),
  UNIQUE INDEX `AK_AddressType_Name` (`Name` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.StateProvince
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`StateProvince` (
  `StateProvinceID` INT NOT NULL AUTO_INCREMENT,
  `StateProvinceCode` CHAR(3) NOT NULL,
  `CountryRegionCode` VARCHAR(3) NOT NULL,
  `IsOnlyStateProvinceFlag` TINYINT(1) NOT NULL DEFAULT 1,
  `Name` VARCHAR(100) NOT NULL,
  `TerritoryID` INT NOT NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`StateProvinceID`),
  UNIQUE INDEX `AK_StateProvince_Name` (`Name` ASC),
  UNIQUE INDEX `AK_StateProvince_StateProvinceCode_CountryRegionCode` (`StateProvinceCode` ASC, `CountryRegionCode` ASC),
  UNIQUE INDEX `AK_StateProvince_rowguid` (`rowguid` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.BusinessEntity
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`BusinessEntity` (
  `BusinessEntityID` INT NOT NULL AUTO_INCREMENT,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BusinessEntityID`),
  UNIQUE INDEX `AK_BusinessEntity_rowguid` (`rowguid` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.BusinessEntityAddress
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`BusinessEntityAddress` (
  `BusinessEntityID` INT NOT NULL,
  `AddressID` INT NOT NULL,
  `AddressTypeID` INT NOT NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BusinessEntityID`, `AddressID`, `AddressTypeID`),
  UNIQUE INDEX `AK_BusinessEntityAddress_rowguid` (`rowguid` ASC),
  INDEX `IX_BusinessEntityAddress_AddressID` (`AddressID` ASC),
  INDEX `IX_BusinessEntityAddress_AddressTypeID` (`AddressTypeID` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.BusinessEntityContact
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`BusinessEntityContact` (
  `BusinessEntityID` INT NOT NULL,
  `PersonID` INT NOT NULL,
  `ContactTypeID` INT NOT NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BusinessEntityID`, `PersonID`, `ContactTypeID`),
  UNIQUE INDEX `AK_BusinessEntityContact_rowguid` (`rowguid` ASC),
  INDEX `IX_BusinessEntityContact_PersonID` (`PersonID` ASC),
  INDEX `IX_BusinessEntityContact_ContactTypeID` (`ContactTypeID` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ContactType
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ContactType` (
  `ContactTypeID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ContactTypeID`),
  UNIQUE INDEX `AK_ContactType_Name` (`Name` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.CountryRegion
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`CountryRegion` (
  `CountryRegionCode` VARCHAR(3) NOT NULL,
  `Name` VARCHAR(100) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CountryRegionCode`),
  UNIQUE INDEX `AK_CountryRegion_Name` (`Name` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.EmailAddress
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`EmailAddress` (
  `BusinessEntityID` INT NOT NULL,
  `EmailAddressID` INT NOT NULL AUTO_INCREMENT,
  `EmailAddress` VARCHAR(50) NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EmailAddressID`, `BusinessEntityID`),
  INDEX `IX_EmailAddress_EmailAddress` (`EmailAddress` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.Password
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`Password` (
  `BusinessEntityID` INT NOT NULL,
  `PasswordHash` VARCHAR(128) NOT NULL,
  `PasswordSalt` VARCHAR(10) NOT NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BusinessEntityID`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.Person
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`Person` (
  `BusinessEntityID` INT NOT NULL,
  `PersonType` CHAR(2) NOT NULL,
  `NameStyle` TINYINT(1) NOT NULL DEFAULT 0,
  `Title` VARCHAR(8) NULL,
  `FirstName` VARCHAR(100) NOT NULL,
  `MiddleName` VARCHAR(100) NULL,
  `LastName` VARCHAR(100) NOT NULL,
  `Suffix` VARCHAR(10) NULL,
  `EmailPromotion` INT NOT NULL DEFAULT 0,
  `AdditionalContactInfo` TEXT NULL,
  `Demographics` TEXT NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BusinessEntityID`),
  INDEX `IX_Person_LastName_FirstName_MiddleName` (`LastName` ASC, `FirstName` ASC, `MiddleName` ASC),
  UNIQUE INDEX `AK_Person_rowguid` (`rowguid` ASC),
  INDEX `PXML_Person_AddContact` (`AdditionalContactInfo`(255) ASC),
  INDEX `PXML_Person_Demographics` (`Demographics`(255) ASC),
  INDEX `XMLPATH_Person_Demographics` (`Demographics`(255) ASC),
  INDEX `XMLPROPERTY_Person_Demographics` (`Demographics`(255) ASC),
  INDEX `XMLVALUE_Person_Demographics` (`Demographics`(255) ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.PersonPhone
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`PersonPhone` (
  `BusinessEntityID` INT NOT NULL,
  `PhoneNumber` VARCHAR(50) NOT NULL,
  `PhoneNumberTypeID` INT NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BusinessEntityID`, `PhoneNumber`, `PhoneNumberTypeID`),
  INDEX `IX_PersonPhone_PhoneNumber` (`PhoneNumber` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.PhoneNumberType
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`PhoneNumberType` (
  `PhoneNumberTypeID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PhoneNumberTypeID`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ScrapReason
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ScrapReason` (
  `ScrapReasonID` SMALLINT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ScrapReasonID`),
  UNIQUE INDEX `AK_ScrapReason_Name` (`Name` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ProductCategory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ProductCategory` (
  `ProductCategoryID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductCategoryID`),
  UNIQUE INDEX `AK_ProductCategory_Name` (`Name` ASC),
  UNIQUE INDEX `AK_ProductCategory_rowguid` (`rowguid` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ProductCostHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ProductCostHistory` (
  `ProductID` INT NOT NULL,
  `StartDate` DATETIME(6) NOT NULL,
  `EndDate` DATETIME(6) NULL,
  `StandardCost` DECIMAL(19,4) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductID`, `StartDate`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ProductDescription
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ProductDescription` (
  `ProductDescriptionID` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(400) NOT NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductDescriptionID`),
  UNIQUE INDEX `AK_ProductDescription_rowguid` (`rowguid` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ProductDocument
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ProductDocument` (
  `ProductID` INT NOT NULL,
  `DocumentNode` VARCHAR(255) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductID`, `DocumentNode`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ProductInventory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ProductInventory` (
  `ProductID` INT NOT NULL,
  `LocationID` SMALLINT NOT NULL,
  `Shelf` VARCHAR(10) NOT NULL,
  `Bin` TINYINT UNSIGNED NOT NULL,
  `Quantity` SMALLINT NOT NULL DEFAULT 0,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductID`, `LocationID`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ProductListPriceHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ProductListPriceHistory` (
  `ProductID` INT NOT NULL,
  `StartDate` DATETIME(6) NOT NULL,
  `EndDate` DATETIME(6) NULL,
  `ListPrice` DECIMAL(19,4) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductID`, `StartDate`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ProductModel
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ProductModel` (
  `ProductModelID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `CatalogDescription` TEXT NULL,
  `Instructions` TEXT NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductModelID`),
  UNIQUE INDEX `AK_ProductModel_Name` (`Name` ASC),
  UNIQUE INDEX `AK_ProductModel_rowguid` (`rowguid` ASC),
  INDEX `PXML_ProductModel_CatalogDescription` (`CatalogDescription`(255) ASC),
  INDEX `PXML_ProductModel_Instructions` (`Instructions`(255) ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ProductModelIllustration
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ProductModelIllustration` (
  `ProductModelID` INT NOT NULL,
  `IllustrationID` INT NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductModelID`, `IllustrationID`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ProductModelProductDescriptionCulture
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ProductModelProductDescriptionCulture` (
  `ProductModelID` INT NOT NULL,
  `ProductDescriptionID` INT NOT NULL,
  `CultureID` CHAR(6) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductModelID`, `ProductDescriptionID`, `CultureID`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.BillOfMaterials
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`BillOfMaterials` (
  `BillOfMaterialsID` INT NOT NULL AUTO_INCREMENT,
  `ProductAssemblyID` INT NULL,
  `ComponentID` INT NOT NULL,
  `StartDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EndDate` DATETIME(6) NULL,
  `UnitMeasureCode` CHAR(3) NOT NULL,
  `BOMLevel` SMALLINT NOT NULL,
  `PerAssemblyQty` DECIMAL(8,2) NOT NULL DEFAULT 1.00,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BillOfMaterialsID`),
  UNIQUE INDEX `AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate` (`ProductAssemblyID` ASC, `ComponentID` ASC, `StartDate` ASC),
  INDEX `IX_BillOfMaterials_UnitMeasureCode` (`UnitMeasureCode` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ProductPhoto
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ProductPhoto` (
  `ProductPhotoID` INT NOT NULL AUTO_INCREMENT,
  `ThumbNailPhoto` LONGBLOB NULL,
  `ThumbnailPhotoFileName` VARCHAR(50) NULL,
  `LargePhoto` LONGBLOB NULL,
  `LargePhotoFileName` VARCHAR(50) NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductPhotoID`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ProductProductPhoto
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ProductProductPhoto` (
  `ProductID` INT NOT NULL,
  `ProductPhotoID` INT NOT NULL,
  `Primary` TINYINT(1) NOT NULL DEFAULT 0,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductID`, `ProductPhotoID`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.TransactionHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`TransactionHistory` (
  `TransactionID` INT NOT NULL AUTO_INCREMENT,
  `ProductID` INT NOT NULL,
  `ReferenceOrderID` INT NOT NULL,
  `ReferenceOrderLineID` INT NOT NULL DEFAULT 0,
  `TransactionDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TransactionType` CHAR(1) NOT NULL,
  `Quantity` INT NOT NULL,
  `ActualCost` DECIMAL(19,4) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TransactionID`),
  INDEX `IX_TransactionHistory_ProductID` (`ProductID` ASC),
  INDEX `IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID` (`ReferenceOrderID` ASC, `ReferenceOrderLineID` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ProductReview
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ProductReview` (
  `ProductReviewID` INT NOT NULL AUTO_INCREMENT,
  `ProductID` INT NOT NULL,
  `ReviewerName` VARCHAR(100) NOT NULL,
  `ReviewDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EmailAddress` VARCHAR(50) NOT NULL,
  `Rating` INT NOT NULL,
  `Comments` VARCHAR(3850) NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductReviewID`),
  INDEX `IX_ProductReview_ProductID_Name` (`ProductID` ASC, `ReviewerName` ASC, `Comments`(255) ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.TransactionHistoryArchive
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`TransactionHistoryArchive` (
  `TransactionID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `ReferenceOrderID` INT NOT NULL,
  `ReferenceOrderLineID` INT NOT NULL DEFAULT 0,
  `TransactionDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TransactionType` CHAR(1) NOT NULL,
  `Quantity` INT NOT NULL,
  `ActualCost` DECIMAL(19,4) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TransactionID`),
  INDEX `IX_TransactionHistoryArchive_ProductID` (`ProductID` ASC),
  INDEX `IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLi2` (`ReferenceOrderID` ASC, `ReferenceOrderLineID` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ProductSubcategory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ProductSubcategory` (
  `ProductSubcategoryID` INT NOT NULL AUTO_INCREMENT,
  `ProductCategoryID` INT NOT NULL,
  `Name` VARCHAR(100) NOT NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductSubcategoryID`),
  UNIQUE INDEX `AK_ProductSubcategory_Name` (`Name` ASC),
  UNIQUE INDEX `AK_ProductSubcategory_rowguid` (`rowguid` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.UnitMeasure
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`UnitMeasure` (
  `UnitMeasureCode` CHAR(3) NOT NULL,
  `Name` VARCHAR(100) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UnitMeasureCode`),
  UNIQUE INDEX `AK_UnitMeasure_Name` (`Name` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.WorkOrder
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`WorkOrder` (
  `WorkOrderID` INT NOT NULL AUTO_INCREMENT,
  `ProductID` INT NOT NULL,
  `OrderQty` INT NOT NULL,
  `StockedQty` INT NOT NULL,
  `ScrappedQty` SMALLINT NOT NULL,
  `StartDate` DATETIME(6) NOT NULL,
  `EndDate` DATETIME(6) NULL,
  `DueDate` DATETIME(6) NOT NULL,
  `ScrapReasonID` SMALLINT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`WorkOrderID`),
  INDEX `IX_WorkOrder_ScrapReasonID` (`ScrapReasonID` ASC),
  INDEX `IX_WorkOrder_ProductID` (`ProductID` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.Culture
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`Culture` (
  `CultureID` CHAR(6) NOT NULL,
  `Name` VARCHAR(100) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CultureID`),
  UNIQUE INDEX `AK_Culture_Name` (`Name` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.WorkOrderRouting
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`WorkOrderRouting` (
  `WorkOrderID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `OperationSequence` SMALLINT NOT NULL,
  `LocationID` SMALLINT NOT NULL,
  `ScheduledStartDate` DATETIME(6) NOT NULL,
  `ScheduledEndDate` DATETIME(6) NOT NULL,
  `ActualStartDate` DATETIME(6) NULL,
  `ActualEndDate` DATETIME(6) NULL,
  `ActualResourceHrs` DECIMAL(9,4) NULL,
  `PlannedCost` DECIMAL(19,4) NOT NULL,
  `ActualCost` DECIMAL(19,4) NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`WorkOrderID`, `ProductID`, `OperationSequence`),
  INDEX `IX_WorkOrderRouting_ProductID` (`ProductID` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.Document
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`Document` (
  `DocumentNode` VARCHAR(255) NOT NULL,
  `DocumentLevel` SMALLINT NULL,
  `Title` VARCHAR(50) NOT NULL,
  `Owner` INT NOT NULL,
  `FolderFlag` TINYINT(1) NOT NULL DEFAULT 0,
  `FileName` VARCHAR(400) NOT NULL,
  `FileExtension` VARCHAR(8) NOT NULL,
  `Revision` CHAR(5) NOT NULL,
  `ChangeNumber` INT NOT NULL DEFAULT 0,
  `Status` TINYINT UNSIGNED NOT NULL,
  `DocumentSummary` LONGTEXT NULL,
  `Document` LONGBLOB NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DocumentNode`),
  UNIQUE INDEX `UQ__Document__F73921F77753F2AD` (`rowguid` ASC),
  UNIQUE INDEX `AK_Document_DocumentLevel_DocumentNode` (`DocumentLevel` ASC, `DocumentNode` ASC),
  UNIQUE INDEX `AK_Document_rowguid` (`rowguid` ASC),
  INDEX `IX_Document_FileName_Revision` (`FileName`(255) ASC, `Revision` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.Illustration
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`Illustration` (
  `IllustrationID` INT NOT NULL AUTO_INCREMENT,
  `Diagram` TEXT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IllustrationID`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.Location
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`Location` (
  `LocationID` SMALLINT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `CostRate` DECIMAL(10,4) NOT NULL DEFAULT 0.00,
  `Availability` DECIMAL(8,2) NOT NULL DEFAULT 0.00,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LocationID`),
  UNIQUE INDEX `AK_Location_Name` (`Name` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.Product
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`Product` (
  `ProductID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `ProductNumber` VARCHAR(25) NOT NULL,
  `MakeFlag` TINYINT(1) NOT NULL DEFAULT 1,
  `FinishedGoodsFlag` TINYINT(1) NOT NULL DEFAULT 1,
  `Color` VARCHAR(15) NULL,
  `SafetyStockLevel` SMALLINT NOT NULL,
  `ReorderPoint` SMALLINT NOT NULL,
  `StandardCost` DECIMAL(19,4) NOT NULL,
  `ListPrice` DECIMAL(19,4) NOT NULL,
  `Size` VARCHAR(5) NULL,
  `SizeUnitMeasureCode` CHAR(3) NULL,
  `WeightUnitMeasureCode` CHAR(3) NULL,
  `Weight` DECIMAL(8,2) NULL,
  `DaysToManufacture` INT NOT NULL,
  `ProductLine` CHAR(2) NULL,
  `Class` CHAR(2) NULL,
  `Style` CHAR(2) NULL,
  `ProductSubcategoryID` INT NULL,
  `ProductModelID` INT NULL,
  `SellStartDate` DATETIME(6) NOT NULL,
  `SellEndDate` DATETIME(6) NULL,
  `DiscontinuedDate` DATETIME(6) NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductID`),
  UNIQUE INDEX `AK_Product_ProductNumber` (`ProductNumber` ASC),
  UNIQUE INDEX `AK_Product_Name` (`Name` ASC),
  UNIQUE INDEX `AK_Product_rowguid` (`rowguid` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ShipMethod
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ShipMethod` (
  `ShipMethodID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `ShipBase` DECIMAL(19,4) NOT NULL DEFAULT 0.00,
  `ShipRate` DECIMAL(19,4) NOT NULL DEFAULT 0.00,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ShipMethodID`),
  UNIQUE INDEX `AK_ShipMethod_Name` (`Name` ASC),
  UNIQUE INDEX `AK_ShipMethod_rowguid` (`rowguid` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ProductVendor
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ProductVendor` (
  `ProductID` INT NOT NULL,
  `BusinessEntityID` INT NOT NULL,
  `AverageLeadTime` INT NOT NULL,
  `StandardPrice` DECIMAL(19,4) NOT NULL,
  `LastReceiptCost` DECIMAL(19,4) NULL,
  `LastReceiptDate` DATETIME(6) NULL,
  `MinOrderQty` INT NOT NULL,
  `MaxOrderQty` INT NOT NULL,
  `OnOrderQty` INT NULL,
  `UnitMeasureCode` CHAR(3) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductID`, `BusinessEntityID`),
  INDEX `IX_ProductVendor_UnitMeasureCode` (`UnitMeasureCode` ASC),
  INDEX `IX_ProductVendor_BusinessEntityID` (`BusinessEntityID` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.Vendor
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`Vendor` (
  `BusinessEntityID` INT NOT NULL,
  `AccountNumber` VARCHAR(30) NOT NULL,
  `Name` VARCHAR(100) NOT NULL,
  `CreditRating` TINYINT UNSIGNED NOT NULL,
  `PreferredVendorStatus` TINYINT(1) NOT NULL DEFAULT 1,
  `ActiveFlag` TINYINT(1) NOT NULL DEFAULT 1,
  `PurchasingWebServiceURL` VARCHAR(1024) NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BusinessEntityID`),
  UNIQUE INDEX `AK_Vendor_AccountNumber` (`AccountNumber` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.PurchaseOrderDetail
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`PurchaseOrderDetail` (
  `PurchaseOrderID` INT NOT NULL,
  `PurchaseOrderDetailID` INT NOT NULL AUTO_INCREMENT,
  `DueDate` DATETIME(6) NOT NULL,
  `OrderQty` SMALLINT NOT NULL,
  `ProductID` INT NOT NULL,
  `UnitPrice` DECIMAL(19,4) NOT NULL,
  `LineTotal` DECIMAL(19,4) NOT NULL,
  `ReceivedQty` DECIMAL(8,2) NOT NULL,
  `RejectedQty` DECIMAL(8,2) NOT NULL,
  `StockedQty` DECIMAL(9,2) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PurchaseOrderDetailID`, `PurchaseOrderID`),
  INDEX `IX_PurchaseOrderDetail_ProductID` (`ProductID` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.PurchaseOrderHeader
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`PurchaseOrderHeader` (
  `PurchaseOrderID` INT NOT NULL AUTO_INCREMENT,
  `RevisionNumber` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `Status` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  `EmployeeID` INT NOT NULL,
  `VendorID` INT NOT NULL,
  `ShipMethodID` INT NOT NULL,
  `OrderDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ShipDate` DATETIME(6) NULL,
  `SubTotal` DECIMAL(19,4) NOT NULL DEFAULT 0.00,
  `TaxAmt` DECIMAL(19,4) NOT NULL DEFAULT 0.00,
  `Freight` DECIMAL(19,4) NOT NULL DEFAULT 0.00,
  `TotalDue` DECIMAL(19,4) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PurchaseOrderID`),
  INDEX `IX_PurchaseOrderHeader_VendorID` (`VendorID` ASC),
  INDEX `IX_PurchaseOrderHeader_EmployeeID` (`EmployeeID` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.ShoppingCartItem
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`ShoppingCartItem` (
  `ShoppingCartItemID` INT NOT NULL AUTO_INCREMENT,
  `ShoppingCartID` VARCHAR(50) NOT NULL,
  `Quantity` INT NOT NULL DEFAULT 1,
  `ProductID` INT NOT NULL,
  `DateCreated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ShoppingCartItemID`),
  INDEX `IX_ShoppingCartItem_ShoppingCartID_ProductID` (`ShoppingCartID` ASC, `ProductID` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.SpecialOffer
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`SpecialOffer` (
  `SpecialOfferID` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(255) NOT NULL,
  `DiscountPct` DECIMAL(10,4) NOT NULL DEFAULT 0.00,
  `Type` VARCHAR(50) NOT NULL,
  `Category` VARCHAR(50) NOT NULL,
  `StartDate` DATETIME(6) NOT NULL,
  `EndDate` DATETIME(6) NOT NULL,
  `MinQty` INT NOT NULL DEFAULT 0,
  `MaxQty` INT NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SpecialOfferID`),
  UNIQUE INDEX `AK_SpecialOffer_rowguid` (`rowguid` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.SpecialOfferProduct
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`SpecialOfferProduct` (
  `SpecialOfferID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SpecialOfferID`, `ProductID`),
  UNIQUE INDEX `AK_SpecialOfferProduct_rowguid` (`rowguid` ASC),
  INDEX `IX_SpecialOfferProduct_ProductID` (`ProductID` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.Store
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`Store` (
  `BusinessEntityID` INT NOT NULL,
  `Name` VARCHAR(100) NOT NULL,
  `SalesPersonID` INT NULL,
  `Demographics` TEXT NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BusinessEntityID`),
  UNIQUE INDEX `AK_Store_rowguid` (`rowguid` ASC),
  INDEX `IX_Store_SalesPersonID` (`SalesPersonID` ASC),
  INDEX `PXML_Store_Demographics` (`Demographics`(255) ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.CountryRegionCurrency
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`CountryRegionCurrency` (
  `CountryRegionCode` VARCHAR(3) NOT NULL,
  `CurrencyCode` CHAR(3) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CountryRegionCode`, `CurrencyCode`),
  INDEX `IX_CountryRegionCurrency_CurrencyCode` (`CurrencyCode` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.CreditCard
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`CreditCard` (
  `CreditCardID` INT NOT NULL AUTO_INCREMENT,
  `CardType` VARCHAR(50) NOT NULL,
  `CardNumber` VARCHAR(25) NOT NULL,
  `ExpMonth` TINYINT UNSIGNED NOT NULL,
  `ExpYear` SMALLINT NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CreditCardID`),
  UNIQUE INDEX `AK_CreditCard_CardNumber` (`CardNumber` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.Currency
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`Currency` (
  `CurrencyCode` CHAR(3) NOT NULL,
  `Name` VARCHAR(100) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CurrencyCode`),
  UNIQUE INDEX `AK_Currency_Name` (`Name` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.CurrencyRate
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`CurrencyRate` (
  `CurrencyRateID` INT NOT NULL AUTO_INCREMENT,
  `CurrencyRateDate` DATETIME(6) NOT NULL,
  `FromCurrencyCode` CHAR(3) NOT NULL,
  `ToCurrencyCode` CHAR(3) NOT NULL,
  `AverageRate` DECIMAL(19,4) NOT NULL,
  `EndOfDayRate` DECIMAL(19,4) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CurrencyRateID`),
  UNIQUE INDEX `AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode` (`CurrencyRateDate` ASC, `FromCurrencyCode` ASC, `ToCurrencyCode` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.Customer
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`Customer` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `PersonID` INT NULL,
  `StoreID` INT NULL,
  `TerritoryID` INT NULL,
  `AccountNumber` VARCHAR(10) NOT NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `AK_Customer_rowguid` (`rowguid` ASC),
  UNIQUE INDEX `AK_Customer_AccountNumber` (`AccountNumber` ASC),
  INDEX `IX_Customer_TerritoryID` (`TerritoryID` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.SalesOrderDetail
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`SalesOrderDetail` (
  `SalesOrderID` INT NOT NULL,
  `SalesOrderDetailID` INT NOT NULL AUTO_INCREMENT,
  `CarrierTrackingNumber` VARCHAR(25) NULL,
  `OrderQty` SMALLINT NOT NULL,
  `ProductID` INT NOT NULL,
  `SpecialOfferID` INT NOT NULL,
  `UnitPrice` DECIMAL(19,4) NOT NULL,
  `UnitPriceDiscount` DECIMAL(19,4) NOT NULL DEFAULT 0.0,
  `LineTotal` DECIMAL(38,6) NOT NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SalesOrderDetailID`, `SalesOrderID`),
  UNIQUE INDEX `AK_SalesOrderDetail_rowguid` (`rowguid` ASC),
  INDEX `IX_SalesOrderDetail_ProductID` (`ProductID` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.SalesOrderHeader
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`SalesOrderHeader` (
  `SalesOrderID` INT NOT NULL AUTO_INCREMENT,
  `RevisionNumber` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `OrderDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DueDate` DATETIME(6) NOT NULL,
  `ShipDate` DATETIME(6) NULL,
  `Status` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  `OnlineOrderFlag` TINYINT(1) NOT NULL DEFAULT 1,
  `SalesOrderNumber` VARCHAR(25) NOT NULL,
  `PurchaseOrderNumber` VARCHAR(50) NULL,
  `AccountNumber` VARCHAR(30) NULL,
  `CustomerID` INT NOT NULL,
  `SalesPersonID` INT NULL,
  `TerritoryID` INT NULL,
  `BillToAddressID` INT NOT NULL,
  `ShipToAddressID` INT NOT NULL,
  `ShipMethodID` INT NOT NULL,
  `CreditCardID` INT NULL,
  `CreditCardApprovalCode` VARCHAR(15) NULL,
  `CurrencyRateID` INT NULL,
  `SubTotal` DECIMAL(19,4) NOT NULL DEFAULT 0.00,
  `TaxAmt` DECIMAL(19,4) NOT NULL DEFAULT 0.00,
  `Freight` DECIMAL(19,4) NOT NULL DEFAULT 0.00,
  `TotalDue` DECIMAL(19,4) NOT NULL,
  `Comment` VARCHAR(128) NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SalesOrderID`),
  UNIQUE INDEX `AK_SalesOrderHeader_rowguid` (`rowguid` ASC),
  UNIQUE INDEX `AK_SalesOrderHeader_SalesOrderNumber` (`SalesOrderNumber` ASC),
  INDEX `IX_SalesOrderHeader_CustomerID` (`CustomerID` ASC),
  INDEX `IX_SalesOrderHeader_SalesPersonID` (`SalesPersonID` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.SalesOrderHeaderSalesReason
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`SalesOrderHeaderSalesReason` (
  `SalesOrderID` INT NOT NULL,
  `SalesReasonID` INT NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SalesOrderID`, `SalesReasonID`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.SalesPerson
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`SalesPerson` (
  `BusinessEntityID` INT NOT NULL,
  `TerritoryID` INT NULL,
  `SalesQuota` DECIMAL(19,4) NULL,
  `Bonus` DECIMAL(19,4) NOT NULL DEFAULT 0.00,
  `CommissionPct` DECIMAL(10,4) NOT NULL DEFAULT 0.00,
  `SalesYTD` DECIMAL(19,4) NOT NULL DEFAULT 0.00,
  `SalesLastYear` DECIMAL(19,4) NOT NULL DEFAULT 0.00,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BusinessEntityID`),
  UNIQUE INDEX `AK_SalesPerson_rowguid` (`rowguid` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.SalesPersonQuotaHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`SalesPersonQuotaHistory` (
  `BusinessEntityID` INT NOT NULL,
  `QuotaDate` DATETIME(6) NOT NULL,
  `SalesQuota` DECIMAL(19,4) NOT NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BusinessEntityID`, `QuotaDate`),
  UNIQUE INDEX `AK_SalesPersonQuotaHistory_rowguid` (`rowguid` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.SalesReason
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`SalesReason` (
  `SalesReasonID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `ReasonType` VARCHAR(100) NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SalesReasonID`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.SalesTaxRate
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`SalesTaxRate` (
  `SalesTaxRateID` INT NOT NULL AUTO_INCREMENT,
  `StateProvinceID` INT NOT NULL,
  `TaxType` TINYINT UNSIGNED NOT NULL,
  `TaxRate` DECIMAL(10,4) NOT NULL DEFAULT 0.00,
  `Name` VARCHAR(100) NOT NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SalesTaxRateID`),
  UNIQUE INDEX `AK_SalesTaxRate_StateProvinceID_TaxType` (`StateProvinceID` ASC, `TaxType` ASC),
  UNIQUE INDEX `AK_SalesTaxRate_rowguid` (`rowguid` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.PersonCreditCard
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`PersonCreditCard` (
  `BusinessEntityID` INT NOT NULL,
  `CreditCardID` INT NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BusinessEntityID`, `CreditCardID`));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.SalesTerritory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`SalesTerritory` (
  `TerritoryID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `CountryRegionCode` VARCHAR(3) NOT NULL,
  `Group` VARCHAR(50) NOT NULL,
  `SalesYTD` DECIMAL(19,4) NOT NULL DEFAULT 0.00,
  `SalesLastYear` DECIMAL(19,4) NOT NULL DEFAULT 0.00,
  `CostYTD` DECIMAL(19,4) NOT NULL DEFAULT 0.00,
  `CostLastYear` DECIMAL(19,4) NOT NULL DEFAULT 0.00,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TerritoryID`),
  UNIQUE INDEX `AK_SalesTerritory_Name` (`Name` ASC),
  UNIQUE INDEX `AK_SalesTerritory_rowguid` (`rowguid` ASC));

-- ----------------------------------------------------------------------------
-- Table AdventureWorks2014.SalesTerritoryHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `AdventureWorks2014`.`SalesTerritoryHistory` (
  `BusinessEntityID` INT NOT NULL,
  `TerritoryID` INT NOT NULL,
  `StartDate` DATETIME(6) NOT NULL,
  `EndDate` DATETIME(6) NULL,
  `rowguid` VARCHAR(64) UNIQUE NOT NULL,
  `ModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BusinessEntityID`, `StartDate`, `TerritoryID`),
  UNIQUE INDEX `AK_SalesTerritoryHistory_rowguid` (`rowguid` ASC));
SET FOREIGN_KEY_CHECKS = 1;;
