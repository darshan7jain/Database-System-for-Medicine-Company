DELIMITER //

-- ADD Procedures

CREATE PROCEDURE AddPharmacy(IN name VARCHAR(100), IN address VARCHAR(100), IN phone VARCHAR(15))
BEGIN
    INSERT INTO Pharmacy (PharmacyName, PharmacyAddress, PhoneNumber)
    VALUES (name, address, phone);
END //

CREATE PROCEDURE AddPharmaCompany(IN name VARCHAR(30), IN phone VARCHAR(15))
BEGIN
    INSERT INTO PharmaceuticalCompany (CoName, PhoneNumber)
    VALUES (name, phone);
END //

CREATE PROCEDURE AddDoctor(IN aadhar CHAR(12), IN name VARCHAR(50), IN specialization VARCHAR(100), IN experience INT)
BEGIN
    INSERT INTO Doctor (dAadharID, dName, Specialization, Experience)
    VALUES (aadhar, name, specialization, experience);
END //

CREATE PROCEDURE AddPatient(IN aadhar CHAR(12), IN name VARCHAR(50), IN address VARCHAR(200), IN age INT, IN physician CHAR(12))
BEGIN
    INSERT INTO Patient (pAadharID, pName, pAddress, Age, PrimaryPhysicianID)
    VALUES (aadhar, name, address, age, physician);
END //

CREATE PROCEDURE AddDrug(IN name VARCHAR(30), IN formula TEXT, IN company VARCHAR(30))
BEGIN
    INSERT INTO Drug (TradeName, Formula, CoName)
    VALUES (name, formula, company);
END //

CREATE PROCEDURE AddContract(IN company VARCHAR(30), IN name VARCHAR(100), IN address VARCHAR(100), IN startDate DATE, IN endDate DATE, IN content TEXT, IN supervisor CHAR(12))
BEGIN
    INSERT INTO Contract (CompanyName, PharmacyName, PharmacyAddress, StartDate, EndDate, Content, SupervisorID)
    VALUES (company, name, address, startDate, endDate, content, supervisor);
END //
DROP PROCEDURE IF EXISTS AddPrescription //
 CREATE PROCEDURE AddPrescription(IN pAID CHAR(12), IN dAID CHAR(12), IN Drug VARCHAR(30), IN prDate DATE, IN Qantity INT)
 BEGIN
     INSERT INTO Contract (pAadharID, dAadharID, DrugName, prescriptionDate, Qty)
     VALUES (pAID, dAID, Drug, prDate, Qantity);
 END //
 
 DROP PROCEDURE IF EXISTS AddSellsData //
 CREATE PROCEDURE AddSellsData(IN PhName VARCHAR(50), IN PhAddr VARCHAR(100), IN drug VARCHAR(30), IN price DECIMAL(10, 2))
 BEGIN
     INSERT INTO Contract (PharmacyName, Phloc, DrugName, Price)
     VALUES (PhName, PhAddr, drug, price);
 END //
DELIMITER //

-- UpdatePharmacy: Update phone number, name, or address based on current name and address
CREATE PROCEDURE UpdatePharmacy(
    IN currentName VARCHAR(100),
    IN currentAddress VARCHAR(100),
    IN newName VARCHAR(100),
    IN newAddress VARCHAR(100),
    IN newPhone VARCHAR(15)
)
BEGIN
    UPDATE Pharmacy
    SET PharmacyName = newName,
        PharmacyAddress = newAddress,
        PhoneNumber = newPhone
    WHERE PharmacyName = currentName AND PharmacyAddress = currentAddress;
END //

-- UpdatePharmaCompany: Update name or phone based on current name
CREATE PROCEDURE UpdatePharmaCompany(
    IN currentName VARCHAR(30),
    IN newName VARCHAR(30),
    IN newPhone VARCHAR(15)
)
BEGIN
    UPDATE PharmaceuticalCompany
    SET CoName = newName,
        PhoneNumber = newPhone
    WHERE CoName = currentName;
