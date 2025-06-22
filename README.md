First run initialize_tables.sql, then procedures.sql and then data.sql

You can use these procedure calls
1. CALL DrugsByCompany('PharmaOne');
2. CALL StockByPharmacy('MediPlus','Andheri West, Mumbai');
3. CALL PrescriptionsByPatientPeriod('202','2024-03-01','2026-05-06');
4. CALL DrugsByCompany('MediCure');
5. CALL ContactDetailsPharmacyPharma('Citymed','Mumbai Central','Medilife');
6. CALL ContactDetailsPharmacyPharma('CureMart','MG Road, Bengaluru','LifeHeal');
7. CALL PatientsByDoctor('101');
8. CALL PatientsByDoctor('102');
