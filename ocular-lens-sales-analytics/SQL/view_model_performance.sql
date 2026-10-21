
CREATE OR REPLACE VIEW view_model_performance AS
SELECT 
    "BrandName",
    "ModelNo",
    COUNT(*) AS units_dispatched,
    ROUND(AVG("Pow")::NUMERIC, 2) AS avg_dioptric_power
FROM lensdata
GROUP BY "BrandName", "ModelNo";