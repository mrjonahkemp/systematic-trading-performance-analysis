-- 05_equity_curve.sql

CREATE OR REPLACE TABLE
  `trading-analysis-509900.trading_data.equity_curve`
AS
SELECT
  Configuration,
  Trade_ID,
  Trade_Date,
  Outcome,
  Result_R,
  Cumulative_R,
  Running_Peak,
  Drawdown_R
FROM `trading-analysis-509900.trading_data.trades_analysis`
ORDER BY Configuration, Trade_Date, Trade_ID;
