CREATE TABLE IF NOT EXISTS model_mask_mapping (
    original_model VARCHAR(100) PRIMARY KEY,
    portfolio_model VARCHAR(100) NOT NULL
);

INSERT INTO model_mask_mapping (original_model, portfolio_model) VALUES
('AOS43', 'AOS 43'),
('AOS44', 'AOS 44'),
('AOS46', 'AOS 46'),
('AOS47T', 'AOS 47T'),
('AOS53', 'AOS 53'),
('AOS45', 'AOS 45'),
('AOS56', 'AOS 56'),
('AOS59', 'AOS 59'),
('AOS50', 'AOS 50'),
('AOS52', 'AOS 52'),
('ALTUS-T', 'ALTUS - T'),
('ALTUS', 'ALTUS'),
('AOS81', 'AOS81'),
('AOS54', 'AOS 54'),
('AOS61', 'AOS 61'),
('AOS57', 'AOS 57'),
('AOS49T', 'AOS 49T'),
('AOS82T', 'AOS 82T'),
('AOS51', 'AOS 51'),
('AOSXTND54', 'AOS XTND 54'),
('AOS66T', 'AOS 66T'),
('AOS48', 'AOS 48'),
('AOS79T', 'AOS 79T'),
('AOS78', 'AOS 78'),
('AOS55', 'AOS 55'),
('AOS58', 'AOS 58'),
('AOS41', 'AOS 41')
ON CONFLICT (original_model) DO NOTHING;

