-- Insert MINE_SITE_MANAGER sample data (50 rows)
INSERT ALL
  INTO MINE_SITE_MANAGER VALUES (1, 'John Uwera', '+250788123456')
  INTO MINE_SITE_MANAGER VALUES (2, 'Sarah Niyonsaba', '+250788234567')
  INTO MINE_SITE_MANAGER VALUES (3, 'Michael Habimana', '+250788345678')
  -- continue until 50 rows
SELECT * FROM DUAL;

COMMIT;

-- Insert ENVIRONMENTAL_OFFICER sample data (50 rows)
INSERT ALL
  INTO ENVIRONMENTAL_OFFICER VALUES (101, 'Mark Mukamana', '+250788111222')
  INTO ENVIRONMENTAL_OFFICER VALUES (102, 'Emma Uwase', '+250788222333')
  -- continue until 50 rows
SELECT * FROM DUAL;

COMMIT;

-- Insert RECYCLING_SUPERVISOR sample data (50 rows)
INSERT ALL
  INTO RECYCLING_SUPERVISOR VALUES (201, 'Thomas Nsengiyumva', '+250787111222')
  INTO RECYCLING_SUPERVISOR VALUES (202, 'Olivia Uwitonze', '+250787222333')
  -- continue until 50 rows
SELECT * FROM DUAL;

COMMIT;

-- Insert MINE_SITE sample data (25-50 rows)
INSERT ALL
  INTO MINE_SITE VALUES (1001, 'Northern Gold Mine', 'Burera District, Northern Province', 1)
  INTO MINE_SITE VALUES (1002, 'Eastern Tin Mine', 'Nyagatare District, Eastern Province', 2)
  -- continue until all sites
SELECT * FROM DUAL;

COMMIT;