END //

-- UpdateDoctor: Update name, specialization, or experience
CREATE PROCEDURE UpdateDoctor(
    IN aadhar CHAR(12),
    IN newName VARCHAR(50),
    IN newSpecialization VARCHAR(100),
    IN newExperience INT
)
BEGIN
    UPDATE Doctor
    SET dName = newName,
        Specialization = newSpecialization,
        Experience = newExperience
    WHERE dAadharID = aadhar;
END //

-- UpdatePatient: Update name, address, age, or primary physician
CREATE PROCEDURE UpdatePatient(
    IN aadhar CHAR(12),
    IN newName VARCHAR(50),
    IN newAddress VARCHAR(200),
    IN newAge INT,
    IN newPhysician CHAR(12)
)
BEGIN
    UPDATE Patient
    SET pName = newName,
        pAddress = newAddress,
        Age = newAge,
        PrimaryPhysicianID = newPhysician
    WHERE pAadharID = aadhar;
END //

-- UpdateDrug: Update formula or associated company
CREATE PROCEDURE UpdateDrug(
    IN name VARCHAR(30),
    IN newFormula TEXT,
    IN newCompany VARCHAR(30)
)
BEGIN
    UPDATE Drug
    SET Formula = newFormula,
        CoName = newCompany
    WHERE TradeName = name;
END //

-- UpdateContract: Update contract details
CREATE PROCEDURE UpdateContract(
    IN company VARCHAR(30),
    IN name VARCHAR(100),
    IN address VARCHAR(100),
    IN newStartDate DATE,
    IN newEndDate DATE,
    IN newContent TEXT,
    IN newSupervisor CHAR(12)
)
BEGIN
    UPDATE Contract
    SET StartDate = newStartDate,
        EndDate = newEndDate,
        Content = newContent,
        SupervisorID = newSupervisor
    WHERE CompanyName = company AND PharmacyName = name AND PharmacyAddress = address;
END //

DELIMITER ;

-- DELETE Procedures

CREATE PROCEDURE DeleteDoctor(IN aadhar CHAR(12))
BEGIN
    DELETE FROM Doctor WHERE dAadharID = aadhar;
END //

CREATE PROCEDURE DeletePharmacy(IN name VARCHAR(100), IN address VARCHAR(100))
BEGIN
    DELETE FROM Pharmacy WHERE PharmacyName = name AND PharmacyAddress = address;
END //

    
 DROP PROCEDURE IF EXISTS DeletePatient //
 CREATE PROCEDURE DeletePatient(IN aadhar CHAR(12))
 BEGIN
     DELETE FROM Patient WHERE pAadharID = aadhar;
 END //
 
 DROP PROCEDURE IF EXISTS DeletePharmaCo //
 CREATE PROCEDURE DeletePharmaCo(IN companyName VARCHAR(30))
 BEGIN
     DELETE FROM PharmaceuticalCompany WHERE CoName = companyName;
 END //
 
 DROP PROCEDURE IF EXISTS DeleteDrug //
 CREATE PROCEDURE DeleteDrug(IN tradeName VARCHAR(30), IN companyName VARCHAR(30))
 BEGIN
     DELETE FROM Drug WHERE TradeName = tradeName AND CoName = companyName;
 END //
 
 DROP PROCEDURE IF EXISTS DeleteSells //
 CREATE PROCEDURE DeleteSells(
     IN pharmacyName VARCHAR(50),
     IN pharmacyLoc VARCHAR(100),
     IN drugName VARCHAR(30)
 )
 BEGIN
     DELETE FROM Sells 
     WHERE PharmacyName = pharmacyName AND Phloc = pharmacyLoc AND DrugName = drugName;
 END //
 
 DROP PROCEDURE IF EXISTS DeletePrescription //
 CREATE PROCEDURE DeletePrescription(
     IN patientID CHAR(12),
     IN doctorID CHAR(12),
     IN drugName VARCHAR(30)
 )
 BEGIN
     DELETE FROM Prescribes 
     WHERE pAadharID = patientID AND dAadharID = doctorID AND DrugName = drugName;
 END //
 
 DROP PROCEDURE IF EXISTS DeleteContract //
 CREATE PROCEDURE DeleteContract(
     IN pharmacyName VARCHAR(100),
     IN pharmacyAddress VARCHAR(100),
     IN companyName VARCHAR(30)
 )
 BEGIN
     DELETE FROM Contract 
     WHERE PharmacyName = pharmacyName AND PharmacyAddress = pharmacyAddress AND CompanyName = companyName;
 END //
