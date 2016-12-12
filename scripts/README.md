# Script for Web Service Return XML Data Ingestion into PostgreSQL
A collaborative activity of the Water Data Exchange or WaDE project


Description
----------

Generally, the following Code performs an ‘http_get’ call, which queries a web service and returns the result in XML, parses it into a PostgreSQL 9.5 - friendly format, and enters the results into a database table.

Specifically, the script creates a temporary table to store the XML returns from the http_get calls. The unnecessary snippets of XML data are trimmed, and the ‘character varying’ data type is converted into XML, which is required for XPATH to work. 

The table where the data will be ingested is created next, and finally XPATH is used to extract data from the XML results into their respective columns in the table. 

If for any reason, the http_get return is empty, it will be recorded as a NULL value in the temporary table, and the later portions of the code will simply skip the NULL row and complete the rest of the query.

The http_get extension will give a timeout error if the web service retrieval takes too long.

WaDE_Central_Catalog_Data_Ingestion_Script.sql performs the call for all states/organizations, while General_PostgreSQL_Data_Ingestion_Script.sql contains the code for a generic, single-state, single-organization call.
