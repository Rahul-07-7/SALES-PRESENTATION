📊 Dashboard Structure

The Power BI dashboard is divided into targeted business workflows:

Page 1: Executive Sales Overview

High-level KPI cards, Toric vs. Non-Toric market share distribution (Donut Charts), and macro-level product volume analysis.

Page 2: Monthly Seasonality & Yearly Trends

Tracks fiscal year performance mapping (April-March). Features Time-Intelligence DAX to calculate Sales Last Year (LY) and dynamic YoY Growth % matrices with conditional formatting.

Page 3: Distributor (Party Name) CRM Performance

Ranks top-performing hospitals and distributors. Features 100% stacked bar charts detailing the adoption rate of premium Toric lenses per client.

Pages 4-9: Product Family Deep Dives

Page-level filtering isolates specific business units: Group A (Monofocal), Group B (EDOF), Group C (Multifocal), Group D (Range), and Group E (XTND). Tracks individual model lifecycles over multiple years.

💻 Key DAX Measures Developed

A custom MasterCalendar was built to align standard dates with the Indian Financial Year (FY). Core measures include:

// Fast Transaction Count
Total Actual Sales = COUNTROWS('vw_master_sales')

// Time Intelligence: Same Period Last Year
Sales LY = CALCULATE([Total Actual Sales], SAMEPERIODLASTYEAR('MasterCalendar'[Date]))

// Financial Variance
YoY Growth % = DIVIDE([Total Actual Sales] - [Sales LY], [Sales LY], 0)
