-- STEPS TO CREATE THE DATABASE



-- CREATE A NEW DATABASE

CREATE DATABASE p2_population;



-- CREATE TABLES

CREATE TABLE `district`(
    `district_code` INT(3),
	`district_name` VARCHAR(30),
    `neig_code`INT(3), PRIMARY KEY (ID),
    `neig_name` VARCHAR(50)
    );

CREATE TABLE `nationality`(
	`ID` INT(5) AUTO_INCREMENT, PRIMARY KEY (ID),
    `year` YEAR,
    `nationality` VARCHAR(30),
    `immigrants` INT(6),
    `neig_code`INT(3),
    );
	
CREATE TABLE `gender`(
    `ID` INT(5) AUTO_INCREMENT, PRIMARY KEY (ID),
    `year` YEAR,
    `gender` VARCHAR(10),
    `immigrants` INT(6),
    `neig_code`INT(3),
    );
	
CREATE TABLE `age`(
    `ID` INT(5) AUTO_INCREMENT, PRIMARY KEY (ID),
    `year` YEAR,
    `age` VARCHAR(6),
    `immigrants` INT(6),
    `neig_code`INT(3),
    );

ALTER TABLE `nationality` ADD FOREIGN KEY (`neig_code`) REFERENCES `district`(`neig_code`);
ALTER TABLE `gender` ADD FOREIGN KEY (`neig_code`) REFERENCES `district`(`neig_code`);
ALTER TABLE `age` ADD FOREIGN KEY (`neig_code`) REFERENCES `district`(`neig_code`);



-- SEED MASTER TABLE DISTRICTS

-- -- IMPORT ORIGINAL CSV TO JUPYTER NOTEBOOK: Create_CSV_for_DB_seed.ipynb
-- -- EXPORT CSV TO SEED THE FOUR TABLES IN THE DB




