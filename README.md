# Supply_Chain_Analysis

## 📌 Executive Summary
An end-to-end data analytics and business intelligence project evaluating global supply chain performance, On-Time In-Full (OTIF) fulfillment rates, financial revenue exposure, and regional operational bottlenecks using PostgreSQL, Advanced SQL, and Tableau Public.

## 🛠️ Tech Stack & Tools
* **Database & Querying:** PostgreSQL, pgAdmin 4
* **Data Modeling:** SQL Views (vw_dataco_executive_kpis) for pre-computed metrics and performance optimization
* **Visualization:** Tableau Public for visual analytics and dashboard interactivity
* **Version Control:** GitHub (Structured repository tracking SQL scripts and documentation)

## 📊 Key Operational Metrics & Findings
* **On-Time In-Full (OTIF) Rate:** Evaluated fulfillment delay percentages across Standard, First Class, and Same Day shipping modes.
* **Financial Loss Impact:** Quantified profit margin variations between late and on-time order fulfillment.
* **Geographic Bottlenecks:** Ranked regional shipping delays (Actual Days vs. Scheduled Lead Time).
* **Carrier Bottlenecks:** Compared scheduled lead times against actual transit durations across Consumer, Corporate, and Home Office segments.

## 📉 Interactive Tableau Dashboard
Explore the fully interactive **Supply Chain Analysis Dashboard** hosted on Tableau Public:
👉 [View Live Tableau Dashboard](https://public.tableau.com/views/SupplyChainAnaysis/1_1)

### Dashboard Preview & Key Findings
* **Executive Scorecard:** Tracks 180K+ total order volumes, global OTIF fulfillment rates, and revenue exposure tied to late delivery risks.
* **Pareto Bottleneck Analysis:** Highlights the top product categories (such as *Cleats* and *Men's Footwear*) driving the majority of operational delivery failures.
* **Regional Heatmap:** Identifies structural delay variances and carrier SLA bottlenecks across international markets and shipping tiers.

## 💡 Key Analytical Findings & Insights
* The 80/20 analysis revealed that just a handful of product categories (such as Cleats, Men's Footwear and Women's Apparel) account for the majority of the late delivery, indicating the need for targeted inventory replenishment strategies in those specific categories.
*  The lead time variance matrix and customer segment and carrier performance chart revealed that the second class shipping mode accounts for majority of late delivery, indicating the need for tiered visibility rather than treating all fulfillment modes equally.
*  Over 20M of revenue is exposed at risk tied directly to late delivery, which demonstrates proactive real-time monitoring is highly recommended to protect profit margins.
*  Abnormal data records are found. Same day shipping mode and standard class shipping mode column in the dataset might be swapped. As the overall value of same day delivery should be lower than standard class, while standard class value in the current dataset are lower than same day delivery mode. 

## 📁 Repository Structure
```text
├── sql/
│   ├── 01_dataco_operational_kpis.sql       # Baseline OTIF, profit impact, and delays
│   ├── 02_dataco_root_cause_analysis.sql    # Diagnostic queries, Pareto analysis & rankings
│   └── 03_dataco_views.sql                  # Production SQL views for BI integration
└── README.md                                # Executive summary & case study
```

## 🤖 AI Collaboration & Acknowledgments
This project was developed iteratively with the assistance of **Google Gemini** acting as a technical collaborator and sparring partner. AI-assisted workflows were utilized for:
* **SQL Architecture:** Structuring and refining complex diagnostic queries, CTEs, and production database views.
* **BI Strategy:** Designing the 4-part layout and calculating table expressions for the Tableau Public Control Tower.
* **Documentation:** Drafting clear, professional case study documentation for GitHub.

*All analytical decisions, query executions, design implementations, and validation were performed and verified by the author.*
