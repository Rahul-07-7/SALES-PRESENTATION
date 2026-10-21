CREATE OR REPLACE VIEW view_expiry_health AS
SELECT 
    brandname,
    modelno,
    pow,
    (expdate::DATE - mfgdate::DATE) AS total_shelf_life_days,
    (expdate::DATE - issueddate::DATE) AS days_remaining_at_issue,
    CASE 
        WHEN (expdate::DATE - issueddate::DATE) < 180 THEN 'Critical (< 6 mos)'
        WHEN (expdate::DATE - issueddate::DATE) BETWEEN 180 AND 365 THEN 'Moderate (6-12 mos)'
        ELSE 'Healthy (> 1 yr)'
    END AS expiry_risk_category
FROM lens_dispatch
WHERE expdate IS NOT NULL AND issueddate IS NOT NULL;