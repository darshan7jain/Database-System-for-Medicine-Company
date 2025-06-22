-- Insert data into Doctor
INSERT INTO Doctor VALUES
('101', 'Dr.Sandesh', 'Cardiology', 15),
('102', 'Dr.Shlok', 'Neurology', 10),
('103', 'Dr.Krishna', 'Dermatology', 7),
('104', 'Dr.Darshan', 'Pediatrics', 12),
('105', 'Dr.Dhruv', 'Oncology', 20);

-- Insert data into Patient
INSERT INTO Patient VALUES
('201', 'Akshat', 'Delhi', 25, '101'),
('202', 'Swastik', 'Mumbai', 34, '102'),
('203', 'Devang', 'Hyderabad', 40, '103'),
('204', 'Madhav', 'Kolkata', 28, '104'),
('205', 'Pranav', 'Chennai', 50, '105');

-- Insert data into PharmaceuticalCompany
INSERT INTO PharmaceuticalCompany VALUES
('PharmaOne', '1234567890'),
('MediCure', '2345678901'),
('LifeHeal', '3456789012'),
('BioGenics', '4567890123'),
('CureWell', '5678901234');

-- Insert data into Drug
INSERT INTO Drug VALUES
('Aspirin', 'PharmaOne', 'Acetylsalicylic Acid'),
('NeuroFast', 'MediCure', 'Gabapentin'),
('DermaGlow', 'LifeHeal', 'Hydroquinone + Tretinoin'),
('KidCare', 'BioGenics', 'Amoxicillin'),
('OncoFix', 'CureWell', 'Imatinib');

-- Insert data into Pharmacy
INSERT INTO Pharmacy VALUES
('MediPlus', 'Andheri West, Mumbai', '9876543210'),
('HealthCare Hub', 'Sector 22, Noida', '8765432109'),
('CureMart', 'MG Road, Bengaluru', '7654321098'),
('LifeMeds', 'Salt Lake, Kolkata', '6543210987'),
('Wellness Store', 'T Nagar, Chennai', '5432109876');

-- Insert data into Sells
INSERT INTO Sells VALUES
('MediPlus', 'Andheri West, Mumbai', 'Aspirin', 10.50),
('HealthCare Hub', 'Sector 22, Noida', 'NeuroFast', 25.00),
('CureMart', 'MG Road, Bengaluru', 'DermaGlow', 45.75),
('LifeMeds', 'Salt Lake, Kolkata', 'KidCare', 18.20),
('Wellness Store', 'T Nagar, Chennai', 'OncoFix', 150.00);

-- Insert data into Prescribes
INSERT INTO Prescribes VALUES
('201', '101', 'Aspirin', '2025-04-01', 10),
('202', '102', 'NeuroFast', '2025-04-02', 20),
('203', '103', 'DermaGlow', '2025-04-03', 15),
('204', '104', 'KidCare', '2025-04-04', 5),
('205', '105', 'OncoFix', '2025-04-05', 2);

-- Insert data into Contract
INSERT INTO Contract VALUES
  ('PharmaOne',  'MediPlus',       'Andheri West, Mumbai', '2024-01-01', '2025-01-01', 'Supply of painkillers',         '101'),
  ('MediCure',   'HealthCare Hub', 'Sector 22, Noida',     '2024-02-01', '2025-02-01', 'Neurology drugs contract',      '102'),
  ('LifeHeal',   'CureMart',       'MG Road, Bengaluru',   '2024-03-01', '2025-03-01', 'Skin medication supply',        '103'),
  ('BioGenics',  'LifeMeds',       'Salt Lake, Kolkata',   '2024-04-01', '2025-04-01', 'Pediatric drug supply',         '104'),
  ('CureWell',   'Wellness Store', 'T Nagar, Chennai',     '2024-05-01', '2025-05-01', 'Cancer medication supply',      '105');
