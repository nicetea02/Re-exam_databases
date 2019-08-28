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
-- Table `mydb`.`mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mutation` (
  `mutation` INT NOT NULL,
  `chromosomal location` VARCHAR(45) NULL,
  `geneid` INT NULL,
  PRIMARY KEY (`mutation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patient` (
  `patientname` VARCHAR(45) NULL,
  `sex` VARCHAR(1) NULL,
  `age_daignose` INT(2) NULL,
  `mutation` INT NULL,
  INDEX `fk_patient_1_idx` (`mutation` ASC) VISIBLE,
  CONSTRAINT `fk_patient_1`
    FOREIGN KEY (`mutation`)
    REFERENCES `mydb`.`mutation` (`mutation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gene` (
  `geneid` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `location` INT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`geneid`),
  CONSTRAINT `fk_gene_1`
    FOREIGN KEY (`geneid`)
    REFERENCES `mydb`.`mutation` (`geneid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
