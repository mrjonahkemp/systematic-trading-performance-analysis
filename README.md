# Systematic Trading Performance Analysis

An end-to-end data analytics and business intelligence portfolio project built from historical trade data.

The project demonstrates how raw CSV data can be transformed into a structured analytical dataset, modelled in Google BigQuery, analysed with SQL, and presented through an interactive Google Data Studio dashboard.

> **Privacy / proprietary methodology:** The underlying trading rules, entry/exit conditions, execution logic and original strategy configuration names are intentionally excluded from this repository. Public configuration labels have been anonymised as **Configuration A/B/C**. The repository is designed to demonstrate analytics and BI capability, not disclose proprietary intellectual property.

## Project objective

The objective was to turn a historical trade dataset into a reproducible analytics workflow capable of answering questions such as:

- How consistent is performance across configurations?
- What is the win rate and expectancy?
- How does performance change over time?
- Which months and weekdays contributed most to cumulative performance?
- What does the return distribution look like?
- What is the observed maximum drawdown?
- How can these findings be communicated through an interactive BI dashboard?

## Data → BigQuery → BI workflow

```text
Historical CSV
     │
     ▼
Data cleaning & validation
     │
     ▼
Long-format analytical dataset
     │
     ▼
Google BigQuery
     │
     ├── trades_analysis
     ├── performance_summary
     ├── monthly_performance
     ├── weekday_performance
     └── equity_curve
     │
     ▼
Google Data Studio
     │
     ▼
Interactive Performance Dashboard
```

## Tools

- **Google Sheets** — initial data review and exploratory analysis
- **SQL** — transformation, aggregation and KPI calculation
- **Google BigQuery** — analytical data layer
- **Google Data Studio** — interactive BI dashboard
- **CSV** — source data format

## Dataset

The public dataset contains 1,278 trade/configuration observations covering the same analytical period used in the dashboard.

The public version intentionally removes:

- original strategy/configuration names
- entry and exit rules
- directional/execution logic
- proprietary parameter terminology

Instead, configurations are represented as:

- Configuration A
- Configuration B
- Configuration C

The dataset retains only the information required to demonstrate the analytical workflow: trade date, day, configuration, outcome and result in R.

## Analytical model

### `trades_analysis`

The cleaned trade-level analytical table. Each observation represents one trade under one anonymised configuration.

Key fields:

- `Trade_ID`
- `Trade_Date`
- `Day_of_Week`
- `Configuration`
- `Outcome`
- `Result_R`
- cumulative performance
- running peak
- drawdown

### `performance_summary`

Configuration-level KPIs including:

- total trades
- wins and losses
- win rate
- loss rate
- total R
- expectancy
- gross profit
- gross loss
- profit factor
- maximum drawdown

### `monthly_performance`

Aggregated performance by month, including trade count, win rate, total R and average R.

### `weekday_performance`

Aggregated performance by day of week.

### `equity_curve`

Sequential cumulative performance and drawdown calculations used by the BI dashboard.

## Key findings

Across the three anonymised configurations, the historical dataset produced materially different performance profiles.

### Configuration A

- 426 trades
- 225 wins / 201 losses
- 52.82% win rate
- +474R total return
- 1.1127R expectancy
- 3.36 profit factor
- -13R maximum drawdown

### Configuration B

- 426 trades
- 199 wins / 227 losses
- 46.71% win rate
- +370R total return
- 0.8685R expectancy
- 2.63 profit factor
- -10R maximum drawdown

### Configuration C

- 426 trades
- 187 wins / 239 losses
- 43.90% win rate
- +322R total return
- 0.7559R expectancy
- 2.35 profit factor
- -8R maximum drawdown

### What the results imply

The analysis shows that headline win rate alone does not fully describe system performance.

The configurations produced positive expectancy despite materially different win rates, illustrating the importance of evaluating multiple KPIs together rather than relying on a single metric.

The analysis also shows a trade-off between cumulative return and observed drawdown across the configurations. This is presented descriptively rather than as a recommendation, because the appropriate configuration depends on the objectives and risk constraints of the decision-maker.

Monthly and weekday analysis further demonstrates that aggregate performance can conceal substantial variation across time periods. This supports using time-series and segmentation analysis alongside overall KPIs.

## Live Dashboard

[Open the Interactive Dashboard](https://datastudio.google.com/s/u4OjIJjQEUA)

The dashboard is presented as a portfolio demonstration of analytical reporting and BI design. The underlying strategy rules and execution methodology are intentionally undisclosed.

## Dashboard

The final dashboard combines:

- KPI scorecards
- equity curve
- drawdown
- monthly performance
- weekday performance
- return distribution
- trade statistics
- recent trade-level data

The dashboard is interactive and allows the viewer to change the anonymised configuration being analysed.

## What this project demonstrates

This project is intended to demonstrate practical data analyst / BI capability across the full workflow:

**Data preparation**
- cleaning inconsistent date formats
- handling missing/no-trade observations
- reshaping wide trade data into a long analytical structure
- standardising outcome and return fields

**SQL / BigQuery**
- CTEs
- conditional aggregation
- date extraction and formatting
- calculated KPIs
- cumulative calculations
- running peaks and drawdowns
- analytical table design

**Business intelligence**
- KPI design
- interactive filtering
- time-series visualisation
- categorical analysis
- distribution analysis
- dashboard layout and visual hierarchy

**Analytical communication**
- separating raw data from analytical outputs
- presenting findings without exposing proprietary methodology
- translating quantitative results into decision-relevant observations

## Repository structure

```text
systematic-trading-performance-analysis/
│
├── README.md
├── data/
│   └── public_trade_data.csv
│
├── sql/
│   ├── 01_trades_analysis.sql
│   ├── 02_performance_summary.sql
│   ├── 03_monthly_performance.sql
│   ├── 04_weekday_performance.sql
│   └── 05_equity_curve.sql
│
├── images/
│   ├── google-sheets-analysis.png
│   └── google-data-studio-dashboard.png
│
└── docs/
    └── data-dictionary.md
```

## Note on methodology

This repository intentionally focuses on the **analytics engineering and BI workflow** rather than the proprietary trading methodology that generated the observations.

The results should therefore be interpreted as historical descriptive analysis of the supplied dataset, not as a guarantee of future performance.
