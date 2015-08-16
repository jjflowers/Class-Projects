-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: dbo
-- Source Schemata: dbo
-- Created: Sun Mar 22 19:44:08 2015
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;;

-- ----------------------------------------------------------------------------
-- Schema dbo
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `dbo` ;
CREATE SCHEMA IF NOT EXISTS `dbo` ;

-- ----------------------------------------------------------------------------
-- Table dbo.Field1
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Field1` (
  `FieldNum` INT NOT NULL,
  `Random` DOUBLE NOT NULL);

-- ----------------------------------------------------------------------------
-- Table dbo.Field2
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Field2` (
  `FieldChar` VARCHAR(50) NOT NULL,
  `Random` DOUBLE NULL);

-- ----------------------------------------------------------------------------
-- Table dbo.Fields
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Fields` (
  `FieldNum` INT NOT NULL,
  `FieldChar` VARCHAR(50) NOT NULL);

-- ----------------------------------------------------------------------------
-- Table dbo.Lots
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Lots` (
  `ID` INT NOT NULL,
  `FieldNum` INT NOT NULL,
  `FieldChar` VARCHAR(50) NOT NULL,
  `Address` LONGTEXT NOT NULL,
  `Phone` LONGTEXT NOT NULL,
  `Number` INT NOT NULL);

-- ----------------------------------------------------------------------------
-- Table dbo.sysdiagrams
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`sysdiagrams` (
  `name` DATE NOT NULL,
  `principal_id` INT NOT NULL,
  `diagram_id` INT NOT NULL,
  `version` INT NULL,
  `definition` LONGBLOB NULL);
SET FOREIGN_KEY_CHECKS = 1;;
