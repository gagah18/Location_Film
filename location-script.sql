-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sql_Locationfilm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sql_Locationfilm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sql_Locationfilm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `sql_Locationfilm` ;

-- -----------------------------------------------------
-- Table `sql_Locationfilm`.`CATFILM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_Locationfilm`.`CATFILM` (
  `idCATFILM` INT NOT NULL,
  `NomCategorie` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idCATFILM`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sql_Locationfilm`.`CLIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_Locationfilm`.`CLIENT` (
  `IDClient` INT NOT NULL,
  `NomClt` VARCHAR(45) NOT NULL,
  `PrénomClt` VARCHAR(60) NOT NULL,
  `EmailClt` VARCHAR(30) NOT NULL,
  `Date d'Entrée client` DATE NOT NULL,
  PRIMARY KEY (`IDClient`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sql_Locationfilm`.`FILMSTOCK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_Locationfilm`.`FILMSTOCK` (
  `idINFOFILM` INT NOT NULL,
  `Titre` VARCHAR(45) NOT NULL,
  `Date de sortie` DATE NOT NULL,
  `Durée` VARCHAR(15) NOT NULL,
  `Réalisateur` VARCHAR(45) NOT NULL,
  `Date d'entrée en stock` DATE NOT NULL,
  `idCATFILM` INT NOT NULL,
  PRIMARY KEY (`idINFOFILM`),
  INDEX `idCATFILM_idx` (`idCATFILM` ASC) VISIBLE,
  CONSTRAINT `idCATFILM`
    FOREIGN KEY (`idCATFILM`)
    REFERENCES `sql_Locationfilm`.`CATFILM` (`idCATFILM`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sql_Locationfilm`.`FILMLOUER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_Locationfilm`.`FILMLOUER` (
  `idFILMLOUER` INT NOT NULL,
  `Date de location` DATE NOT NULL,
  `Date de retour` DATE NOT NULL,
  `IDClient` INT NOT NULL,
  `idINFOFILM` INT NOT NULL,
  INDEX `idINFOFILM_idx` (`idINFOFILM` ASC) VISIBLE,
  INDEX `IDClient_idx` (`IDClient` ASC) VISIBLE,
  CONSTRAINT `IDClient`
    FOREIGN KEY (`IDClient`)
    REFERENCES `sql_Locationfilm`.`CLIENT` (`IDClient`),
  CONSTRAINT `idINFOFILM`
    FOREIGN KEY (`idINFOFILM`)
    REFERENCES `sql_Locationfilm`.`FILMSTOCK` (`idINFOFILM`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sql_Locationfilm`.`PAYFILM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_Locationfilm`.`PAYFILM` (
  `idPAYFILM` INT NOT NULL,
  `Date de payement` DATE NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `Montant` DOUBLE NOT NULL,
  `CLIENT_IDClient` INT NOT NULL,
  PRIMARY KEY (`idPAYFILM`),
  INDEX `fk_PAYFILM_CLIENT1_idx` (`CLIENT_IDClient` ASC) VISIBLE,
  CONSTRAINT `fk_PAYFILM_CLIENT1`
    FOREIGN KEY (`CLIENT_IDClient`)
    REFERENCES `sql_Locationfilm`.`CLIENT` (`IDClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
