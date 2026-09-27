-- 04_weekday_performance.sql

CREATE OR REPLACE TABLE
  `trading-analysis-509900.trading_data.weekday_performance`
AS
SELECT
  Configuration,
  EXTRACT(DAYOFWEEK FROM Trade_Date) AS Day_Number,
  FORMAT_DATE('%A', Trade_Date) AS Day_of_Week,
  COUNT(*) AS Trades,
  COUNTIF(Outcome = 'Win') AS Wins,
  COUNTIF(Outcome = 'Loss') AS Losses,
  ROUND(SAFE_DIVIDE(COUNTIF(Outcome = 'Win'), COUNT(*)) * 100, 2) AS Win_Rate,
  ROUND(SUM(Result_R), 2) AS Total_R,
  ROUND(AVG(Result_R), 4) AS Average_R
FROM `trading-analysis-509900.trading_data.trades_analysis`
GROUP BY Configuration, Day_Number, Day_of_Week
ORDER BY Configuration, Day_Number;
