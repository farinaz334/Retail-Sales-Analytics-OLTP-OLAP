# Sales Performance and Revenue Optimization 
This dashboard was created to explore retail sales data across the 7 largest Eastern U.S. states using transactional records from the” WideWorldImporters” database. The goal was to answer real business questions around declining sales, underperforming regions, and customer revenue contribution, while laying the groundwork for future dashboard-based insights..

## Questions addressed in the analysis:
- Which regions in the Eastern U.S. are experiencing sales declines?
- Which products are generating low revenue and may need attention?
- Which customer categories contribute most to revenue?
- Are there seasonal patterns in sales that impact performance?
- How can we compare sales across different years or quarters?

## Process (OLTP):
- Explored and understood relational schema using `INFORMATION_SCHEMA`.
- Queried normalized tables with complex joins and filters.
- Created SQL queries for customer segmentation, regional sales, product performance, and time-based trends.
- Built foundational views to aggregate and summarize raw transactional data.
- Applied best practices in query writing (window functions, grouping, filtering).

## Process (OLAP, Preparation):
- Structured query outputs for reporting (sales by region, time, customer category).
- Defined key KPIs (Total Sales, YoY Change, Top/Low Performing Products).
- Designed queries to support dynamic dashboards and stakeholder analysis.
- This project is OLTP-focused but ready for OLAP expansion via Power BI.

## Key insights:
This analysis uncovered how sales performance varies across regions, times of year, and customer types. Some U.S. states are consistently underperforming, especially during certain seasons, which suggests a need for more targeted outreach or promotional efforts.
We also found that a small number of customers are responsible for a large share of total revenue, while others contribute very little. This points to an opportunity to better segment and prioritize customer engagement.
At the product level, certain items are bringing in most of the revenue, which could help guide pricing, stocking, and promotional strategies. These product trends also highlight where the business may be over- or under-investing.
Finally, the data from this report will feed directly into an interactive dashboard. This will make it easier to track regional performance, customer value, and product trends in real time, and help teams take quicker, more focused action.
