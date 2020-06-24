/* Generated Code (IMPORT) */
/* Source File: clothing_Store_Data.csv */
/* Source Path: /folders/myfolders/sasuser.v94 */
/* Code generated on: 10/26/19, 3:30 PM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/folders/myfolders/sasuser.v94/Clothing_Store_Data.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.IMPORT;
	GETNAMES=YES;

Data ClothingSales;
	infile '/folders/myfolders/sasuser.v94/Clothing_Store_Data.csv' dlm=',' firstobs=2;
	input CID Zip FRE MON CC AVRG PSWEAT PKNITop PKNITDress PBBLouse PBJ PCAR PCAS PShirt Pdress PSuit POW PJ PF PL PC GMP PROMOS DAYS MDown CLUST Percent IDays Ilife; 
run;
	
PROC MEANS DATA=ClothingSales;
	VAR CID Zip FRE MON CC AVRG PSWEAT PKNITop PKNITDress PBBLouse PBJ PCAR PCAS PShirt Pdress PSuit POW PJ PF PL PC GMP PROMOS DAYS MDown CLUST Percent IDays Ilife;
	Title 'Summary of Clothing Sales Data';
RUN;


PROC UNIVARIATE DATA=ClothingSales;
	VAR Zip FRE MON CC AVRG PSWEAT PKNITop PKNITDress PBBLouse PBJ PCAR PCAS PShirt Pdress PSuit POW PJ PF PL PC GMP PROMOS DAYS MDown CLUST Percent IDays Ilife;
	HISTOGRAM FRE MON CC AVRG PSWEAT PKNITop PKNITDress PBBLouse PBJ PCAR PCAS PShirt Pdress PSuit POW PJ PF PL PC GMP PROMOS DAYS MDown CLUST Percent IDays Ilife/ NORMAL;
	PROBPLOT FRE MON CC AVRG PSWEAT PKNITop PKNITDress PBBLouse PBJ PCAR PCAS PShirt Pdress PSuit POW PJ PF PL PC GMP PROMOS DAYS MDown CLUST Percent IDays Ilife; 
	TITLE 'Univariate Analysis';
RUN;


/* relationship between # of marketing promotions (PROMOS) and average amt spent (AVRG), total number of visit (FRE) Total Net Sales (MON) Length as customer (DAYS)
Gross margin percentage (GMP) */

PROC CORR Data=ClothingSales SPEARMAN;
	VAR PROMOS;
	WITH AVRG FRE MON DAYS GMP ;
	TITLE 'Correlation of Number of Marketing Promotions on File';
Run;

*/


PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);


