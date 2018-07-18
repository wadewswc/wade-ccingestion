--*****************************Populate fields for mapping/user interaction********************************
--*********************************************************************************************************

--Join Fields (for joining with spatial data)-------------------------------------------
--HUC and County join fields are only generated if the HUC or County are specified.
UPDATE "WADE"."CATALOG_SUMMARY_MV_merge" 
SET "JOIN_FIELD_HUC" = 
CASE 
WHEN "HUC" IS NOT NULL THEN
	concat("STATE"::text,'-',"HUC"::text)
END;

UPDATE "WADE"."CATALOG_SUMMARY_MV_merge" 
SET "JOIN_FIELD_CO" = 
CASE 
WHEN "COUNTY_FIPS" IS NOT NULL THEN
	concat("STATE"::text,'-',"COUNTY_FIPS"::text)
END;
--RU join field is always generated (by default)
UPDATE "WADE"."CATALOG_SUMMARY_MV_merge" 
SET "JOIN_FIELD_RU" = 
	concat("STATE"::text,'-',"REPORT_UNIT_ID"::text);

--Symbology Toggles (for subsetting and displaying spatial data)

--If HUC is specified, create toggle for displaying
UPDATE "WADE"."CATALOG_SUMMARY_MV_merge"
SET "SYM_TOGGLE_HUC" = 
	CASE WHEN "JOIN_FIELD_HUC" IS NOT NULL THEN 1
	ELSE 0
	END;
--If County is specified, create toggle for displaying
UPDATE "WADE"."CATALOG_SUMMARY_MV_merge"
SET "SYM_TOGGLE_CO" = 
	CASE WHEN "JOIN_FIELD_CO" IS NOT NULL THEN 1
	ELSE 0
	END;

--Create toggle for displaying if the HUC or County are not specified, or if a custom field is specified in addition to the HUC or County
UPDATE "WADE"."CATALOG_SUMMARY_MV_merge"	
SET "SYM_TOGGLE_RU" = 
	CASE 
	WHEN ("SYM_TOGGLE_HUC" = '0') AND ("SYM_TOGGLE_CO" = '0') THEN 1
	WHEN ("REPORT_UNIT_ID" != "HUC") OR ("REPORT_UNIT_ID" != "COUNTY_FIPS") THEN 1
	ELSE 0
	END;
	
