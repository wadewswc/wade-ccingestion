# Script for Web Service Return XML Data Ingestion into PostgreSQL
A collaborative activity of the Water Data Exchange or WaDE project


Description
----------

The following Code performs a ‘http_get’ call, which returns a Web Service in XML format into PostgreSQL 9.5, and ingests the data from the Web Service return into database table.

The script creates a temporary table for the http_get calls, which stores the XML returns from the http_get call. 
Next, the unnecessary snippets from XML Data are removed, and the ‘character varying’ data type is converted into XML data type (required for XPATH to work). 

The table where the data will be ingested into is created next, and finally XPATH is used to extract data from the XML content into respective columns in the table. 

If for any reason, the http_get return is empty, it will get recorded as a NULL value in the temporary table. And the later part of the code will simply skip the NULL row and complete the rest of the query.
