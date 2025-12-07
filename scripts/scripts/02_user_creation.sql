CREATE USER mon_27383_Anitha_minewaste
IDENTIFIED BY Anitha
DEFAULT TABLESPACE minewaste_data
TEMPORARY TABLESPACE minewaste_temp
QUOTA UNLIMITED ON minewaste_data
QUOTA UNLIMITED ON minewaste_index;

-- Super admin–level privileges for project
GRANT CONNECT, RESOURCE TO mon_27383_Anitha_minewaste;
GRANT CREATE TABLE, CREATE VIEW, CREATE SEQUENCE,
      CREATE PROCEDURE, CREATE TRIGGER TO mon_27383_Anitha_minewaste;