--IMPORTANT: CHECK CATALOG TO MAKE SURE THAT THE SYM_TOGGLES, WADE_URL, AND JOIN_FIELD FIELDS ARE CORRECT.
--SOME CASES MAY REQUIRE ADDITIONAL/MANUAL SPECIFICATION (e.g. when a state's custom reporting unit is also a HUC, but no value is specified in the HUC column; or if there is not WADE_URL field supplied)	

-- Generate Catalog and Site Specific (Detail) and Aggregated (Summary) Data URLs
UPDATE "WADE"."CATALOG_SUMMARY_MV_merge" SET 
	"GET_CAT_RU" = concat("WADE_URL"::text,'/WADE/v0.2/GetCatalog/GetCatalog.php?loctype=REPORTUNIT&loctxt='::text,"REPORT_UNIT_ID"::text,'&orgid=ALL&state='::text,"STATE"::text),
	"SUM_SUPPLY_RU" = concat("WADE_URL"::text,'/WADE/v0.2/GetSummary/GetSummary.php?loctype=REPORTUNIT&loctxt='::text,"REPORT_UNIT_ID"::text,'&orgid='::text,"ORGANIZATION_ID"::text,'&reportid='::text,"REPORT_ID"::text,'&datatype='::text,"DATATYPE"::text),
	"SUM_AVAIL_RU" = concat("WADE_URL"::text,'/WADE/v0.2/GetSummary/GetSummary.php?loctype=REPORTUNIT&loctxt='::text,"REPORT_UNIT_ID"::text,'&orgid='::text,"ORGANIZATION_ID"::text,'&reportid='::text,"REPORT_ID"::text,'&datatype='::text,"DATATYPE"::text),
	"SUM_USE_RU" = concat("WADE_URL"::text,'/WADE/v0.2/GetSummary/GetSummary.php?loctype=REPORTUNIT&loctxt='::text,"REPORT_UNIT_ID"::text,'&orgid='::text,"ORGANIZATION_ID"::text,'&reportid='::text,"REPORT_ID"::text,'&datatype='::text,"DATATYPE"::text),
	"SUM_REG_RU" = concat("WADE_URL"::text,'/WADE/v0.2/GetSummary/GetSummary.php?loctype=REPORTUNIT&loctxt='::text,"REPORT_UNIT_ID"::text,'&orgid='::text,"ORGANIZATION_ID"::text,'&reportid='::text,"REPORT_ID"::text,'&datatype='::text,"DATATYPE"::text),
	"DET_ALL_RU" = concat("WADE_URL"::text,'/WADE/v0.2/GetDetail/GetDetail.php?reportid='::text,"REPORT_ID"::text,'&loctype=REPORTUNIT&loctxt='::text,"REPORT_UNIT_ID"::text,'&datatype='::text,"DATATYPE"::text),
	"DET_DIV_RU" = concat("WADE_URL"::text,'/WADE/v0.2/GetDetail/GetDetail.php?reportid='::text,"REPORT_ID"::text,'&loctype=REPORTUNIT&loctxt='::text,"REPORT_UNIT_ID"::text,'&datatype='::text,"DATATYPE"::text),
	"DET_CUSE_RU" = concat("WADE_URL"::text,'/WADE/v0.2/GetDetail/GetDetail.php?reportid='::text,"REPORT_ID"::text,'&loctype=REPORTUNIT&loctxt='::text,"REPORT_UNIT_ID"::text,'&datatype='::text,"DATATYPE"::text),
	"DET_RF_RU" = concat("WADE_URL"::text,'/WADE/v0.2/GetDetail/GetDetail.php?reportid='::text,"REPORT_ID"::text,'&loctype=REPORTUNIT&loctxt='::text,"REPORT_UNIT_ID"::text,'&datatype='::text,"DATATYPE"::text);

UPDATE "WADE"."CATALOG_SUMMARY_MV_merge" SET 
	"GET_CAT_HUC" = concat("WADE_URL"::text,'/WADE/v0.2/GetCatalog/GetCatalog.php?loctype=HUC&loctxt='::text,"HUC"::text,'&orgid=ALL&state='::text,"STATE"::text),
	"SUM_SUPPLY_HUC" = concat("WADE_URL"::text,'/WADE/v0.2/GetSummary/GetSummary.php?loctype=HUC&loctxt='::text,"HUC"::text,'&orgid='::text,"ORGANIZATION_ID"::text,'&reportid='::text,"REPORT_ID"::text,'&datatype='::text,"DATATYPE"::text),
	"SUM_AVAIL_HUC" = concat("WADE_URL"::text,'/WADE/v0.2/GetSummary/GetSummary.php?loctype=HUC&loctxt='::text,"HUC"::text,'&orgid='::text,"ORGANIZATION_ID"::text,'&reportid='::text,"REPORT_ID"::text,'&datatype='::text,"DATATYPE"::text),
	"SUM_USE_HUC" = concat("WADE_URL"::text,'/WADE/v0.2/GetSummary/GetSummary.php?loctype=HUC&loctxt='::text,"HUC"::text,'&orgid='::text,"ORGANIZATION_ID"::text,'&reportid='::text,"REPORT_ID"::text,'&datatype='::text,"DATATYPE"::text),
	"SUM_REG_HUC" = concat("WADE_URL"::text,'/WADE/v0.2/GetSummary/GetSummary.php?loctype=HUC&loctxt='::text,"HUC"::text,'&orgid='::text,"ORGANIZATION_ID"::text,'&reportid='::text,"REPORT_ID"::text,'&datatype='::text,"DATATYPE"::text),
	"DET_ALL_HUC" = concat("WADE_URL"::text,'/WADE/v0.2/GetDetail/GetDetail.php?reportid='::text,"REPORT_ID"::text,'&loctype=HUC&loctxt='::text,"HUC"::text,'&datatype='::text,"DATATYPE"::text),
	"DET_DIV_HUC" = concat("WADE_URL"::text,'/WADE/v0.2/GetDetail/GetDetail.php?reportid='::text,"REPORT_ID"::text,'&loctype=HUC&loctxt='::text,"HUC"::text,'&datatype='::text,"DATATYPE"::text),
	"DET_CUSE_HUC" = concat("WADE_URL"::text,'/WADE/v0.2/GetDetail/GetDetail.php?reportid='::text,"REPORT_ID"::text,'&loctype=HUC&loctxt='::text,"HUC"::text,'&datatype='::text,"DATATYPE"::text),
	"DET_RF_HUC" = concat("WADE_URL"::text,'/WADE/v0.2/GetDetail/GetDetail.php?reportid='::text,"REPORT_ID"::text,'&loctype=HUC&loctxt='::text,"HUC"::text,'&datatype='::text,"DATATYPE"::text);

	
UPDATE "WADE"."CATALOG_SUMMARY_MV_merge" SET 
	"GET_CAT_CO" = concat("WADE_URL"::text,'/WADE/v0.2/GetCatalog/GetCatalog.php?loctype=COUNTY&loctxt='::text,"COUNTY_FIPS"::text,'&orgid=ALL&state='::text,"STATE"::text),
	"SUM_SUPPLY_CO" = concat("WADE_URL"::text,'/WADE/v0.2/GetSummary/GetSummary.php?loctype=COUNTY&loctxt='::text,"COUNTY_FIPS"::text,'&orgid='::text,"ORGANIZATION_ID"::text,'&reportid='::text,"REPORT_ID"::text,'&datatype='::text,"DATATYPE"::text),
	"SUM_AVAIL_CO" = concat("WADE_URL"::text,'/WADE/v0.2/GetSummary/GetSummary.php?loctype=COUNTY&loctxt='::text,"COUNTY_FIPS"::text,'&orgid='::text,"ORGANIZATION_ID"::text,'&reportid='::text,"REPORT_ID"::text,'&datatype='::text,"DATATYPE"::text),
	"SUM_USE_CO" = concat("WADE_URL"::text,'/WADE/v0.2/GetSummary/GetSummary.php?loctype=COUNTY&loctxt='::text,"COUNTY_FIPS"::text,'&orgid='::text,"ORGANIZATION_ID"::text,'&reportid='::text,"REPORT_ID"::text,'&datatype='::text,"DATATYPE"::text),
	"SUM_REG_CO" = concat("WADE_URL"::text,'/WADE/v0.2/GetSummary/GetSummary.php?loctype=COUNTY&loctxt='::text,"COUNTY_FIPS"::text,'&orgid='::text,"ORGANIZATION_ID"::text,'&reportid='::text,"REPORT_ID"::text,'&datatype='::text,"DATATYPE"::text),
	"DET_ALL_CO" = concat("WADE_URL"::text,'/WADE/v0.2/GetDetail/GetDetail.php?reportid='::text,"REPORT_ID"::text,'&loctype=COUNTY&loctxt='::text,"COUNTY_FIPS"::text,'&datatype='::text,"DATATYPE"::text),
	"DET_DIV_CO" = concat("WADE_URL"::text,'/WADE/v0.2/GetDetail/GetDetail.php?reportid='::text,"REPORT_ID"::text,'&loctype=COUNTY&loctxt='::text,"COUNTY_FIPS"::text,'&datatype='::text,"DATATYPE"::text),
	"DET_CUSE_CO" = concat("WADE_URL"::text,'/WADE/v0.2/GetDetail/GetDetail.php?reportid='::text,"REPORT_ID"::text,'&loctype=COUNTY&loctxt='::text,"COUNTY_FIPS"::text,'&datatype='::text,"DATATYPE"::text),
	"DET_RF_CO" = concat("WADE_URL"::text,'/WADE/v0.2/GetDetail/GetDetail.php?reportid='::text,"REPORT_ID"::text,'&loctype=COUNTY&loctxt='::text,"COUNTY_FIPS"::text,'&datatype='::text,"DATATYPE"::text);

SELECT * FROM "WADE"."CATALOG_SUMMARY_MV_merge" ORDER BY "ID";