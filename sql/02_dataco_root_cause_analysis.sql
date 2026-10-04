--Top Categories Contributing to Total Late Shipping Profit Loss
WITH CategoryLoss AS (
	SELECT
		category_name,
		COUNT(order_id) AS late_order_count,
		ROUND(SUM(sales),2) AS total_sales_lost,
		ROUND(SUM(order_profit_per_order),2) AS total_profit_lost
	FROM public.dataco_supply_chain
	WHERE delivery_status='Late delivery'
	GROUP BY category_name
),
RankedLoss AS (
	SELECT
		category_name,
		late_order_count,
		total_profit_lost,
		SUM(late_order_count) OVER() AS global_late_orders,
		ROUND(100*SUM(late_order_count) OVER (PARTITION BY category_name)/SUM(late_order_count) OVER(), 2) AS late_order_pct,
		ROUND(100*SUM(late_order_count) OVER (ORDER BY late_order_count DESC)/ SUM(late_order_count) OVER(),2) AS cumulative_late_order_pct
	FROM CategoryLoss
)
SELECT
	category_name,
	late_order_count,
    total_profit_lost,
	late_order_pct,
	cumulative_late_order_pct
FROM RankedLoss
ORDER BY late_order_count DESC
LIMIT 15;

-- Lead Time Variance Ranking across Shipping Modes & Markets
SELECT 
	market,
	shipping_mode,
	COUNT(order_id) AS volume,
	ROUND(AVG(days_for_shipping_real - days_for_shipment_scheduled),2) AS avg_lead_time_variance_days
FROM public.dataco_supply_chain
WHERE delivery_status='Late delivery'
GROUP BY market, shipping_mode
HAVING COUNT(order_id) > 500
ORDER BY avg_lead_time_variance_days DESC;

--Top 10 High-Risk Product Categories driving Late Delivery Volume
SELECT 
	category_name,
	COUNT(category_name) AS category_late_orders
	
FROM public.dataco_supply_chain
WHERE delivery_status = 'Late delivery'
GROUP BY category_name
ORDER BY category_late_orders DESC;

--Lead Time Variance Across Shipping Mode and Customer Segments
SELECT 
    shipping_mode,
    customer_segment,
	COUNT(order_id) AS total_shipments,
	ROUND(AVG(days_for_shipping_real - days_for_shipment_scheduled),2) AS avg_lead_time_variance_days,
	MAX(days_for_shipping_real - days_for_shipment_scheduled) AS worst_case_delay_days
FROM public.dataco_supply_chain
GROUP BY shipping_mode, customer_segment
ORDER BY shipping_mode, avg_lead_time_variance_days DESC;

--Rank Shipping Region Based On Avergae Delay Duration
SELECT 
    order_region,
    market,
    COUNT(order_id) AS total_volume,
    ROUND(AVG(days_for_shipping_real - days_for_shipment_scheduled), 2) AS avg_delay_days,
    DENSE_RANK() OVER( ORDER BY AVG(days_for_shipping_real - days_for_shipment_scheduled) DESC) AS regional_delay_rank
FROM public.dataco_supply_chain
WHERE delivery_status = 'Late delivery'
GROUP BY order_region, market
HAVING COUNT(order_id) > 1000;