-- Reporting Procedures

CREATE PROCEDURE PrescriptionsByPatientPeriod(IN patientID CHAR(12), IN fromDate DATE, IN toDate DATE)
BEGIN
    SELECT * FROM Prescribes
    WHERE pAadharID = patientID AND prescriptionDate BETWEEN fromDate AND toDate;
END //

CREATE PROCEDURE PrescriptionDetailsByDate(IN patientID CHAR(12), IN prescDate DATE)
BEGIN
    SELECT * FROM Prescribes
    WHERE pAadharID = patientID AND prescriptionDate = prescDate;
END //

CREATE PROCEDURE DrugsByCompany(IN companyName VARCHAR(30))
BEGIN
    SELECT TradeName, Formula FROM Drug
    WHERE CoName = companyName;
END //

CREATE PROCEDURE StockByPharmacy(IN name VARCHAR(50), IN location VARCHAR(100))
BEGIN
    SELECT DrugName, Price FROM Sells
    WHERE PharmacyName = name AND Phloc = location;
END //

CREATE PROCEDURE ContactDetailsPharmacyPharma(IN name VARCHAR(100), IN address VARCHAR(100), IN company VARCHAR(30))
BEGIN
    SELECT * FROM Contract
    WHERE PharmacyName = name AND PharmacyAddress = address AND CompanyName = company;
END //

CREATE PROCEDURE PatientsByDoctor(IN doctorID CHAR(12))
BEGIN
    SELECT pName, pAadharID FROM Patient
    WHERE PrimaryPhysicianID = doctorID;
END //
    
CREATE PROCEDURE AddPrescription(
    IN p_patientID CHAR(12),
    IN p_doctorID CHAR(12),
    IN p_drugName VARCHAR(30),
    IN p_date DATE,
    IN p_quantity INT
)
BEGIN
    -- Check if a prescription from this doctor to this patient for this drug already exists
    DECLARE existing_count INT;
    SELECT COUNT(*) INTO existing_count
    FROM Prescribes
    WHERE pAadharID = p_patientID AND dAadharID = p_doctorID AND DrugName = p_drugName;
    
    IF existing_count > 0 THEN
        -- Update existing prescription with latest information
        UPDATE Prescribes
        SET prescriptionDate = p_date, Qty = p_quantity
        WHERE pAadharID = p_patientID AND dAadharID = p_doctorID AND DrugName = p_drugName;
    ELSE
        -- Insert new prescription
        INSERT INTO Prescribes (pAadharID, dAadharID, DrugName, prescriptionDate, Qty)
        VALUES (p_patientID, p_doctorID, p_drugName, p_date, p_quantity);
    END IF;
END //

-- Create procedure to view latest prescriptions for a patient
CREATE PROCEDURE LatestPrescriptionsForPatient(IN p_patientID CHAR(12))
BEGIN
    SELECT p.DrugName, p.dAadharID, d.dName as DoctorName, p.prescriptionDate, p.Qty
    FROM Prescribes p
    JOIN Doctor d ON p.dAadharID = d.dAadharID
    WHERE p.pAadharID = p_patientID
    ORDER BY p.prescriptionDate DESC;
END //

DELIMITER ;
