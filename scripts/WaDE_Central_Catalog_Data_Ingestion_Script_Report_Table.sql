----------------  /* WaDE Central Catalog Data Ingestion into PostgreSQL*/  -----------------

-- The following Code performs a http_get call, which returns a Web Service in XML format, and ingests the data from the Web Service return into PostgreSQL table 



/*******************************************************************************************/
----------- Step 0: Set timeout (according to the state requiring longest time) -------------
/*******************************************************************************************/


SET http.timeout_msec = 20000;


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
  OWNER TO "postgres";


/*******************************************************************************************/
----------- Step 2: Insert XML return from http_get call into a temporary table ------------
------------------- Leave out State by trial if the script produces error ------------------
/*******************************************************************************************/


-- ARIZONA
DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://arizonawade.com/WADE/v0.2/GetCatalog/GetCatalog.php?loctype=REPORTUNIT&loctxt=3&orgid=ADWR&state=48');
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
		SELECT content FROM http_get('http://wade.sdsc.edu/WADE/v0.2/GetCatalog/GetCatalog.php?loctype=REPORTUNIT&loctxt=DAU29814&orgid=CA-DWR&state=49');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to California web service';
        END;
    END;
$$;
--

-- COLORADO
DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://www.westernstateswater.org/Colorado/WADE/v0.2/GetCatalog/GetCatalog.php?loctype=REPORTUNIT&loctxt=30&orgid=CODWR&state=42');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to Colorado web service';
        END;
    END;
$$;
--

-- IDAHO
DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://www.westernstateswater.org/Idaho/WADE/v0.2/GetCatalog/GetCatalog.php?loctype=REPORTUNIT&loctxt=77&orgid=IDWR&state=56');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to Idaho';
        END;
    END;
$$;
--

-- KANSAS
DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://wade.kda.ks.gov/WADE/v0.2/GetCatalog/GetCatalog.php?loctype=COUNTY&loctxt=20195&orgid=KDA-DWR&state=39');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to Kansas web service';
        END;
    END;
$$;
--

-- NEBRASKA
DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://www.westernstateswater.org/Nebraska/WADE/v0.2/GetCatalog/GetCatalog.php?loctype=REPORTUNIT&loctxt=5&orgid=NeDNR&state=41');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to Nebraska web service';
        END;
    END;
$$;
--
-- NEVADA
DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://wade.water.nv.gov/WADE/v0.2/GetCatalog/GetCatalog.php?loctype=REPORTUNIT&loctxt=108&orgid=NDWR&state=53');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to Nevada web service';
        END;
    END;
$$;
--

-- NEW MEXICO
DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://www.westernstateswater.org/NewMexico/WADE/v0.2/GetCatalog/GetCatalog.php?loctype=REPORTUNIT&loctxt=AWR&orgid=NMOSE&state=35');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to New Mexico web service';
        END;
    END;
$$;
--

-- OKLAHOMA 
DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://data.owrb.ok.gov:8080/WADE/v0.2/GetCatalog/GetCatalog.php?loctype=REPORTUNIT&loctxt=12&orgid=OWRB&state=36');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to Oklahoma Web service';
        END;
    END;
$$;
--

-- OREGON
DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://wade.wrd.state.or.us/WADE/v0.2/GetCatalog/GetCatalog.php?loctype=HUC&loctxt=17070301&orgid=OREGON-WRD&state=57');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to Oregon';
        END;
    END;
$$;
--

-- SOUTH DAKOTA

-- UTAH
DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://www.water.utah.gov/DWRE/WADE/v0.2/GetCatalog/GetCatalog.php?loctype=REPORTUNIT&loctxt=05-02-04&orgid=utwre&state=46');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to Utah DWRE Web service';
        END;
    END;
$$;

DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://www.water.utah.gov/DWRT/WADE/v0.2/GetCatalog/GetCatalog.php?loctype=REPORTUNIT&loctxt=05-02-04&orgid=UTDWRT&state=46');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to Utah DWRT Web service';
        END;
    END;
$$;
--

-- WYOMING 
DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://www.westernstateswater.org/Wyoming/WADE/v0.2/GetCatalog/GetCatalog.php?loctype=REPORTUNIT&loctxt=2&orgid=WYWDC&state=ALL');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to Wyoming WDC Web service';
        END;
    END;
