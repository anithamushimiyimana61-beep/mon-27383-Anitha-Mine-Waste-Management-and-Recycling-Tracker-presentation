SELECT 
    TO_CHAR(TIMESTAMP, 'DAY') AS day_of_week,
    STATUS,
    COUNT(*) AS operation_count
FROM AUDIT_LOG
GROUP BY TO_CHAR(TIMESTAMP, 'DAY'), STATUS
ORDER BY day_of_week;
