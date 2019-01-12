-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema student_housing_management_system
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema student_housing_management_system
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `student_housing_management_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `student_housing_management_system` ;

-- -----------------------------------------------------
-- Table `student_housing_management_system`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`address` (
  `aptNum` INT(11) NULL DEFAULT NULL,
  `streetName` VARCHAR(50) NULL DEFAULT NULL,
  `city` VARCHAR(50) NULL DEFAULT NULL,
  `state` VARCHAR(50) NULL DEFAULT NULL,
  `zip` CHAR(5) NULL DEFAULT NULL,
  `addressId` INT(11) NOT NULL,
  PRIMARY KEY (`addressId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`bed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`bed` (
  `bedId` INT(11) NOT NULL,
  `roomNumber` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`bedId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`building`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`building` (
  `buildingNumber` INT(11) NOT NULL,
  `numberOfRooms` INT(11) NULL DEFAULT NULL,
  `buildingName` VARCHAR(50) NULL DEFAULT NULL,
  `addressId` INT(11) NOT NULL,
  PRIMARY KEY (`buildingNumber`, `addressId`),
  INDEX `addressId_idx` (`addressId` ASC) VISIBLE,
  CONSTRAINT `addressId_building`
    FOREIGN KEY (`addressId`)
    REFERENCES `student_housing_management_system`.`address` (`addressId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`department` (
  `departmentId` INT(11) NOT NULL,
  `departmentName` VARCHAR(50) NULL DEFAULT NULL,
  `addressId` INT(11) NOT NULL,
  PRIMARY KEY (`departmentId`, `addressId`),
  INDEX `addressId_idx` (`addressId` ASC) VISIBLE,
  CONSTRAINT `addressId`
    FOREIGN KEY (`addressId`)
    REFERENCES `student_housing_management_system`.`address` (`addressId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`foodoutlet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`foodoutlet` (
  `outletId` INT(11) NOT NULL,
  `outletName` VARCHAR(45) NULL DEFAULT NULL,
  `menuId` INT(11) NULL DEFAULT NULL,
  `cost` INT(11) NULL DEFAULT NULL,
  `buildingId` INT(11) NOT NULL,
  PRIMARY KEY (`outletId`, `buildingId`),
  INDEX `buildingNumber_idx` (`buildingId` ASC) VISIBLE,
  CONSTRAINT `buildingNumber_food`
    FOREIGN KEY (`buildingId`)
    REFERENCES `student_housing_management_system`.`building` (`buildingNumber`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`item` (
  `itemId` INT(11) NOT NULL,
  `itemName` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`itemId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`foodoutlet_has_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`foodoutlet_has_item` (
  `foodOutlets_outletId` INT(11) NOT NULL,
  `item_itemId` INT(11) NOT NULL,
  PRIMARY KEY (`foodOutlets_outletId`, `item_itemId`),
  INDEX `fk_foodOutlets_has_item_item1_idx` (`item_itemId` ASC) VISIBLE,
  INDEX `fk_foodOutlets_has_item_foodOutlets1_idx` (`foodOutlets_outletId` ASC) VISIBLE,
  CONSTRAINT `fk_foodOutlets_has_item_foodOutlets1`
    FOREIGN KEY (`foodOutlets_outletId`)
    REFERENCES `student_housing_management_system`.`foodoutlet` (`outletId`),
  CONSTRAINT `fk_foodOutlets_has_item_item1`
    FOREIGN KEY (`item_itemId`)
    REFERENCES `student_housing_management_system`.`item` (`itemId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`stafftype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`stafftype` (
  `typeId` INT(11) NOT NULL,
  `typeName` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`typeId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`staff` (
  `staffId` INT(11) NOT NULL,
  `buildingNumber` INT(11) NOT NULL,
  `staffFirstName` VARCHAR(90) NULL DEFAULT NULL,
  `staffLastName` VARCHAR(45) NULL DEFAULT NULL,
  `typeId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`staffId`, `buildingNumber`),
  INDEX `buildingNumber_idx` (`buildingNumber` ASC) VISIBLE,
  INDEX `typeID_idx` (`typeId` ASC) VISIBLE,
  CONSTRAINT `buildingNumber`
    FOREIGN KEY (`buildingNumber`)
    REFERENCES `student_housing_management_system`.`building` (`buildingNumber`),
  CONSTRAINT `typeID`
    FOREIGN KEY (`typeId`)
    REFERENCES `student_housing_management_system`.`stafftype` (`typeId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`foodoutlet_has_staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`foodoutlet_has_staff` (
  `foodOutlets_outletId` INT(11) NOT NULL,
  `staffInformation_staffId` INT(11) NOT NULL,
  PRIMARY KEY (`foodOutlets_outletId`, `staffInformation_staffId`),
  INDEX `fk_foodOutlets_has_staffInformation_staffInformation1_idx` (`staffInformation_staffId` ASC) VISIBLE,
  INDEX `fk_foodOutlets_has_staffInformation_foodOutlets1_idx` (`foodOutlets_outletId` ASC) VISIBLE,
  CONSTRAINT `fk_foodOutlets_has_staffInformation_foodOutlets1`
    FOREIGN KEY (`foodOutlets_outletId`)
    REFERENCES `student_housing_management_system`.`foodoutlet` (`outletId`),
  CONSTRAINT `fk_foodOutlets_has_staffInformation_staffInformation1`
    FOREIGN KEY (`staffInformation_staffId`)
    REFERENCES `student_housing_management_system`.`staff` (`staffId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`studentuniversityinformation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`studentuniversityinformation` (
  `studentId` INT(11) NOT NULL,
  `studentFirstName` VARCHAR(50) NULL DEFAULT NULL,
  `studentLastName` VARCHAR(50) NULL DEFAULT NULL,
  `dateOfBirth` DATE NULL DEFAULT NULL,
  `phoneNumber` CHAR(10) NULL DEFAULT NULL,
  `pointOfContactFirstName` VARCHAR(50) NULL DEFAULT NULL,
  `pointOfContactLastName` VARCHAR(50) NULL DEFAULT NULL,
  `pointOfContactNumber` CHAR(10) NULL DEFAULT NULL,
  `departmentId` INT(11) NULL DEFAULT NULL,
  `addressID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`studentId`),
  INDEX `departmentId_idx` (`departmentId` ASC) VISIBLE,
  INDEX `addressId_idx` (`addressID` ASC) VISIBLE,
  CONSTRAINT `addressId_ref`
    FOREIGN KEY (`addressID`)
    REFERENCES `student_housing_management_system`.`address` (`addressId`),
  CONSTRAINT `departmentId`
    FOREIGN KEY (`departmentId`)
    REFERENCES `student_housing_management_system`.`department` (`departmentId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`freetransportation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`freetransportation` (
  `studentId` INT(11) NOT NULL,
  `dropLocation` INT(11) NOT NULL,
  PRIMARY KEY (`studentId`, `dropLocation`),
  INDEX `dropLoc_idx` (`dropLocation` ASC) VISIBLE,
  CONSTRAINT `dropLoc`
    FOREIGN KEY (`dropLocation`)
    REFERENCES `student_housing_management_system`.`building` (`buildingNumber`),
  CONSTRAINT `studentId_transport`
    FOREIGN KEY (`studentId`)
    REFERENCES `student_housing_management_system`.`studentuniversityinformation` (`studentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`login` (
  `id` INT(11) NOT NULL,
  `timestamp` TIMESTAMP(6) NULL DEFAULT NULL,
  INDEX `id_student` (`id` ASC) VISIBLE,
  CONSTRAINT `id_staff`
    FOREIGN KEY (`id`)
    REFERENCES `student_housing_management_system`.`staff` (`staffId`),
  CONSTRAINT `id_student`
    FOREIGN KEY (`id`)
    REFERENCES `student_housing_management_system`.`studentuniversityinformation` (`studentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`mealplan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`mealplan` (
  `planId` INT(11) NOT NULL,
  `studentId` INT(11) NULL DEFAULT NULL,
  `term` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`planId`),
  INDEX `studentId_idx` (`studentId` ASC) VISIBLE,
  CONSTRAINT `studentId_meal`
    FOREIGN KEY (`studentId`)
    REFERENCES `student_housing_management_system`.`studentuniversityinformation` (`studentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`payment` (
  `paymentId` INT(11) NOT NULL,
  `studentId` INT(11) NOT NULL,
  `paymentDate` DATE NULL DEFAULT NULL,
  `monthlyFees` DECIMAL(4,0) NULL DEFAULT NULL,
  `paymentStatus` VARCHAR(45) NULL DEFAULT NULL,
  `fineImposed` DECIMAL(4,0) NULL DEFAULT NULL,
  PRIMARY KEY (`paymentId`, `studentId`),
  INDEX `studentId_idx` (`studentId` ASC) VISIBLE,
  CONSTRAINT `studentId_payment`
    FOREIGN KEY (`studentId`)
    REFERENCES `student_housing_management_system`.`studentuniversityinformation` (`studentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`room` (
  `roomNumber` INT(11) NOT NULL,
  `studentId` INT(11) NOT NULL,
  `bedId` INT(11) NULL DEFAULT NULL,
  `type` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`roomNumber`, `studentId`),
  INDEX `studentId_idx` (`studentId` ASC) VISIBLE,
  INDEX `bedId_idx` (`bedId` ASC) VISIBLE,
  CONSTRAINT `bedId`
    FOREIGN KEY (`bedId`)
    REFERENCES `student_housing_management_system`.`bed` (`bedId`),
  CONSTRAINT `studentId_ref`
    FOREIGN KEY (`studentId`)
    REFERENCES `student_housing_management_system`.`studentuniversityinformation` (`studentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`studentdorminfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`studentdorminfo` (
  `roomNumber` INT(11) NULL DEFAULT NULL,
  `buildingNumber` INT(11) NULL DEFAULT NULL,
  `studentId` INT(11) NOT NULL,
  PRIMARY KEY (`studentId`),
  INDEX `studentId_idx` (`studentId` ASC) VISIBLE,
  CONSTRAINT `studentId`
    FOREIGN KEY (`studentId`)
    REFERENCES `student_housing_management_system`.`studentuniversityinformation` (`studentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`utilities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`utilities` (
  `utilityId` INT(11) NOT NULL,
  `utilityType` VARCHAR(45) NULL DEFAULT NULL,
  `plan` VARCHAR(45) NULL DEFAULT NULL,
  `cost` DECIMAL(4,0) NULL DEFAULT NULL,
  `studentId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`utilityId`),
  INDEX `studentId_idx` (`studentId` ASC) VISIBLE,
  CONSTRAINT `studentId_utilities`
    FOREIGN KEY (`studentId`)
    REFERENCES `student_housing_management_system`.`studentuniversityinformation` (`studentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `student_housing_management_system`.`visitor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_housing_management_system`.`visitor` (
  `visitorFirstName` VARCHAR(50) NOT NULL,
  `visitorLastName` VARCHAR(45) NULL DEFAULT NULL,
  `studentId` INT(11) NOT NULL,
  `visitorRelationship` VARCHAR(45) NULL DEFAULT NULL,
  `dateOfMeeting` DATE NULL DEFAULT NULL,
  `dateOfExit` DATE NULL DEFAULT NULL,
  `inTime` TIME NULL DEFAULT NULL,
  `outTime` TIME NULL DEFAULT NULL,
  `buildingId` INT(11) NOT NULL,
  `isAdult` CHAR(1) NULL DEFAULT NULL,
  `purposeOfVisit` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`visitorFirstName`, `studentId`, `buildingId`),
  INDEX `studentId_idx` (`studentId` ASC) VISIBLE,
  INDEX `buildingId_idx` (`buildingId` ASC) VISIBLE,
  CONSTRAINT `buildingId`
    FOREIGN KEY (`buildingId`)
    REFERENCES `student_housing_management_system`.`building` (`buildingNumber`),
  CONSTRAINT `studentId_ref_visitor`
    FOREIGN KEY (`studentId`)
    REFERENCES `student_housing_management_system`.`studentuniversityinformation` (`studentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
