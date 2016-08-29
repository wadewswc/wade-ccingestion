# Use of http_get function for Web Service Returns
A collaborative activity of the Water Data Exchange or WaDE project


Description
----------
The script to ingest WaDE Central Catalog data into PostgreSQL requires the use of http_get function in PostgreSQL. The required files to set up the http extension in PostgreSQL are provided in a zipped file here. The files were obtained from Ms. Regina Obe, Project Steering Committee Member and Developer of PostGIS project (email: lr@pcorp.us). The items in the zipped folder are for a Windows/Postgres implementation, and might not work on for Linux users. 


Instructions for Use
----------
Unzip the file and copy the contents into same named folder of the PostgreSQL 9.5 install (usually in C:\Program Files\PostgreSQL\9.5) (for example: Copy the contents from ‘bin’ folder into the ‘bin’ folder of the PostgreSQL 9.5 installation folder). 
The curl was compiled against the most recent SSL shipped with Windows EDB installs.  So it won't work on anything lower than PostgreSQL 9.5.2 x 64bit. Also make sure to not overwrite any other files you may have.
Once the files have been copied into the install folder, run the following query in the database:
 
CREATE EXTENSION http;

This will create the extensions required for the http_get function to work.
