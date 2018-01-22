----------------  /* WaDE Central Catalog Data Ingestion into PostgreSQL*/  -----------------

-- The following Code performs a http_get call, which returns a Web Service in XML format, and ingests the data from the Web Service return into PostgreSQL table 


/*******************************************************************************************/
----------- Step 0: Set timeout (according to the state requiring longest time) -------------
/*******************************************************************************************/


SET http.timeout_msec = 10000;


/*******************************************************************************************/
----------- Step 1: Create a temporary table to hold the HTTP_GET return --------------------
/*******************************************************************************************/

-- Table: "WADE"."XMLContent"

DROP TABLE IF EXISTS "WADE"."XMLContent";

CREATE TABLE "WADE"."XMLContent"
(
  "ID" serial NOT NULL,
  "XML_CONTENT" character varying,
  CONSTRAINT "XMLContent_pkey" PRIMARY KEY ("ID")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "WADE"."XMLContent"
  OWNER TO postgres;


/*******************************************************************************************/
----------- Step 2: Insert XML return from http_get call into a temporary table ------------
----------------------- Warm Up run to make sure the URLs are working ----------------------
/*******************************************************************************************/


-- ALASKA Alaska DNR Catalog will be retrieved here.

-- ARIZONA
DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://www.arizonawade.com/WADE/v0.2/GetCatalog/GetCatalog_GetAll.php?orgid=ADWR');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to Arizona web service';
        END;
    END;
$$;

-- CALIFORNIA
DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://wade.sdsc.edu/WADE/v0.2/GetCatalog/GetCatalog_GetAll.php?orgid=CA-DWR');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to California web service';
        END;
    END;
$$;

-- COLORADO
DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://www.westernstateswater.org/Colorado/WADE/v0.2/GetCatalog/GetCatalog_GetAll.php?orgid=CODWR');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to Colorado web service';
        END;
    END;
$$;

DROP TABLE "WADE"."XMLContent";

/*******************************************************************************************/
----------- Step 3: Recreate a temporary table to hold the HTTP_GET return -----------------
/*******************************************************************************************/

-- Table: "WADE"."XMLContent"

CREATE TABLE "WADE"."XMLContent"
(
  "ID" serial NOT NULL,
  "XML_CONTENT" character varying,
  CONSTRAINT "XMLContent_pkey" PRIMARY KEY ("ID")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "WADE"."XMLContent"
  OWNER TO postgres;

/*******************************************************************************************/
----------- Step 4: Insert XML return from http_get call into a temporary table ------------
---------- Comment out State by trial/Adjust timeouts if the script produces error ---------
/*******************************************************************************************/


-- ALASKA Alaska DNR Catalog will be retrieved here.

-- ARIZONA
DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://www.arizonawade.com/WADE/v0.2/GetCatalog/GetCatalog_GetAll.php?orgid=ADWR');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to Arizona web service';
        END;
    END;
$$;

-- CALIFORNIA
DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://wade.sdsc.edu/WADE/v0.2/GetCatalog/GetCatalog_GetAll.php?orgid=CA-DWR');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to California web service';
        END;
    END;
$$;

-- COLORADO
DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://www.westernstateswater.org/Colorado/WADE/v0.2/GetCatalog/GetCatalog_GetAll.php?orgid=CODWR');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to Colorado web service';
        END;
    END;
$$;


/*******************************************************************************************/
--- Step 5: Remove unnecessary snippets from XML Data, And Convert character varying data type to XML ---
/*******************************************************************************************/


UPDATE "WADE"."XMLContent"
SET "XML_CONTENT" = REPLACE("XML_CONTENT",'WC:', '');

UPDATE "WADE"."XMLContent"
SET "XML_CONTENT" = REPLACE("XML_CONTENT",'<?xml-stylesheet type="text/xsl" href="../styles/catalog.xsl"?>', '');

UPDATE "WADE"."XMLContent"
SET "XML_CONTENT" = REPLACE("XML_CONTENT",' xmlns:WC="http://www.exchangenetwork.net/schema/WaDE/0.2"', '');

UPDATE "WADE"."XMLContent"
SET "XML_CONTENT" = REPLACE("XML_CONTENT",'
<WaDECatalog>', '<WaDECatalog>');

UPDATE "WADE"."XMLContent"
SET "XML_CONTENT" = REPLACE("XML_CONTENT",'                           ', '');

ALTER TABLE "WADE"."XMLContent" ALTER COLUMN "XML_CONTENT" TYPE XML using "XML_CONTENT"::XML;


/*******************************************************************************************/
--------------------------------- Check for Content ----------------------------------------
SELECT * FROM "WADE"."XMLContent";
/*******************************************************************************************/




/*******************************************************************************************/
------------- Step 6: Create the table where you want to ingest the data into --------------
/*******************************************************************************************/


-- Table: "WADE"."CATALOG_SUMMARY_MV"

DROP TABLE IF EXISTS "WADE"."CATALOG_SUMMARY_MV_ATOC";

CREATE TABLE "WADE"."CATALOG_SUMMARY_MV_ATOC"
(
  "ID" serial NOT NULL,
  "ORGANIZATION_ID" character varying(10) NOT NULL,
  "WADE_URL" character varying(300),
  "REPORT_ID" character varying(35) NOT NULL,
  "DATACATEGORY" text NOT NULL,
  "DATATYPE" text NOT NULL,
  "STATE" character varying(2),
  "REPORT_UNIT_ID" character varying(35) NOT NULL,
  "REPORTING_UNIT_NAME" character varying (300),
  "COUNTY_FIPS" character(5),
  "HUC" character varying(12),
  "JOIN_FIELD" character varying (100),
  "SYM_TOGGLE_RU" character varying (5),
  "SYM_TOGGLE_HUC" character varying (5),
  "SYM_TOGGLE_CO" character varying (5),
  "GET_CAT_RU" character varying (400),
  "GET_CAT_HUC" character varying (400),
  "GET_CAT_CO" character varying (400),
  "SUM_SUPPLY_RU" character varying (400),
  "SUM_SUPPLY_HUC" character varying (400),
  "SUM_SUPPLY_CO" character varying (400),
  "SUM_AVAIL_RU" character varying (400),
  "SUM_AVAIL_HUC" character varying (400),
  "SUM_AVAIL_CO" character varying (400),
  "SUM_USE_RU" character varying (400),
  "SUM_USE_HUC" character varying (400),
  "SUM_USE_CO" character varying (400),
  "SUM_REG_RU" character varying (400),
  "SUM_REG_HUC" character varying (400),
  "SUM_REG_CO" character varying (400),
  "DET_ALL_RU" character varying (400),
  "DET_ALL_HUC" character varying (400),
  "DET_ALL_CO" character varying (400), 
  "DET_DIV_RU" character varying (400),
  "DET_DIV_HUC" character varying (400),
  "DET_DIV_CO" character varying (400),
  "DET_CUSE_RU" character varying (400),
  "DET_CUSE_HUC" character varying (400),
  "DET_CUSE_CO" character varying (400),  
  "DET_RF_RU" character varying (400),
  "DET_RF_HUC" character varying (400),
  "DET_RF_CO" character varying (400), 
  
  CONSTRAINT "CATALOG_SUMMARY_MV_ATOC_pkey" PRIMARY KEY ("ID")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "WADE"."CATALOG_SUMMARY_MV_ATOC"
  OWNER TO postgres;
GRANT ALL ON TABLE "WADE"."CATALOG_SUMMARY_MV_ATOC" TO postgres;
GRANT ALL ON TABLE "WADE"."CATALOG_SUMMARY_MV_ATOC" TO admin;
GRANT SELECT ON TABLE "WADE"."CATALOG_SUMMARY_MV_ATOC" TO "WADE_APP";
  

/*******************************************************************************************/
----------------- Step 7: Insert Cleaned up XML Data into created -table -------------------
/*******************************************************************************************/


INSERT INTO "WADE"."CATALOG_SUMMARY_MV_ATOC" ("ORGANIZATION_ID", "WADE_URL", "REPORT_ID", "DATACATEGORY", "DATATYPE", "STATE", "REPORT_UNIT_ID", "REPORTING_UNIT_NAME","COUNTY_FIPS", "HUC")

SELECT 
     (xpath('//OrganizationIdentifier/text()',exp))[1]::text As ORGANIZATION_ID,
     (xpath('//WaDEURLAddress/text()',exp))[1]::text As WADE_URL,
     (xpath('//ReportIdentifier/text()',exp))[1]::text As REPORT_ID,
     (xpath('//DataCategory/text()',exp))[1]::text As DATACATEGORY,
     (xpath('//DataType/text()',exp))[1]::text As DATATYPE,
     (xpath('//State/text()',exp))[1]::text As STATE,
     (xpath('//ReportUnitIdentifier/text()',exp))[1]::text As REPORT_UNIT_ID,
     (xpath('//ReportUnitName/text()',exp))[1]::text As REPORTING_UNIT_NAME,
     (xpath('//CountyFIPS/text()',exp))[1]::text As CountyFIPS,
     (xpath('//HUC/text()',exp))[1]::text As HUC 

FROM (
SELECT 
    unnest(xpath('/WaDECatalog/Organization',"XML_CONTENT")) As exp
FROM "WADE"."XMLContent") As foo;

DELETE FROM "WADE"."CATALOG_SUMMARY_MV_ATOC"
 WHERE "ORGANIZATION_ID" = 'SAMPLE1' OR "ORGANIZATION_ID" = 'SAMPLE2' OR "ORGANIZATION_ID" = 'SAMPLE3';


/*******************************************************************************************/
------------------------------------ Check for Data ----------------------------------------
/*******************************************************************************************/

SELECT * FROM  "WADE"."CATALOG_SUMMARY_MV_ATOC";


/*******************************************************************************************/
---------------------------------- End of Script --------------------------------------------
/*******************************************************************************************/
