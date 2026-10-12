-- Calculate On-Time vs. Late Delivery Percentage by Shipping Mode
SELECT 
    shipping_mode,
    COUNT(order_id) AS total_orders,
    SUM(CASE WHEN delivery_status = 'Late delivery' THEN 1 ELSE 0 END) AS late_orders,
    ROUND(
        100.0 * SUM(CASE WHEN delivery_status = 'Late delivery' THEN 1 ELSE 0 END) / COUNT(order_id), 
        2
    ) AS late_delivery_pct,
    ROUND(
        100.0 * SUM(CASE WHEN delivery_status = 'Advance shipping' OR delivery_status = 'Shipping on time' THEN 1 ELSE 0 END) / COUNT(order_id), 
        2
    ) AS on_time_in_full_rate_pct
FROM public.dataco_supply_chain
GROUP BY shipping_mode
ORDER BY late_delivery_pct DESC;

-- Quantify Financial Loss Associated with Late Delivery Risk
SELECT
	delivery_status,
	COUNT(order_id) AS order_count,
	ROUND(SUM(sales), 2) AS total_sale,
	ROUND(SUM(order_profit_per_order), 2) AS total_profit,
	ROUND(AVG(order_profit_per_order), 2) AS avg_profit
FROM public.dataco_supply_chain
GROUP BY delivery_status
ORDER BY total_profit ASC;

--Identify Regional Supply Chain Bottlenecks
SELECT
	market,
	order_region,
	COUNT(order_id) AS order_count,
	ROUND(AVG(days_for_shipping_real), 2) AS avg_actual_shipping_days,
	ROUND(AVG(days_for_shipment_scheduled), 2) AS avg_scheduled_shipping_days,
    ROUND(AVG(days_for_shipping_real - days_for_shipment_scheduled), 2) AS avg_delay_days	
FROM public.dataco_supply_chain
WHERE delivery_status = 'Late delivery'
GROUP BY market, order_region
HAVING COUNT(order_id) > 1000
ORDER BY avg_delay_days DESC
LIMIT 10;

--Identify Relationship Between Product Name And Avg Delay Days
SELECT 
	product_name,
	ROUND(AVG(days_for_shipping_real - days_for_shipment_scheduled), 2) AS avg_delay_days
FROM public.dataco_supply_chain
GROUP BY product_name
ORDER BY avg_delay_days DESC
LIMIT 10;
