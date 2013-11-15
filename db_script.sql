SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `ud_poll` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ud_poll` ;

-- -----------------------------------------------------
-- Table `ud_poll`.`variant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ud_poll`.`variant` (
  `variant_id` INT NOT NULL AUTO_INCREMENT,
  `variant_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`variant_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ud_poll`.`vote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ud_poll`.`vote` (
  `vote_count` INT NULL,
  `vote_id` INT NOT NULL AUTO_INCREMENT,
  `vote_variant_id` INT NOT NULL,
  PRIMARY KEY (`vote_id`),
  INDEX `fk_vote_variant_idx` (`vote_variant_id` ASC),
  CONSTRAINT `fk_vote_variant`
    FOREIGN KEY (`vote_variant_id`)
    REFERENCES `ud_poll`.`variant` (`variant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