$$;
--

DO $$ 
    BEGIN
        BEGIN
		INSERT INTO "WADE"."XMLContent" ("XML_CONTENT")
		SELECT content FROM http_get('http://www.westernstateswater.org/WYSEO/WADE/v0.2/GetCatalog/GetCatalog.php?loctype=REPORTUNIT&loctxt=2&orgid=WYSEO&state=ALL');
	EXCEPTION
		WHEN internal_error THEN RAISE NOTICE 'Problem while connecting to Wyoming SEO Web service';
        END;
    END;
$$;
--

--WASHINGTON


--

/*******************************************************************************************/
--- Step 3: Remove unnecessary snippets from XML Data, And Convert character varying data type to XML ---
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
------------- Step 4: Create the table where you want to ingest the data into --------------
/*******************************************************************************************/


-- Table: "WADE"."REPORT_test"
DROP TABLE IF EXISTS "WADE"."REPORT_test";

CREATE TABLE "WADE"."REPORT_test"
(
  "ORGANIZATION_ID" character varying(10) NOT NULL, -- Unique identifier assigned to the organization.
  "REPORT_ID" character varying NOT NULL, -- Unique identifier assigned to the report by the reporting organization.
  "REPORTING_DATE" character varying NOT NULL, -- Date on which the report was created.
  "REPORTING_YEAR" character varying NOT NULL, -- year for which the report was created.
  "REPORT_NAME" character varying, -- Name of the report
  "REPORT_LINK" character varying, -- Link to the PDF or web page for teh narrative report that contains the information.
  "YEAR_TYPE" character varying, -- Report year type: Calendar year, Water Year, etc.  If not provided, then Calendar year will be assumed.
  CONSTRAINT "PK_REPORT_test" PRIMARY KEY ("ORGANIZATION_ID", "REPORT_ID")
  USING INDEX TABLESPACE "WADE_IX"

)
WITH (
  OIDS=FALSE
);
ALTER TABLE "WADE"."REPORT_test"
  OWNER TO "WADE";
GRANT ALL ON TABLE "WADE"."REPORT_test" TO "WADE";
GRANT SELECT ON TABLE "WADE"."REPORT_test" TO "WADE_APP";
GRANT ALL ON TABLE "WADE"."REPORT_test" TO "WADE_ADMIN" WITH GRANT OPTION;


/*******************************************************************************************/
----------------- Step 5: Insert Cleaned up XML Data into created -table -------------------
/*******************************************************************************************/

INSERT INTO "WADE"."REPORT_test" ("ORGANIZATION_ID", "REPORT_ID", "REPORTING_DATE", "REPORTING_YEAR", "REPORT_NAME", "REPORT_LINK", "YEAR_TYPE")

SELECT 
     (xpath('OrganizationIdentifier/text()',exp))[1]::text As ORGANIZATION_ID,
     unnest(xpath('Report/ReportIdentifier/text()',exp))::text As REPORT_ID,
     unnest(xpath('Report/ReportingDate/text()',exp))::text As REPORTING_DATE,
     unnest(xpath('Report/ReportingYear/text()',exp))::text As REPORTING_YEAR,
     unnest(xpath('Report/ReportName/text()',exp))::text As REPORT_NAME,
     (xpath('Report/ReportLink/text()',exp))::text As REPORT_LINK,
     unnest(xpath('Report/YearType/text()',exp))::text As YEAR_TYPE
     


FROM (
SELECT 
    unnest(xpath('//Organization',"XML_CONTENT")) As exp
FROM "WADE"."XMLContent") As foo;

DELETE FROM "WADE"."REPORT_test"
WHERE "ORGANIZATION_ID" = 'SAMPLE1' OR "ORGANIZATION_ID" = 'SAMPLE2' OR "ORGANIZATION_ID" = 'SAMPLE3';

/*******************************************************************************************/
------------------------------------ Check for Data ----------------------------------------
/*******************************************************************************************/

SELECT * FROM  "WADE"."REPORT_test";

/*******************************************************************************************/
---------------------------------- End of Script --------------------------------------------
/*******************************************************************************************/