-- 1. Executive Control Tower View (Granular Order-Level Data)
CREATE OR REPLACE VIEW vw_dataco_executive_kpis AS
SELECT 
    order_id,
    order_date_fk,
    shipping_date_fk,
    delivery_status,
    late_delivery_risk,
    shipping_mode,
    customer_segment,
    market,
    order_region,
    category_name,
    product_name,
    sales,
    order_profit_per_order,
    days_for_shipping_real,
    days_for_shipment_scheduled,
    (days_for_shipping_real - days_for_shipment_scheduled) AS shipping_delay_days,
    CASE 
        WHEN delivery_status IN ('Advance shipping', 'Shipping on time') THEN 1 
        ELSE 0 
    END AS is_otif
FROM public.dataco_supply_chain;

-- 2. Regional & Category Root Cause Performance View
CREATE OR REPLACE VIEW vw_dataco_root_cause AS
SELECT 
    market,
    order_region,
    category_name,
    shipping_mode,
    COUNT(order_id) AS total_orders,
    SUM(CASE WHEN delivery_status = 'Late delivery' THEN 1 ELSE 0 END) AS late_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(order_profit_per_order), 2) AS total_profit,
    ROUND(AVG(days_for_shipping_real - days_for_shipment_scheduled), 2) AS avg_delay_days
FROM public.dataco_supply_chain
GROUP BY market, order_region, category_name, shipping_mode;
