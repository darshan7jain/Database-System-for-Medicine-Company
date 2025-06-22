-- DBMS Project
-- source <file path>/<filename>.sql;
DROP DATABASE IF EXISTS NOVA;
create database NOVA;

FLUSH PRIVILEGES;
use NOVA;

DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS PharmaceuticalCompany;
DROP TABLE IF EXISTS Drug;
DROP TABLE IF EXISTS Pharmacy;
DROP TABLE IF EXISTS Sells;
DROP TABLE IF EXISTS Prescription;
DROP TABLE IF EXISTS Contract;

create table Doctor (
    dAadharID CHAR(12) PRIMARY KEY,
    dName VARCHAR(50) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    Experience INT NOT NULL CHECK (Experience >= 0)
);

create table Patient (
    pAadharID CHAR(12) PRIMARY KEY,
    pName VARCHAR(50) NOT NULL,
    pAddress VARCHAR(200) NOT NULL,
    Age INT NOT NULL CHECK (Age >= 0),
    PrimaryPhysicianID CHAR(12) NOT NULL,
    FOREIGN KEY (PrimaryPhysicianID) REFERENCES Doctor(dAadharID) ON DELETE RESTRICT
);


create table PharmaceuticalCompany (
    CoName VARCHAR(30) PRIMARY KEY,
    PhoneNumber VARCHAR(15) NOT NULL
);

create table Drug (
    TradeName VARCHAR(30),
    CoName VARCHAR(30),
    Formula TEXT NOT NULL,
    PRIMARY KEY (TradeName, CoName),
    FOREIGN KEY (CoName) REFERENCES PharmaceuticalCompany(CoName) ON DELETE CASCADE
);
CREATE TABLE Pharmacy (
    PharmacyName VARCHAR(100),
    PharmacyAddress VARCHAR(100),
    PhoneNumber VARCHAR(15) NOT NULL,
    PRIMARY KEY(PharmacyName,PharmacyAddress)
);

create table Sells (
    PharmacyName VARCHAR(50),
    Phloc VARCHAR(100),
    DrugName VARCHAR(30),
    Price DECIMAL(10, 2) NOT NULL CHECK (Price >= 0),
    PRIMARY KEY (PharmacyName, DrugName, Phloc),
    FOREIGN KEY (PharmacyName, Phloc) REFERENCES Pharmacy(PharmacyName,PharmacyAddress),
    FOREIGN KEY (DrugName) REFERENCES Drug(TradeName)
);


create table Prescribes (
    pAadharID CHAR(12),
    dAadharID CHAR(12),
    DrugName VARCHAR(30),
    prescriptionDate DATE,
    Qty INT,
    PRIMARY KEY (DrugName, pAadharID, dAadharID),
    FOREIGN KEY (DrugName) REFERENCES Drug(TradeName),
    FOREIGN KEY (pAadharID) REFERENCES Patient(pAadharID),
    FOREIGN KEY (dAadharID) REFERENCES Doctor(dAadharID)
);

CREATE TABLE Contract (
    CompanyName VARCHAR(30),
    PharmacyName VARCHAR(100),
    PharmacyAddress VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Content TEXT,
    SupervisorID CHAR(12),
    PRIMARY KEY (PharmacyName, CompanyName, PharmacyAddress),
    FOREIGN KEY (PharmacyName,PharmacyAddress) REFERENCES Pharmacy(PharmacyName,PharmacyAddress),
    FOREIGN KEY (CompanyName) REFERENCES PharmaceuticalCompany(CoName),
    FOREIGN KEY (SupervisorID) REFERENCES Doctor(dAadharID)
);

-- each Pharmacy sells at least 10 drugs
DELIMITER //
CREATE TRIGGER check_min_drugs 
AFTER DELETE ON Sells
FOR EACH ROW
BEGIN
    DECLARE drug_count INT;
    
    SELECT COUNT(*) INTO drug_count
    FROM Sells
    WHERE PharmacyName = OLD.PharmacyName;
    
    IF drug_count < 10 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Each pharmacy must sell at least 10 drugs';
    END IF;
END//

DELIMITER ;
