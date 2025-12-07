BEGIN
  -- Tailings waste
  FOR i IN 1..15 LOOP
    INSERT INTO MINE_WASTE VALUES (waste_seq.NEXTVAL, 1001 + MOD(i, 25), 'Tailings', 
      ROUND(DBMS_RANDOM.VALUE(500, 5000), 2), 
      SYSDATE - DBMS_RANDOM.VALUE(1, 365), 
      CASE WHEN MOD(i, 3) = 0 THEN 'YES' ELSE 'NO' END);
  END LOOP;
  
  -- Overburden waste
  FOR i IN 1..15 LOOP
    INSERT INTO MINE_WASTE VALUES (waste_seq.NEXTVAL, 1001 + MOD(i, 25), 'Overburden', 
      ROUND(DBMS_RANDOM.VALUE(1000, 10000), 2), 
      SYSDATE - DBMS_RANDOM.VALUE(1, 365), 
      CASE WHEN MOD(i, 4) = 0 THEN 'YES' ELSE 'NO' END);
  END LOOP;
  
  -- Slag waste
  FOR i IN 1..15 LOOP
    INSERT INTO MINE_WASTE VALUES (waste_seq.NEXTVAL, 1001 + MOD(i, 25), 'Slag', 
      ROUND(DBMS_RANDOM.VALUE(200, 3000), 2), 
      SYSDATE - DBMS_RANDOM.VALUE(1, 365), 
      CASE WHEN MOD(i, 2) = 0 THEN 'YES' ELSE 'NO' END);
  END LOOP;
  
  -- Sludge waste
  FOR i IN 1..15 LOOP
    INSERT INTO MINE_WASTE VALUES (waste_seq.NEXTVAL, 1001 + MOD(i, 25), 'Sludge', 
      ROUND(DBMS_RANDOM.VALUE(100, 2000), 2), 
      SYSDATE - DBMS_RANDOM.VALUE(1, 365), 
      'NO');
  END LOOP;
  
  -- Rock waste
  FOR i IN 1..15 LOOP
    INSERT INTO MINE_WASTE VALUES (waste_seq.NEXTVAL, 1001 + MOD(i, 25), 'Rock Waste', 
      ROUND(DBMS_RANDOM.VALUE(800, 8000), 2), 
      SYSDATE - DBMS_RANDOM.VALUE(1, 365), 
      CASE WHEN MOD(i, 5) = 0 THEN 'YES' ELSE 'NO' END);
  END LOOP;
  
  -- Chemical waste
  FOR i IN 1..10 LOOP
    INSERT INTO MINE_WASTE VALUES (waste_seq.NEXTVAL, 1001 + MOD(i, 25), 'Chemical Waste', 
      ROUND(DBMS_RANDOM.VALUE(50, 500), 2), 
      SYSDATE - DBMS_RANDOM.VALUE(1, 365), 
      'NO');
  END LOOP;
  
  -- Metal scrap (recyclable)
  FOR i IN 1..15 LOOP
    INSERT INTO MINE_WASTE VALUES (waste_seq.NEXTVAL, 1001 + MOD(i, 25), 'Metal Scrap', 
      ROUND(DBMS_RANDOM.VALUE(100, 1500), 2), 
      SYSDATE - DBMS_RANDOM.VALUE(1, 365), 
      'YES');
  END LOOP;
  
  COMMIT;
END;
/

-- Insert RECYCLING (50 records for recyclable waste)
DECLARE
  v_waste_id NUMBER;
  v_supervisor_id NUMBER;
  v_quantity NUMBER;
BEGIN
  FOR rec IN (SELECT WASTE_ID, QUANTITY FROM MINE_WASTE WHERE IS_RECYCLABLE = 'YES' AND ROWNUM <= 50) LOOP
    v_supervisor_id := 201 + MOD(rec.WASTE_ID, 12);
    v_quantity := ROUND(rec.QUANTITY * DBMS_RANDOM.VALUE(0.5, 0.95), 2);
    
    INSERT INTO RECYCLING VALUES (
      recycling_seq.NEXTVAL,
      rec.WASTE_ID,
      v_supervisor_id,
      v_quantity,
      SYSDATE - DBMS_RANDOM.VALUE(1, 300)
    );
  END LOOP;
  COMMIT;
END;
/

-- Insert WASTE_DISPOSAL (70 records for non-recyclable and partially recycled waste)
DECLARE
  v_waste_id NUMBER;
  v_officer_id NUMBER;
  v_disposal_methods DBMS_SQL.VARCHAR2_TABLE;
BEGIN
  v_disposal_methods(1) := 'Landfill';
  v_disposal_methods(2) := 'Incineration';
  v_disposal_methods(3) := 'Containment';
  v_disposal_methods(4) := 'Neutralization';
  v_disposal_methods(5) := 'Encapsulation';
  v_disposal_methods(6) := 'Stabilization';
  
  FOR rec IN (SELECT WASTE_ID FROM MINE_WASTE WHERE ROWNUM <= 70) LOOP
    v_officer_id := 101 + MOD(rec.WASTE_ID, 15);
    
    INSERT INTO WASTE_DISPOSAL VALUES (
      disposal_seq.NEXTVAL,
      rec.WASTE_ID,
      v_officer_id,
      v_disposal_methods(MOD(rec.WASTE_ID, 6) + 1),
      SYSDATE - DBMS_RANDOM.VALUE(1, 330)
    );
  END LOOP;
  COMMIT;
END;
/
