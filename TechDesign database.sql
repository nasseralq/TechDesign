-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `ClientID` INT NOT NULL AUTO_INCREMENT,
  `ClientName` VARCHAR(255) NOT NULL,
  `ClientDate` DATE NOT NULL,
  `PhoneNo` INT NOT NULL,
  PRIMARY KEY (`ClientID`),
  UNIQUE INDEX `ClientID_UNIQUE` (`ClientID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
  `ConNo` INT NOT NULL AUTO_INCREMENT,
  `PayType` VARCHAR(45) NOT NULL,
  `TotalAmount` FLOAT NOT NULL,
  `AdvAmount` FLOAT NULL,
  `UnpaidAmount` FLOAT NULL,
  `Client_ClientID` INT NOT NULL,
  PRIMARY KEY (`ConNo`, `Client_ClientID`),
  UNIQUE INDEX `ConNo_UNIQUE` (`ConNo` ASC) VISIBLE,
  INDEX `fk_Payment_Client1_idx` (`Client_ClientID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employees` (
  `EmID` INT NOT NULL AUTO_INCREMENT,
  `FName` VARCHAR(45) NOT NULL,
  `LName` VARCHAR(45) NOT NULL,
  `DateOfEmp` DATE NOT NULL,
  `Salary` VARCHAR(45) NOT NULL,
  `Department_DepID` INT NOT NULL,
  PRIMARY KEY (`EmID`, `Department_DepID`),
  UNIQUE INDEX `EmID_UNIQUE` (`EmID` ASC) VISIBLE,
  INDEX `fk_Employees_Department1_idx` (`Department_DepID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Department` (
  `DepID` INT NOT NULL AUTO_INCREMENT,
  `DepName` VARCHAR(100) NOT NULL,
  `DepPhoneNo` INT NOT NULL,
  `MangerName` VARCHAR(45) NULL,
  `Employees_EmID1` INT NOT NULL,
  PRIMARY KEY (`DepID`, `Employees_EmID1`),
  UNIQUE INDEX `NoOfEmp_UNIQUE` (`DepID` ASC) VISIBLE,
  INDEX `fk_Department_Employees2_idx` (`Employees_EmID1` ASC) VISIBLE,
  UNIQUE INDEX `Employees_EmID1_UNIQUE` (`Employees_EmID1` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Service` (
  `ConNo` INT NOT NULL AUTO_INCREMENT,
  `StDate` DATE NOT NULL,
  `EnDate` DATE NULL,
  `Loc` VARCHAR(255) NOT NULL,
  `Description` VARCHAR(400) NOT NULL,
  `Client_ClientID` INT NOT NULL,
  PRIMARY KEY (`ConNo`, `Client_ClientID`),
  UNIQUE INDEX `ConNo_UNIQUE` (`ConNo` ASC) VISIBLE,
  INDEX `fk_Service_Client1_idx` (`Client_ClientID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Supplies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Supplies` (
  `EqdID` INT NOT NULL AUTO_INCREMENT,
  `EqdPrice` FLOAT NOT NULL,
  `EqdType` VARCHAR(255) NOT NULL,
  `CheckOut` DATE NOT NULL,
  `CheckIn` DATE NOT NULL,
  PRIMARY KEY (`EqdID`),
  UNIQUE INDEX `EqdID_UNIQUE` (`EqdID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Maintenance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Maintenance` (
  `ReqNo` INT NOT NULL AUTO_INCREMENT,
  `ReqDate` DATE NOT NULL,
  `ReqDescripton` VARCHAR(400) NOT NULL,
  `Supplies_EqdID` INT NOT NULL,
  PRIMARY KEY (`ReqNo`, `Supplies_EqdID`),
  UNIQUE INDEX `ReqNo_UNIQUE` (`ReqNo` ASC) VISIBLE,
  INDEX `fk_Maintenance_Supplies1_idx` (`Supplies_EqdID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Client_has_Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client_has_Payment` (
  `Client_ClientID` INT NOT NULL,
  `Payment_ConNo` INT NOT NULL,
  PRIMARY KEY (`Client_ClientID`, `Payment_ConNo`),
  INDEX `fk_Client_has_Payment_Payment1_idx` (`Payment_ConNo` ASC) VISIBLE,
  INDEX `fk_Client_has_Payment_Client_idx` (`Client_ClientID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`timestamps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`timestamps` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
