-- marj = gelir - satın_alma_maliyeti
-- satın_alma_maliyeti = miktar * satın_alma_fiyati

SELECT
	s.products_id,
	s.date_date,
	s.orders_id,
	s.revenue,
	s.quantity,
	p.purchase_price,
	ROUND(s.quantity*p.purchase_price,2) AS purchase_cost,
	ROUND(s.revenue - s.quantity*p.purchase_price, 2) AS margin
FROM {{ref("stg_raw__sales")}} s
LEFT JOIN {{ref("stg_raw__product")}} p
	USING (products_id)