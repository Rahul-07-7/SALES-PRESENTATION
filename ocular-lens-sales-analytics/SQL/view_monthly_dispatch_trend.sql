CREATE OR REPLACE VIEW view_monthly_dispatch_trend AS
SELECT 
    DATE_TRUNC('month', "IssuedDate")::DATE AS dispatch_month,
    COUNT(*) AS total_dispatched,
    COUNT(DISTINCT "ModelNo") AS active_models
FROM lensdata
WHERE "IssuedDate" IS NOT NULL
GROUP BY DATE_TRUNC('month', "IssuedDate")::DATE;
