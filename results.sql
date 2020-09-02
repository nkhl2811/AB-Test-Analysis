--Used the https://thumbtack.github.io/abba/demo/abba.html to compute the lifts in metrics and the p-values for the binary metrics ( 30 day order binary and 30 day view binary) using a interval 95% confidence. 
SELECT 
  'ORDER_BINARY_30D' AS METRIC,
  '0.88' AS P_VALUE,
  '-1%' AS LIFT
UNION
SELECT 
  'VIEWS_BINARY_30D' AS METRIC,
  '0.23' AS P_VALUE,
  '2.4%' AS LIFT
