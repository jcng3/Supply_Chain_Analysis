# Supply_Chain_Analysis

## 📌 Executive Summary
This project analyzes **180,000+ supply chain records** from DataCo to identify core operational bottlenecks, quantify financial losses driven by late deliveries, and calculate On-Time In-Full (OTIF) service levels across global logistics routes.

## 🛠️ Tech Stack & Tools
* **Database:** PostgreSQL (Schema Design, Aggregations, Window Functions)
* **Client Tool:** pgAdmin 4
* **Visualization:** Tableau Public (In Progress)
* **Methodology:** Lean Six Sigma / Operational Efficiency Focus

## 📊 Key Operational Metrics & Findings
* **On-Time In-Full (OTIF) Rate:** Evaluated fulfillment delay percentages across Standard, First Class, and Same Day shipping modes.
* **Financial Loss Impact:** Quantified profit margin variations between late and on-time order fulfillment.
* **Geographic Bottlenecks:** Ranked regional shipping delays (Actual Days vs. Scheduled Lead Time).

## 📁 Repository Structure
```text
├── sql/
│   ├── 01_dataco_operational_kpis.sql       # Baseline OTIF, profit impact, and delays
│   ├── 02_dataco_root_cause_analysis.sql   # Diagnostic queries, Pareto analysis & rankings
│   └── 03_dataco_views.sql                 # Production SQL views for BI integration
└── README.md                                # Executive summary & case study
