-- 02_performance_summary.sql

CREATE OR REPLACE TABLE
  `trading-analysis-509900.trading_data.performance_summary`
AS
WITH stats AS (
  SELECT
    Configuration,
    COUNT(*) AS Trades,
    COUNTIF(Outcome = 'Win') AS Wins,
    COUNTIF(Outcome = 'Loss') AS Losses,
    ROUND(SAFE_DIVIDE(COUNTIF(Outcome = 'Win'), COUNT(*)) * 100, 2) AS Win_Rate,
    ROUND(SAFE_DIVIDE(COUNTIF(Outcome = 'Loss'), COUNT(*)) * 100, 2) AS Loss_Rate,
    ROUND(SUM(Result_R), 2) AS Total_R,
    ROUND(AVG(Result_R), 4) AS Expectancy_R,
    ROUND(SUM(CASE WHEN Result_R > 0 THEN Result_R ELSE 0 END), 2) AS Gross_Profit_R,
    ROUND(ABS(SUM(CASE WHEN Result_R < 0 THEN Result_R ELSE 0 END)), 2) AS Gross_Loss_R,
    ROUND(MIN(Drawdown_R), 2) AS Max_Drawdown_R
  FROM `trading-analysis-509900.trading_data.trades_analysis`
  GROUP BY Configuration
)
SELECT
  *,
  ROUND(SAFE_DIVIDE(Gross_Profit_R, Gross_Loss_R), 2) AS Profit_Factor
FROM stats
ORDER BY Configuration;
