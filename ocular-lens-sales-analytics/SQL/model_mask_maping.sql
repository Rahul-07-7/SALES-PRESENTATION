DROP VIEW IF EXISTS vw_master_sales;

CREATE VIEW vw_master_sales AS
SELECT 
    COALESCE(UPPER(TRIM(d."CustomerName")), 'DIRECT / UNKNOWN') AS party_name,
    d."IssuedDate" AS sale_date,
    COALESCE(m.portfolio_model, TRIM(d."ModelNo")) AS product_id,
    1 AS quantity,
    CASE 
        WHEN RIGHT(TRIM(COALESCE(m.portfolio_model, d."ModelNo")), 1) = 'T' THEN 'Toric'
        ELSE 'Non Toric'
    END AS category,
    CASE 
        WHEN REPLACE(COALESCE(m.portfolio_model, d."ModelNo"), ' ', '') IN ('AOS43', 'AOS44', 'AOS53', 'AOS81', 'AOS82T', 'AOS66T', 'AOS41') THEN 'Group A Monofocal'
        WHEN REPLACE(COALESCE(m.portfolio_model, d."ModelNo"), ' ', '') IN ('AOS46', 'AOS47T', 'AOS45', 'ALTUS-T', 'ALTUS', 'AOS49T', 'AOS48') THEN 'Group B EDOF'
        WHEN REPLACE(COALESCE(m.portfolio_model, d."ModelNo"), ' ', '') IN ('AOS56', 'AOS57', 'AOS55') THEN 'Group C Multifocal'
        WHEN REPLACE(COALESCE(m.portfolio_model, d."ModelNo"), ' ', '') IN ('AOS52', 'AOS54', 'AOS51') THEN 'Group D Range'
        WHEN REPLACE(COALESCE(m.portfolio_model, d."ModelNo"), ' ', '') IN ('AOS59', 'AOS50', 'AOSXTND54', 'AOS79T', 'AOS78', 'AOS61', 'AOS58') THEN 'Group E XTND'
        ELSE 'Uncategorized'
    END AS family_group,
    d."BrandName" AS brand_name,
    d."Pow" AS power,
    d."PowSph" AS power_sph
FROM lensdata d
LEFT JOIN model_mask_mapping m ON TRIM(d."ModelNo") = m.original_model
WHERE d."IssuedDate" IS NOT NULL 
  AND d."ModelNo" IS NOT NULL;