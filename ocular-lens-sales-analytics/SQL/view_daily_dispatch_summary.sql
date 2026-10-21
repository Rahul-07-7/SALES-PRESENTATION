CREATE OR REPLACE VIEW view_daily_dispatch_summary AS
SELECT 
    issueddate::DATE AS issue_date,
    brandname,
    modelno,
    issuedby,
    COUNT(*) AS daily_volume,
    ROUND(AVG(pow)::NUMERIC, 2) AS avg_power
FROM lens_dispatch
WHERE issueddate IS NOT NULL
GROUP BY issueddate::DATE, brandname, modelno, issuedby;



