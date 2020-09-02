--Computing views_binary until 30 days after the test

SELECT
  test_assignment,
  COUNT(DISTINCT item_level.item_id) AS no_of_items,
  SUM(views_binary_30d) as views_binary_30d
FROM
(
SELECT
  final_assignments.item_id,
  MAX(CASE WHEN (view_item_events.event_time > final_assignments.test_start_date AND 
              DATE_PART('day',view_item_events.event_time - final_assignments.test_start_date) <= 30 )
        THEN 1 ELSE 0 END) AS views_binary_30d,
  test_number,
  test_assignment
FROM
  dsv1069.final_assignments
LEFT OUTER JOIN
  dsv1069.view_item_events
ON
  view_item_events.item_id = final_assignments.item_id
WHERE
  test_number = 'item_test_2' 
GROUP BY 
  final_assignments.item_id,
  test_number,
  test_assignment
) item_level
GROUP BY
 test_assignment
