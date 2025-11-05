CREATE OR REFRESH STREAMING LIVE TABLE quotation_yfinance
TBLPROPERTIES (
  "quality" = "bronze",
  "delta.columnMapping.mode" = "name"
)
AS
SELECT *
FROM cloud_files(
  '/Volumes/lakehouse/raw_public/yfinance/commodities/latest_prices/',
  'json'
);