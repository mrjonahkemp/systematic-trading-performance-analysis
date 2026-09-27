# Data Dictionary

## Public trade dataset

| Field | Type | Description |
|---|---|---|
| `Trade_ID` | Integer | Identifier inherited from the source trade record |
| `Trade_Date` | Date | Date of the observation |
| `Day_of_Week` | String | Day associated with the observation |
| `Configuration` | String | Anonymised configuration label |
| `Outcome` | String | `Win` or `Loss` |
| `Result_R` | Numeric | Standardised result expressed as an R multiple |

## Analytical fields

| Field | Description |
|---|---|
| `Cumulative_R` | Running cumulative result for a configuration |
| `Running_Peak` | Highest cumulative result reached to date |
| `Drawdown_R` | Difference between cumulative result and running peak |

## Privacy note

The public schema deliberately excludes original strategy names, execution direction, entry conditions, exit conditions and proprietary parameter terminology.
