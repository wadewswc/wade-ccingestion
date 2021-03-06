﻿TRUNCATE "WADE"."CATALOG_SUMMARY_MV";

SELECT * FROM  "WADE"."CATALOG_SUMMARY_MV_merge";

INSERT INTO "WADE"."CATALOG_SUMMARY_MV" ("ORGANIZATION_ID","WADE_URL","REPORT_ID",
"DATACATEGORY","DATATYPE","STATE","REPORT_UNIT_ID","REPORTING_UNIT_NAME","COUNTY_FIPS","HUC",
"JOIN_FIELD_RU","JOIN_FIELD_HUC","JOIN_FIELD_CO","SYM_TOGGLE_RU","SYM_TOGGLE_HUC","SYM_TOGGLE_CO",
"GET_CAT_RU","GET_CAT_HUC","GET_CAT_CO","SUM_SUPPLY_RU","SUM_SUPPLY_HUC","SUM_SUPPLY_CO",
"SUM_AVAIL_RU","SUM_AVAIL_HUC","SUM_AVAIL_CO","SUM_USE_RU","SUM_USE_HUC","SUM_REG_RU","SUM_REG_HUC",
"SUM_REG_CO","DET_ALL_RU","DET_ALL_HUC","DET_ALL_CO","DET_DIV_RU","DET_DIV_HUC","DET_DIV_CO",
"DET_CUSE_RU","DET_CUSE_HUC","DET_CUSE_CO","DET_RF_RU","DET_RF_HUC","DET_RF_CO")
SELECT  "ORGANIZATION_ID","WADE_URL","REPORT_ID",
"DATACATEGORY","DATATYPE","STATE","REPORT_UNIT_ID","REPORTING_UNIT_NAME","COUNTY_FIPS","HUC",
"JOIN_FIELD_RU","JOIN_FIELD_HUC","JOIN_FIELD_CO","SYM_TOGGLE_RU","SYM_TOGGLE_HUC","SYM_TOGGLE_CO",
"GET_CAT_RU","GET_CAT_HUC","GET_CAT_CO","SUM_SUPPLY_RU","SUM_SUPPLY_HUC","SUM_SUPPLY_CO",
"SUM_AVAIL_RU","SUM_AVAIL_HUC","SUM_AVAIL_CO","SUM_USE_RU","SUM_USE_HUC","SUM_REG_RU","SUM_REG_HUC",
"SUM_REG_CO","DET_ALL_RU","DET_ALL_HUC","DET_ALL_CO","DET_DIV_RU","DET_DIV_HUC","DET_DIV_CO",
"DET_CUSE_RU","DET_CUSE_HUC","DET_CUSE_CO","DET_RF_RU","DET_RF_HUC","DET_RF_CO" 
FROM "WADE"."CATALOG_SUMMARY_MV_merge";

SELECT * FROM  "WADE"."CATALOG_SUMMARY_MV";