﻿DROP TABLE IF EXISTS "WADE"."CATALOG_SUMMARY_MV_merge";

CREATE TABLE "WADE"."CATALOG_SUMMARY_MV_merge"
(
  "ID" serial NOT NULL,
  "ORGANIZATION_ID" character varying(10) NOT NULL,
  "WADE_URL" character varying(300),
  "REPORT_ID" character varying(35) NOT NULL,
  "DATACATEGORY" text NOT NULL,
  "DATATYPE" text NOT NULL,
  "STATE" character varying(2),
  "REPORT_UNIT_ID" character varying(35),
  "REPORTING_UNIT_NAME" character varying(300),
  "COUNTY_FIPS" character(5),
  "HUC" character varying(12),
  "JOIN_FIELD_RU" character varying(100),
  "JOIN_FIELD_HUC" character varying(100),
  "JOIN_FIELD_CO" character varying(100),
  "SYM_TOGGLE_RU" character varying(5),
  "SYM_TOGGLE_HUC" character varying(5),
  "SYM_TOGGLE_CO" character varying(5),
  "GET_CAT_RU" character varying(400),
  "GET_CAT_HUC" character varying(400),
  "GET_CAT_CO" character varying(400),
  "SUM_SUPPLY_RU" character varying(400),
  "SUM_SUPPLY_HUC" character varying(400),
  "SUM_SUPPLY_CO" character varying(400),
  "SUM_AVAIL_RU" character varying(400),
  "SUM_AVAIL_HUC" character varying(400),
  "SUM_AVAIL_CO" character varying(400),
  "SUM_USE_RU" character varying(400),
  "SUM_USE_HUC" character varying(400),
  "SUM_USE_CO" character varying(400),
  "SUM_REG_RU" character varying(400),
  "SUM_REG_HUC" character varying(400),
  "SUM_REG_CO" character varying(400),
  "DET_ALL_RU" character varying(400),
  "DET_ALL_HUC" character varying(400),
  "DET_ALL_CO" character varying(400),
  "DET_DIV_RU" character varying(400),
  "DET_DIV_HUC" character varying(400),
  "DET_DIV_CO" character varying(400),
  "DET_CUSE_RU" character varying(400),
  "DET_CUSE_HUC" character varying(400),
  "DET_CUSE_CO" character varying(400),
  "DET_RF_RU" character varying(400),
  "DET_RF_HUC" character varying(400),
  "DET_RF_CO" character varying(400),
  CONSTRAINT "CATALOG_SUMMARY_MV_merge_pkey" PRIMARY KEY ("ID")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "WADE"."CATALOG_SUMMARY_MV_merge"
  OWNER TO "WADE_ADMIN";
GRANT ALL ON TABLE "WADE"."CATALOG_SUMMARY_MV_merge" TO "WADE_ADMIN";
GRANT ALL ON TABLE "WADE"."CATALOG_SUMMARY_MV_merge" TO postgres;
GRANT ALL ON TABLE "WADE"."CATALOG_SUMMARY_MV_merge" TO admin;
GRANT SELECT ON TABLE "WADE"."CATALOG_SUMMARY_MV_merge" TO "WADE_APP";

--TRUNCATE TABLE "WADE"."CATALOG_SUMMARY_MV_merge";

SELECT * FROM  "WADE"."CATALOG_SUMMARY_MV_ATOC";

INSERT INTO "WADE"."CATALOG_SUMMARY_MV_merge" ("ORGANIZATION_ID","WADE_URL","REPORT_ID","DATACATEGORY","DATATYPE","STATE","REPORT_UNIT_ID","REPORTING_UNIT_NAME","COUNTY_FIPS","HUC","JOIN_FIELD_RU","JOIN_FIELD_HUC","JOIN_FIELD_CO","SYM_TOGGLE_RU","SYM_TOGGLE_HUC","SYM_TOGGLE_CO","GET_CAT_RU","GET_CAT_HUC","GET_CAT_CO","SUM_SUPPLY_RU","SUM_SUPPLY_HUC","SUM_SUPPLY_CO","SUM_AVAIL_RU","SUM_AVAIL_HUC","SUM_AVAIL_CO","SUM_USE_RU","SUM_USE_HUC","SUM_REG_RU","SUM_REG_HUC","SUM_REG_CO","DET_ALL_RU","DET_ALL_HUC","DET_ALL_CO","DET_DIV_RU","DET_DIV_HUC","DET_DIV_CO","DET_CUSE_RU","DET_CUSE_HUC","DET_CUSE_CO","DET_RF_RU","DET_RF_HUC","DET_RF_CO")
SELECT  "ORGANIZATION_ID","WADE_URL","REPORT_ID","DATACATEGORY","DATATYPE","STATE","REPORT_UNIT_ID","REPORTING_UNIT_NAME","COUNTY_FIPS","HUC","JOIN_FIELD_RU","JOIN_FIELD_HUC","JOIN_FIELD_CO","SYM_TOGGLE_RU","SYM_TOGGLE_HUC","SYM_TOGGLE_CO","GET_CAT_RU","GET_CAT_HUC","GET_CAT_CO","SUM_SUPPLY_RU","SUM_SUPPLY_HUC","SUM_SUPPLY_CO","SUM_AVAIL_RU","SUM_AVAIL_HUC","SUM_AVAIL_CO","SUM_USE_RU","SUM_USE_HUC","SUM_REG_RU","SUM_REG_HUC","SUM_REG_CO","DET_ALL_RU","DET_ALL_HUC","DET_ALL_CO","DET_DIV_RU","DET_DIV_HUC","DET_DIV_CO","DET_CUSE_RU","DET_CUSE_HUC","DET_CUSE_CO","DET_RF_RU","DET_RF_HUC","DET_RF_CO" FROM "WADE"."CATALOG_SUMMARY_MV_ATOC";

SELECT * FROM  "WADE"."CATALOG_SUMMARY_MV_DTON";

INSERT INTO "WADE"."CATALOG_SUMMARY_MV_merge" ("ORGANIZATION_ID","WADE_URL","REPORT_ID","DATACATEGORY","DATATYPE","STATE","REPORT_UNIT_ID","REPORTING_UNIT_NAME","COUNTY_FIPS","HUC","JOIN_FIELD_RU","JOIN_FIELD_HUC","JOIN_FIELD_CO","SYM_TOGGLE_RU","SYM_TOGGLE_HUC","SYM_TOGGLE_CO","GET_CAT_RU","GET_CAT_HUC","GET_CAT_CO","SUM_SUPPLY_RU","SUM_SUPPLY_HUC","SUM_SUPPLY_CO","SUM_AVAIL_RU","SUM_AVAIL_HUC","SUM_AVAIL_CO","SUM_USE_RU","SUM_USE_HUC","SUM_REG_RU","SUM_REG_HUC","SUM_REG_CO","DET_ALL_RU","DET_ALL_HUC","DET_ALL_CO","DET_DIV_RU","DET_DIV_HUC","DET_DIV_CO","DET_CUSE_RU","DET_CUSE_HUC","DET_CUSE_CO","DET_RF_RU","DET_RF_HUC","DET_RF_CO")
SELECT  "ORGANIZATION_ID","WADE_URL","REPORT_ID","DATACATEGORY","DATATYPE","STATE","REPORT_UNIT_ID","REPORTING_UNIT_NAME","COUNTY_FIPS","HUC","JOIN_FIELD_RU","JOIN_FIELD_HUC","JOIN_FIELD_CO","SYM_TOGGLE_RU","SYM_TOGGLE_HUC","SYM_TOGGLE_CO","GET_CAT_RU","GET_CAT_HUC","GET_CAT_CO","SUM_SUPPLY_RU","SUM_SUPPLY_HUC","SUM_SUPPLY_CO","SUM_AVAIL_RU","SUM_AVAIL_HUC","SUM_AVAIL_CO","SUM_USE_RU","SUM_USE_HUC","SUM_REG_RU","SUM_REG_HUC","SUM_REG_CO","DET_ALL_RU","DET_ALL_HUC","DET_ALL_CO","DET_DIV_RU","DET_DIV_HUC","DET_DIV_CO","DET_CUSE_RU","DET_CUSE_HUC","DET_CUSE_CO","DET_RF_RU","DET_RF_HUC","DET_RF_CO" FROM "WADE"."CATALOG_SUMMARY_MV_DTON";

SELECT * FROM  "WADE"."CATALOG_SUMMARY_MV_OTOS";

INSERT INTO "WADE"."CATALOG_SUMMARY_MV_merge" ("ORGANIZATION_ID","WADE_URL","REPORT_ID","DATACATEGORY","DATATYPE","STATE","REPORT_UNIT_ID","REPORTING_UNIT_NAME","COUNTY_FIPS","HUC","JOIN_FIELD_RU","JOIN_FIELD_HUC","JOIN_FIELD_CO","SYM_TOGGLE_RU","SYM_TOGGLE_HUC","SYM_TOGGLE_CO","GET_CAT_RU","GET_CAT_HUC","GET_CAT_CO","SUM_SUPPLY_RU","SUM_SUPPLY_HUC","SUM_SUPPLY_CO","SUM_AVAIL_RU","SUM_AVAIL_HUC","SUM_AVAIL_CO","SUM_USE_RU","SUM_USE_HUC","SUM_REG_RU","SUM_REG_HUC","SUM_REG_CO","DET_ALL_RU","DET_ALL_HUC","DET_ALL_CO","DET_DIV_RU","DET_DIV_HUC","DET_DIV_CO","DET_CUSE_RU","DET_CUSE_HUC","DET_CUSE_CO","DET_RF_RU","DET_RF_HUC","DET_RF_CO")
SELECT  "ORGANIZATION_ID","WADE_URL","REPORT_ID","DATACATEGORY","DATATYPE","STATE","REPORT_UNIT_ID","REPORTING_UNIT_NAME","COUNTY_FIPS","HUC","JOIN_FIELD_RU","JOIN_FIELD_HUC","JOIN_FIELD_CO","SYM_TOGGLE_RU","SYM_TOGGLE_HUC","SYM_TOGGLE_CO","GET_CAT_RU","GET_CAT_HUC","GET_CAT_CO","SUM_SUPPLY_RU","SUM_SUPPLY_HUC","SUM_SUPPLY_CO","SUM_AVAIL_RU","SUM_AVAIL_HUC","SUM_AVAIL_CO","SUM_USE_RU","SUM_USE_HUC","SUM_REG_RU","SUM_REG_HUC","SUM_REG_CO","DET_ALL_RU","DET_ALL_HUC","DET_ALL_CO","DET_DIV_RU","DET_DIV_HUC","DET_DIV_CO","DET_CUSE_RU","DET_CUSE_HUC","DET_CUSE_CO","DET_RF_RU","DET_RF_HUC","DET_RF_CO" FROM "WADE"."CATALOG_SUMMARY_MV_OTOS";

SELECT * FROM  "WADE"."CATALOG_SUMMARY_MV_TTOZ";

INSERT INTO "WADE"."CATALOG_SUMMARY_MV_merge" ("ORGANIZATION_ID","WADE_URL","REPORT_ID","DATACATEGORY","DATATYPE","STATE","REPORT_UNIT_ID","REPORTING_UNIT_NAME","COUNTY_FIPS","HUC","JOIN_FIELD_RU","JOIN_FIELD_HUC","JOIN_FIELD_CO","SYM_TOGGLE_RU","SYM_TOGGLE_HUC","SYM_TOGGLE_CO","GET_CAT_RU","GET_CAT_HUC","GET_CAT_CO","SUM_SUPPLY_RU","SUM_SUPPLY_HUC","SUM_SUPPLY_CO","SUM_AVAIL_RU","SUM_AVAIL_HUC","SUM_AVAIL_CO","SUM_USE_RU","SUM_USE_HUC","SUM_REG_RU","SUM_REG_HUC","SUM_REG_CO","DET_ALL_RU","DET_ALL_HUC","DET_ALL_CO","DET_DIV_RU","DET_DIV_HUC","DET_DIV_CO","DET_CUSE_RU","DET_CUSE_HUC","DET_CUSE_CO","DET_RF_RU","DET_RF_HUC","DET_RF_CO")
SELECT  "ORGANIZATION_ID","WADE_URL","REPORT_ID","DATACATEGORY","DATATYPE","STATE","REPORT_UNIT_ID","REPORTING_UNIT_NAME","COUNTY_FIPS","HUC","JOIN_FIELD_RU","JOIN_FIELD_HUC","JOIN_FIELD_CO","SYM_TOGGLE_RU","SYM_TOGGLE_HUC","SYM_TOGGLE_CO","GET_CAT_RU","GET_CAT_HUC","GET_CAT_CO","SUM_SUPPLY_RU","SUM_SUPPLY_HUC","SUM_SUPPLY_CO","SUM_AVAIL_RU","SUM_AVAIL_HUC","SUM_AVAIL_CO","SUM_USE_RU","SUM_USE_HUC","SUM_REG_RU","SUM_REG_HUC","SUM_REG_CO","DET_ALL_RU","DET_ALL_HUC","DET_ALL_CO","DET_DIV_RU","DET_DIV_HUC","DET_DIV_CO","DET_CUSE_RU","DET_CUSE_HUC","DET_CUSE_CO","DET_RF_RU","DET_RF_HUC","DET_RF_CO" FROM "WADE"."CATALOG_SUMMARY_MV_TTOZ";

SELECT * FROM  "WADE"."CATALOG_SUMMARY_MV_merge";
