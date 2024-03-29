-- MySQL Script generated by MySQL Workbench
-- Sat Oct 11 01:40:55 2014
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ustadridwan
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ustadridwan
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ustadridwan` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ustadridwan` ;

-- -----------------------------------------------------
-- Table `ustadridwan`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ustadridwan`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(100) NULL,
  `user_password` VARCHAR(100) NULL,
  `user_full_name` VARCHAR(100) NULL,
  `user_description` TEXT NULL,
  `user_freeze` TINYINT(1) NULL DEFAULT 0,
  `user_role` ENUM('1','2') NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ustadridwan`.`posting_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ustadridwan`.`posting_category` (
  `post_cat_id` INT NOT NULL AUTO_INCREMENT,
  `post_cat_name` VARCHAR(100) NULL,
  PRIMARY KEY (`post_cat_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ustadridwan`.`posting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ustadridwan`.`posting` (
  `posting_id` INT NOT NULL AUTO_INCREMENT,
  `posting_title` VARCHAR(255) NULL,
  `posting_content` TEXT NULL,
  `posting_category` INT NOT NULL,
  `posting_date` DATE NULL,
  `posting_is_publish` TINYINT(1) NULL DEFAULT 1,
  `author_user_id` INT NOT NULL,
  `posting_image` VARCHAR(100) NULL,
  PRIMARY KEY (`posting_id`),
  INDEX `fk_posting_user_idx` (`author_user_id` ASC),
  INDEX `fk_posting_posting_category1_idx` (`posting_category` ASC),
  CONSTRAINT `fk_posting_user`
    FOREIGN KEY (`author_user_id`)
    REFERENCES `ustadridwan`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posting_posting_category1`
    FOREIGN KEY (`posting_category`)
    REFERENCES `ustadridwan`.`posting_category` (`post_cat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ustadridwan`.`event_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ustadridwan`.`event_category` (
  `event_category_id` INT NOT NULL AUTO_INCREMENT,
  `event_category_name` VARCHAR(100) NULL,
  PRIMARY KEY (`event_category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ustadridwan`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ustadridwan`.`event` (
  `event_id` INT NOT NULL AUTO_INCREMENT,
  `event_title` VARCHAR(100) NULL,
  `event_description` TEXT NULL,
  `event_date_start` DATE NULL,
  `event_date_end` DATE NULL,
  `event_location` VARCHAR(255) NULL,
  `event_is_publish` TINYINT(1) NULL DEFAULT 1,
  `event_category_id` INT NOT NULL,
  PRIMARY KEY (`event_id`),
  INDEX `fk_event_event_category1_idx` (`event_category_id` ASC),
  CONSTRAINT `fk_event_event_category1`
    FOREIGN KEY (`event_category_id`)
    REFERENCES `ustadridwan`.`event_category` (`event_category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ustadridwan`.`question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ustadridwan`.`question` (
  `question_id` INT NOT NULL AUTO_INCREMENT,
  `question_name` VARCHAR(100) NULL,
  `question_email` VARCHAR(100) NULL,
  `question_title` VARCHAR(255) NULL,
  `question_content` TEXT NULL,
  `question_is_publish` TINYINT(1) NULL DEFAULT 0,
  `question_date` DATE NULL,
  PRIMARY KEY (`question_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ustadridwan`.`gallery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ustadridwan`.`gallery` (
  `gallery_id` INT NOT NULL AUTO_INCREMENT,
  `gallery_title` VARCHAR(255) NULL,
  `gallery_description` TEXT NULL,
  `gallery_image` VARCHAR(100) NULL,
  `gallery_is_publish` TINYINT(1) NULL DEFAULT 1,
  `gallery_type` ENUM('foto','video') NULL,
  PRIMARY KEY (`gallery_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ustadridwan`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ustadridwan`.`store` (
  `store_id` INT NOT NULL AUTO_INCREMENT,
  `store_name` VARCHAR(45) NULL,
  `store_description` VARCHAR(45) NULL,
  PRIMARY KEY (`store_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ustadridwan`.`store_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ustadridwan`.`store_image` (
  `store_image_id` INT NOT NULL AUTO_INCREMENT,
  `store_image` VARCHAR(100) NULL,
  `store_id` INT NOT NULL,
  PRIMARY KEY (`store_image_id`),
  INDEX `fk_store_image_store1_idx` (`store_id` ASC),
  CONSTRAINT `fk_store_image_store1`
    FOREIGN KEY (`store_id`)
    REFERENCES `ustadridwan`.`store` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ustadridwan`.`profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ustadridwan`.`profile` (
  `profile_id` INT NOT NULL AUTO_INCREMENT,
  `profile_full_name` VARCHAR(100) NULL,
  `profile_address` TEXT NULL,
  `profile_study` TEXT NULL,
  `profile_activity` TEXT NULL,
  `profile_description` TEXT NULL,
  `profile_organisation` TEXT NULL,
  `profile_image` VARCHAR(100) NULL,
  PRIMARY KEY (`profile_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ustadridwan`.`activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ustadridwan`.`activity` (
  `activity_id` INT NOT NULL AUTO_INCREMENT,
  `activity_user` INT NOT NULL,
  `activity_what` TEXT NULL,
  `activity_date` DATE NULL,
  PRIMARY KEY (`activity_id`),
  INDEX `fk_activity_user1_idx` (`activity_user` ASC),
  CONSTRAINT `fk_activity_user1`
    FOREIGN KEY (`activity_user`)
    REFERENCES `ustadridwan`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
