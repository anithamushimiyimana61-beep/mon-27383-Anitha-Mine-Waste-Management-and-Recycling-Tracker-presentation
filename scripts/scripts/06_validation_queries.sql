-- 1. Verify all tables have data
SELECT table_name, COUNT(*) AS num_rows
FROM user_tables ut
JOIN user_tab_columns utc ON ut.table_name = utc.table_name
GROUP BY table_name;

-- 2. Check foreign key relationships
SELECT * FROM MINE_SITE ms
JOIN MINE_SITE_MANAGER msm ON ms.MANAGER_ID = msm.MANAGER_ID;

-- 3. Basic retrieval queries
SELECT * FROM RECYCLING_SUPERVISOR;

-- 4. Aggregations (example)
SELECT MANAGER_ID, COUNT(*) AS num_sites
FROM MINE_SITE
GROUP BY MANAGER_ID;

-- 5. Subqueries (example)
SELECT SITE_NAME
FROM MINE_SITE
WHERE MANAGER_ID IN (
    SELECT MANAGER_ID
    FROM MINE_SITE_MANAGER
    WHERE NAME LIKE 'John%'
);
