-- 03_monthly_performance.sql

CREATE OR REPLACE TABLE
  `trading-analysis-509900.trading_data.monthly_performance`
AS
SELECT
  Configuration,
  FORMAT_DATE('%Y-%m', Trade_Date) AS Year_Month,
  EXTRACT(YEAR FROM Trade_Date) AS Year,
  EXTRACT(MONTH FROM Trade_Date) AS Month_Number,
  FORMAT_DATE('%b %Y', Trade_Date) AS Month_Label,
  COUNT(*) AS Trades,
  COUNTIF(Outcome = 'Win') AS Wins,
  COUNTIF(Outcome = 'Loss') AS Losses,
  ROUND(SAFE_DIVIDE(COUNTIF(Outcome = 'Win'), COUNT(*)) * 100, 2) AS Win_Rate,
  ROUND(SUM(Result_R), 2) AS Total_R,
  ROUND(AVG(Result_R), 4) AS Average_R
FROM `trading-analysis-509900.trading_data.trades_analysis`
GROUP BY Configuration, Year_Month, Year, Month_Number, Month_Label
ORDER BY Configuration, Year, Month_Number;
