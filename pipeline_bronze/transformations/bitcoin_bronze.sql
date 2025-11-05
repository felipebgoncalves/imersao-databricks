CREATE OR REFRESH STREAMING LIVE TABLE quotation_btc
TBLPROPERTIES (
  "quality" = "bronze",
  "delta.columnMapping.mode" = "name"
)
AS
SELECT *
FROM cloud_files(
  '/Volumes/lakehouse/raw_public/coinbase/coinbase/bitcoin_spot/',
  'json',
  map(
    'cloudFiles.includeExistingFiles', 'false',
    'cloudFiles.inferColumnTypes', 'true',
    'cloudFiles.schemaEvolutionMode', 'addNewColumns'
  )
);