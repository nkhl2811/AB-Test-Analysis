-- computing order_binary for the 30 day window after the test_start_date
-- for the test named item_test_2
SELECT 
  test_assignment,
  COUNT(DISTINCT item_level.item_id) AS no_of_items,
  SUM(order_binary_30d) as items_ordered_30d
FROM
(
SELECT
  orders.item_id,
  MAX(CASE WHEN (orders.created_at > final_assignments.test_start_date AND 
              DATE_PART('day',orders.created_at - final_assignments.test_start_date) <= 30 )
        THEN 1 ELSE 0 END) AS order_binary_30d,
  test_number,
  test_assignment
FROM
  dsv1069.final_assignments
LEFT OUTER JOIN
  dsv1069.orders
ON
  orders.item_id = final_assignments.item_id 
WHERE
  test_number = 'item_test_2' 
GROUP BY 
  orders.item_id,
  test_number,
  test_assignment
) item_level
GROUP BY
 test_assignment
