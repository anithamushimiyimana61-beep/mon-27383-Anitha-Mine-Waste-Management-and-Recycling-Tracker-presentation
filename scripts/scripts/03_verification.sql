-- Verify tablespaces
SELECT tablespace_name, status
FROM dba_tablespaces
WHERE tablespace_name LIKE 'MINEWASTE%';

-- Verify user
SELECT username, default_tablespace, temporary_tablespace
FROM dba_users
WHERE username = 'MON_27383_ANITHA_MINEWASTE';

-- Verify user tables
SELECT table_name FROM user_tables;
