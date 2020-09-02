--Reformatting the final_assignments_qa to look like the final_assignments table, filling in any missing values with a placeholder of the appropriate data type.

SELECT 
  *
FROM
(SELECT 
  item_id,
  test_a                                AS test_assignment,
  'test_a'                              AS test_number,
  CAST('2013-05-01' AS DATE)            AS test_start_date
FROM 
  dsv1069.final_assignments_qa
UNION
SELECT 
  item_id,
  test_b                                AS test_assignment,
  'test_b'                              AS test_number,
  CAST('2015-03-14' AS DATE)            AS test_start_date
FROM 
  dsv1069.final_assignments_qa
UNION
SELECT 
  item_id,
  test_c                                AS test_assignment,
  'test_c'                              AS test_number,
  CAST('2016-01-07' AS DATE)            AS test_start_date
FROM 
  dsv1069.final_assignments_qa) tests
ORDER BY test_number asc
