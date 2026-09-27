-- 01_trades_analysis.sql
-- Assumes public_trade_data has been loaded to:
-- `trading-analysis-509900.trading_data.public_trade_data`

CREATE OR REPLACE TABLE
  `trading-analysis-509900.trading_data.trades_analysis`
AS
WITH ordered AS (
  SELECT
    Trade_ID,
    SAFE_CAST(Trade_Date AS DATE) AS Trade_Date,
    Day_of_Week,
    Configuration,
    Outcome,
    CAST(Result_R AS FLOAT64) AS Result_R
  FROM `trading-analysis-509900.trading_data.public_trade_data`
),
calc AS (
  SELECT
    *,
    SUM(Result_R) OVER (
      PARTITION BY Configuration
      ORDER BY Trade_Date, Trade_ID
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Cumulative_R
  FROM ordered
)
SELECT
  *,
  MAX(Cumulative_R) OVER (
    PARTITION BY Configuration
    ORDER BY Trade_Date, Trade_ID
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS Running_Peak,
  Cumulative_R -
  MAX(Cumulative_R) OVER (
    PARTITION BY Configuration
    ORDER BY Trade_Date, Trade_ID
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS Drawdown_R
FROM calc
ORDER BY Configuration, Trade_Date, Trade_ID;
