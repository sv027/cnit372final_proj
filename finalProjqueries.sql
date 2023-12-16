-- Query #1 
--Find Top Trending Videos:
SELECT title, view_count, likes, dislikes
FROM utubetrenddata
ORDER BY view_count DESC
FETCH FIRST 10 ROWS ONLY;

/* Query 1 Results 

TITLE                                                                                                                                                                                                                                                           VIEW_COUNT      LIKES   DISLIKES
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- ---------- ----------
Video Title 200                                                                                                                                                                                                                                                    3000000     150000       2100
Video Title 199                                                                                                                                                                                                                                                    2990000     149500       2090
Video Title 198                                                                                                                                                                                                                                                    2980000     149000       2080
Video Title 197                                                                                                                                                                                                                                                    2970000     148500       2070
Video Title 196                                                                                                                                                                                                                                                    2960000     148000       2060
Video Title 195                                                                                                                                                                                                                                                    2950000     147500       2050
Video Title 194                                                                                                                                                                                                                                                    2940000     147000       2040
Video Title 193                                                                                                                                                                                                                                                    2930000     146500       2030
Video Title 192                                                                                                                                                                                                                                                    2920000     146000       2020
Video Title 191                                                                                                                                                                                                                                                    2910000     145500       2010

10 rows selected. 

*/


-- Query #2
--- Top Youtubers with Most Subscribers:
SELECT youtuber, subscribers
FROM GlobalYoutubeStats
ORDER BY subscribers DESC
FETCH FIRST 10 ROWS ONLY;

/* Query 2 Results 
YOUTUBER                                                                                             SUBSCRIBERS
---------------------------------------------------------------------------------------------------- -----------
Youtuber200                                                                                              3000000
Youtuber199                                                                                              2990000
Youtuber198                                                                                              2980000
Youtuber197                                                                                              2970000
Youtuber196                                                                                              2960000
Youtuber195                                                                                              2950000
Youtuber194                                                                                              2940000
Youtuber193                                                                                              2930000
Youtuber192                                                                                              2920000
Youtuber191                                                                                              2910000

10 rows selected. 


*/

-- Query #3
-- Videos with Highest Likes:
SELECT title, likes
FROM video_title
ORDER BY likes DESC
FETCH FIRST 10 ROWS ONLY;

/* Query 3 Results

TITLE                                                                                                                                                                                                                                                                LIKES
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------
What is Machine Learning?                                                                                                                                                                                                                                                 
Don&#39;t learn machine learning                                                                                                                                                                                                                                          
El Chombo - Dame Tu Cosita feat. Cutty Ranks (Official Video) [Ultra Music]                                                                                                                                                                                       16445558
$456,000 Squid Game In Real Life!                                                                                                                                                                                                                                 14259033
Martin Garrix - Animals (Official Video)                                                                                                                                                                                                                          11025176
Powfu - death bed (coffee for your head) (Official Video) ft. beabadoobee                                                                                                                                                                                          7786057
The Weeknd - Save Your Tears (Official Music Video)                                                                                                                                                                                                                6823113
Glass Animals - Heat Waves (Official Video)                                                                                                                                                                                                                        6177588
I Spent 50 Hours Buried Alive                                                                                                                                                                                                                                      6055504
Maroon 5 - Animals (Official Music Video)                                                                                                                                                                                                                          5743875

10 rows selected. 
	
*/

-- Query #4
-- Videos with Most Comments:
SELECT title, comment_count
FROM utubetrenddata
ORDER BY comment_count DESC
FETCH FIRST 10 ROWS ONLY;

/* Query 4 Results 

TITLE                                                                                                                                                                                                                                                           COMMENT_COUNT
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------
Video Title 200                                                                                                                                                                                                                                                          1200
Video Title 199                                                                                                                                                                                                                                                          1199
Video Title 198                                                                                                                                                                                                                                                          1198
Video Title 197                                                                                                                                                                                                                                                          1197
Video Title 196                                                                                                                                                                                                                                                          1196
Video Title 195                                                                                                                                                                                                                                                          1195
Video Title 194                                                                                                                                                                                                                                                          1194
Video Title 193                                                                                                                                                                                                                                                          1193
Video Title 192                                                                                                                                                                                                                                                          1192
Video Title 191                                                                                                                                                                                                                                                          1191

10 rows selected. 

*/

-- Query 5
-- Find Videos with Longest Duration 
SELECT video_title, duration_in_seconds
FROM utube_analysis
ORDER BY duration_in_seconds DESC
FETCH FIRST 10 ROWS ONLY;

/* Query 5 Results 

VIDEO_TITLE                                                                                                                                                                                                                                                     DURATION_IN_SECONDS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------
How HDFC's Genius strategies KILLED the Banking Monopolies in India? : Business Case study                                                                                                                                                                                    47760
How DUBAI's Secret STRATEGY made it SUPER RICH & SUPER POWERFUL? : Dubai Growth case study                                                                                                                                                                                    44198
How Reliance is planning to KILL Amazon in INDIA? : The BIGGEST BUSINESS WAR IN INDIAN HISTORY                                                                                                                                                                                44132
Python Full Course - Learn Python in 12 Hours | Python Tutorial For Beginners | Edureka                                                                                                                                                                                       42981
Python Tutorial For Beginners In Hindi (With Notes) ??                                                                                                                                                                                                                        42743
10 Things Netflix Is Hiding About Pablo Escobar                                                                                                                                                                                                                               42336
Data Science Full Course - Learn Data Science in 10 Hours | Data Science For Beginners | Edureka                                                                                                                                                                              37436
If Turkey Raises Kashmir, India will raise Cyprus Issue| Jaishankar hits back at Erdogan over Cyprus                                                                                                                                                                          34980
AWS Tutorial For Beginners | AWS Full Course - Learn AWS In 10 Hours | AWS Training | Edureka                                                                                                                                                                                 34103
Data Science Course | Data Science Full Course | Data Scientist For Beginners | Intellipaat                                                                                                                                                                                   33960

10 rows selected. 


*/
-- Query 6
-- Top Video Categories by Views:
SELECT categoryId, SUM(view_count) AS total_views
FROM utubetrenddata
GROUP BY categoryId
ORDER BY total_views DESC
FETCH FIRST 10 ROWS ONLY;

/*  Query 6 results 


CATEGORYID TOTAL_VIEWS
---------- -----------
         1    41000000
        10    40800000
         9    40600000
         8    40400000
         7    40200000
         6    40000000
         5    39800000
         4    39600000
         3    39400000
         2    39200000

10 rows selected.

*/

-- Query 7
-- Top Creators with the Most Uploaded Videos: Stored proc with cursor sample
SELECT creator_name, COUNT(*) AS video_count
FROM utube_analysis
GROUP BY creator_name
ORDER BY video_count DESC
FETCH FIRST 10 ROWS ONLY;
/* output of above
CATEGORYID TOTAL_VIEWS
---------- -----------
         1    41000000
        10    40800000
         9    40600000
         8    40400000
         7    40200000
         6    40000000
         5    39800000
         4    39600000
         3    39400000
         2    39200000

10 rows selected. 
*/
--Drop PROCEDURE GetTopVideoCreators(p_creator_name varchar2,p_video_count NUMBER);

CREATE OR REPLACE PROCEDURE GetTopVideoCreator (p_creator_name OUT varchar2, p_video_count OUT NUMBER)
AS
    -- Create a cursor to iterate through the result set
    CURSOR top_videos_createor_cur IS
    SELECT creator_name, COUNT(*) AS video_count
    FROM utube_analysis
    GROUP BY creator_name
    ORDER BY video_count DESC ;
 BEGIN   

    -- Open the cursor
    OPEN top_videos_createor_cur;

    -- Fetch the first row into variables
    FETCH top_videos_createor_cur INTO p_creator_name,p_video_count ;

    -- Close and deallocate the cursor
    CLOSE top_videos_createor_cur;
END;

/* Output of the above query 

Procedure GETTOPVIDEOCREATOR compiled
*/
set serveroutput on;

how to run the stored proc with parameters :

DECLARE
    v_creator_name VARCHAR2(255);
    v_video_count NUMBER;
BEGIN
    GetTopVideoCreator(v_creator_name, v_video_count);
    DBMS_OUTPUT.PUT_LINE('Top Video Creator: ' || v_creator_name || ', Video Count: ' || v_video_count);
END;

/* Output of above query :

Top Video Creator: , Video Count: 11


PL/SQL procedure successfully completed.
*/

-- Query 8 - Stored Proc and Trigger Examples 
--Videos Uploaded in the Last 7 Days:
SELECT title, publishedAt
FROM utubetrenddata
WHERE publishedAt >= SYSDATE - 730
ORDER BY publishedAt DESC;


TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 200                                                                                                                                                                                                                                                 20-JUL-22
Video Title 199                                                                                                                                                                                                                                                 19-JUL-22
Video Title 198                                                                                                                                                                                                                                                 18-JUL-22
Video Title 197                                                                                                                                                                                                                                                 17-JUL-22
Video Title 196                                                                                                                                                                                                                                                 16-JUL-22
Video Title 195                                                                                                                                                                                                                                                 15-JUL-22
Video Title 194                                                                                                                                                                                                                                                 14-JUL-22
Video Title 193                                                                                                                                                                                                                                                 13-JUL-22
Video Title 192                                                                                                                                                                                                                                                 12-JUL-22
Video Title 191                                                                                                                                                                                                                                                 11-JUL-22
Video Title 190                                                                                                                                                                                                                                                 10-JUL-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 189                                                                                                                                                                                                                                                 09-JUL-22
Video Title 188                                                                                                                                                                                                                                                 08-JUL-22
Video Title 187                                                                                                                                                                                                                                                 07-JUL-22
Video Title 186                                                                                                                                                                                                                                                 06-JUL-22
Video Title 185                                                                                                                                                                                                                                                 05-JUL-22
Video Title 184                                                                                                                                                                                                                                                 04-JUL-22
Video Title 183                                                                                                                                                                                                                                                 03-JUL-22
Video Title 182                                                                                                                                                                                                                                                 02-JUL-22
Video Title 181                                                                                                                                                                                                                                                 01-JUL-22
Video Title 180                                                                                                                                                                                                                                                 30-JUN-22
Video Title 179                                                                                                                                                                                                                                                 29-JUN-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 178                                                                                                                                                                                                                                                 28-JUN-22
Video Title 177                                                                                                                                                                                                                                                 27-JUN-22
Video Title 176                                                                                                                                                                                                                                                 26-JUN-22
Video Title 175                                                                                                                                                                                                                                                 25-JUN-22
Video Title 174                                                                                                                                                                                                                                                 24-JUN-22
Video Title 173                                                                                                                                                                                                                                                 23-JUN-22
Video Title 172                                                                                                                                                                                                                                                 22-JUN-22
Video Title 171                                                                                                                                                                                                                                                 21-JUN-22
Video Title 170                                                                                                                                                                                                                                                 20-JUN-22
Video Title 169                                                                                                                                                                                                                                                 19-JUN-22
Video Title 168                                                                                                                                                                                                                                                 18-JUN-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 167                                                                                                                                                                                                                                                 17-JUN-22
Video Title 166                                                                                                                                                                                                                                                 16-JUN-22
Video Title 165                                                                                                                                                                                                                                                 15-JUN-22
Video Title 164                                                                                                                                                                                                                                                 14-JUN-22
Video Title 163                                                                                                                                                                                                                                                 13-JUN-22
Video Title 162                                                                                                                                                                                                                                                 12-JUN-22
Video Title 161                                                                                                                                                                                                                                                 11-JUN-22
Video Title 160                                                                                                                                                                                                                                                 10-JUN-22
Video Title 159                                                                                                                                                                                                                                                 09-JUN-22
Video Title 158                                                                                                                                                                                                                                                 08-JUN-22
Video Title 157                                                                                                                                                                                                                                                 07-JUN-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 156                                                                                                                                                                                                                                                 06-JUN-22
Video Title 155                                                                                                                                                                                                                                                 05-JUN-22
Video Title 154                                                                                                                                                                                                                                                 04-JUN-22
Video Title 153                                                                                                                                                                                                                                                 03-JUN-22
Video Title 152                                                                                                                                                                                                                                                 02-JUN-22
Video Title 151                                                                                                                                                                                                                                                 01-JUN-22
Video Title 150                                                                                                                                                                                                                                                 31-MAY-22
Video Title 149                                                                                                                                                                                                                                                 30-MAY-22
Video Title 148                                                                                                                                                                                                                                                 29-MAY-22
Video Title 147                                                                                                                                                                                                                                                 28-MAY-22
Video Title 146                                                                                                                                                                                                                                                 27-MAY-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 145                                                                                                                                                                                                                                                 26-MAY-22
Video Title 144                                                                                                                                                                                                                                                 25-MAY-22
Video Title 143                                                                                                                                                                                                                                                 24-MAY-22
Video Title 142                                                                                                                                                                                                                                                 23-MAY-22
Video Title 141                                                                                                                                                                                                                                                 22-MAY-22
Video Title 140                                                                                                                                                                                                                                                 21-MAY-22
Video Title 139                                                                                                                                                                                                                                                 20-MAY-22
Video Title 138                                                                                                                                                                                                                                                 19-MAY-22
Video Title 137                                                                                                                                                                                                                                                 18-MAY-22
Video Title 136                                                                                                                                                                                                                                                 17-MAY-22
Video Title 135                                                                                                                                                                                                                                                 16-MAY-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 134                                                                                                                                                                                                                                                 15-MAY-22
Video Title 133                                                                                                                                                                                                                                                 14-MAY-22
Video Title 132                                                                                                                                                                                                                                                 13-MAY-22
Video Title 131                                                                                                                                                                                                                                                 12-MAY-22
Video Title 130                                                                                                                                                                                                                                                 11-MAY-22
Video Title 129                                                                                                                                                                                                                                                 10-MAY-22
Video Title 128                                                                                                                                                                                                                                                 09-MAY-22
Video Title 127                                                                                                                                                                                                                                                 08-MAY-22
Video Title 126                                                                                                                                                                                                                                                 07-MAY-22
Video Title 125                                                                                                                                                                                                                                                 06-MAY-22
Video Title 124                                                                                                                                                                                                                                                 05-MAY-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 123                                                                                                                                                                                                                                                 04-MAY-22
Video Title 122                                                                                                                                                                                                                                                 03-MAY-22
Video Title 121                                                                                                                                                                                                                                                 02-MAY-22
Video Title 120                                                                                                                                                                                                                                                 01-MAY-22
Video Title 119                                                                                                                                                                                                                                                 30-APR-22
Video Title 118                                                                                                                                                                                                                                                 29-APR-22
Video Title 117                                                                                                                                                                                                                                                 28-APR-22
Video Title 116                                                                                                                                                                                                                                                 27-APR-22
Video Title 115                                                                                                                                                                                                                                                 26-APR-22
Video Title 114                                                                                                                                                                                                                                                 25-APR-22
Video Title 113                                                                                                                                                                                                                                                 24-APR-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 112                                                                                                                                                                                                                                                 23-APR-22
Video Title 111                                                                                                                                                                                                                                                 22-APR-22
Video Title 110                                                                                                                                                                                                                                                 21-APR-22
Video Title 109                                                                                                                                                                                                                                                 20-APR-22
Video Title 108                                                                                                                                                                                                                                                 19-APR-22
Video Title 107                                                                                                                                                                                                                                                 18-APR-22
Video Title 106                                                                                                                                                                                                                                                 17-APR-22
Video Title 105                                                                                                                                                                                                                                                 16-APR-22
Video Title 104                                                                                                                                                                                                                                                 15-APR-22
Video Title 103                                                                                                                                                                                                                                                 14-APR-22
Video Title 102                                                                                                                                                                                                                                                 13-APR-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 101                                                                                                                                                                                                                                                 12-APR-22
Video Title 100                                                                                                                                                                                                                                                 11-APR-22
Video Title 99                                                                                                                                                                                                                                                  10-APR-22
Video Title 98                                                                                                                                                                                                                                                  09-APR-22
Video Title 97                                                                                                                                                                                                                                                  08-APR-22
Video Title 96                                                                                                                                                                                                                                                  07-APR-22
Video Title 95                                                                                                                                                                                                                                                  06-APR-22
Video Title 94                                                                                                                                                                                                                                                  05-APR-22
Video Title 93                                                                                                                                                                                                                                                  04-APR-22
Video Title 92                                                                                                                                                                                                                                                  03-APR-22
Video Title 91                                                                                                                                                                                                                                                  02-APR-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 90                                                                                                                                                                                                                                                  01-APR-22
Video Title 89                                                                                                                                                                                                                                                  31-MAR-22
Video Title 88                                                                                                                                                                                                                                                  30-MAR-22
Video Title 87                                                                                                                                                                                                                                                  29-MAR-22
Video Title 86                                                                                                                                                                                                                                                  28-MAR-22
Video Title 85                                                                                                                                                                                                                                                  27-MAR-22
Video Title 84                                                                                                                                                                                                                                                  26-MAR-22
Video Title 83                                                                                                                                                                                                                                                  25-MAR-22
Video Title 82                                                                                                                                                                                                                                                  24-MAR-22
Video Title 81                                                                                                                                                                                                                                                  23-MAR-22
Video Title 80                                                                                                                                                                                                                                                  22-MAR-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 79                                                                                                                                                                                                                                                  21-MAR-22
Video Title 78                                                                                                                                                                                                                                                  20-MAR-22
Video Title 77                                                                                                                                                                                                                                                  19-MAR-22
Video Title 76                                                                                                                                                                                                                                                  18-MAR-22
Video Title 75                                                                                                                                                                                                                                                  17-MAR-22
Video Title 74                                                                                                                                                                                                                                                  16-MAR-22
Video Title 73                                                                                                                                                                                                                                                  15-MAR-22
Video Title 72                                                                                                                                                                                                                                                  14-MAR-22
Video Title 71                                                                                                                                                                                                                                                  13-MAR-22
Video Title 70                                                                                                                                                                                                                                                  12-MAR-22
Video Title 69                                                                                                                                                                                                                                                  11-MAR-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 68                                                                                                                                                                                                                                                  10-MAR-22
Video Title 67                                                                                                                                                                                                                                                  09-MAR-22
Video Title 66                                                                                                                                                                                                                                                  08-MAR-22
Video Title 65                                                                                                                                                                                                                                                  07-MAR-22
Video Title 64                                                                                                                                                                                                                                                  06-MAR-22
Video Title 63                                                                                                                                                                                                                                                  05-MAR-22
Video Title 62                                                                                                                                                                                                                                                  04-MAR-22
Video Title 61                                                                                                                                                                                                                                                  03-MAR-22
Video Title 60                                                                                                                                                                                                                                                  02-MAR-22
Video Title 59                                                                                                                                                                                                                                                  01-MAR-22
Video Title 58                                                                                                                                                                                                                                                  28-FEB-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 57                                                                                                                                                                                                                                                  27-FEB-22
Video Title 56                                                                                                                                                                                                                                                  26-FEB-22
Video Title 55                                                                                                                                                                                                                                                  25-FEB-22
Video Title 54                                                                                                                                                                                                                                                  24-FEB-22
Video Title 53                                                                                                                                                                                                                                                  23-FEB-22
Video Title 52                                                                                                                                                                                                                                                  22-FEB-22
Video Title 51                                                                                                                                                                                                                                                  21-FEB-22
Video Title 50                                                                                                                                                                                                                                                  20-FEB-22
Video Title 49                                                                                                                                                                                                                                                  19-FEB-22
Video Title 48                                                                                                                                                                                                                                                  18-FEB-22
Video Title 47                                                                                                                                                                                                                                                  17-FEB-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 46                                                                                                                                                                                                                                                  16-FEB-22
Video Title 45                                                                                                                                                                                                                                                  15-FEB-22
Video Title 44                                                                                                                                                                                                                                                  14-FEB-22
Video Title 43                                                                                                                                                                                                                                                  13-FEB-22
Video Title 42                                                                                                                                                                                                                                                  12-FEB-22
Video Title 41                                                                                                                                                                                                                                                  11-FEB-22
Video Title 40                                                                                                                                                                                                                                                  10-FEB-22
Video Title 39                                                                                                                                                                                                                                                  09-FEB-22
Video Title 38                                                                                                                                                                                                                                                  08-FEB-22
Video Title 37                                                                                                                                                                                                                                                  07-FEB-22
Video Title 36                                                                                                                                                                                                                                                  06-FEB-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 35                                                                                                                                                                                                                                                  05-FEB-22
Video Title 34                                                                                                                                                                                                                                                  04-FEB-22
Video Title 33                                                                                                                                                                                                                                                  03-FEB-22
Video Title 32                                                                                                                                                                                                                                                  02-FEB-22
Video Title 31                                                                                                                                                                                                                                                  01-FEB-22
Video Title 30                                                                                                                                                                                                                                                  31-JAN-22
Video Title 29                                                                                                                                                                                                                                                  30-JAN-22
Video Title 28                                                                                                                                                                                                                                                  29-JAN-22
Video Title 27                                                                                                                                                                                                                                                  28-JAN-22
Video Title 26                                                                                                                                                                                                                                                  27-JAN-22
Video Title 25                                                                                                                                                                                                                                                  26-JAN-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 24                                                                                                                                                                                                                                                  25-JAN-22
Video Title 23                                                                                                                                                                                                                                                  24-JAN-22
Video Title 22                                                                                                                                                                                                                                                  23-JAN-22
Video Title 21                                                                                                                                                                                                                                                  22-JAN-22
Video Title 20                                                                                                                                                                                                                                                  21-JAN-22
Video Title 19                                                                                                                                                                                                                                                  20-JAN-22
Video Title 18                                                                                                                                                                                                                                                  19-JAN-22
Video Title 17                                                                                                                                                                                                                                                  18-JAN-22
Video Title 16                                                                                                                                                                                                                                                  17-JAN-22
Video Title 15                                                                                                                                                                                                                                                  16-JAN-22
Video Title 14                                                                                                                                                                                                                                                  15-JAN-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 13                                                                                                                                                                                                                                                  14-JAN-22
Video Title 12                                                                                                                                                                                                                                                  13-JAN-22
Video Title 11                                                                                                                                                                                                                                                  12-JAN-22
Video Title 10                                                                                                                                                                                                                                                  11-JAN-22
Video Title 9                                                                                                                                                                                                                                                   10-JAN-22
Video Title 8                                                                                                                                                                                                                                                   09-JAN-22
Video Title 7                                                                                                                                                                                                                                                   08-JAN-22
Video Title 6                                                                                                                                                                                                                                                   07-JAN-22
Video Title 5                                                                                                                                                                                                                                                   06-JAN-22
Video Title 4                                                                                                                                                                                                                                                   05-JAN-22
Video Title 3                                                                                                                                                                                                                                                   04-JAN-22

TITLE                                                                                                                                                                                                                                                           PUBLISHED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
Video Title 2                                                                                                                                                                                                                                                   03-JAN-22
Video Title 1                                                                                                                                                                                                                                                   02-JAN-22

200 rows selected. 



CREATE OR REPLACE PROCEDURE GetRecentVideos
IS
BEGIN
    FOR video_rec IN (
        SELECT title, publishedAt
        FROM utubetrenddata
        WHERE publishedAt >= SYSDATE - 730
        ORDER BY publishedAt DESC
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Title: ' || video_rec.title || ', Published At: ' || TO_CHAR(video_rec.publishedAt, 'DD-MON-YYYY HH24:MI:SS'));
    END LOOP;
END;

/*Output of the above query:

Procedure GETRECENTVIDEOS compiled
*/

set serveroutput on;

-- Executing the procedure:

Exec GetRecentVideos;

## out put of the above query ##

Title: Video Title 200, Published At: 20-JUL-2022 00:00:00
Title: Video Title 199, Published At: 19-JUL-2022 00:00:00
Title: Video Title 198, Published At: 18-JUL-2022 00:00:00
Title: Video Title 197, Published At: 17-JUL-2022 00:00:00
Title: Video Title 196, Published At: 16-JUL-2022 00:00:00
Title: Video Title 195, Published At: 15-JUL-2022 00:00:00
Title: Video Title 194, Published At: 14-JUL-2022 00:00:00
Title: Video Title 193, Published At: 13-JUL-2022 00:00:00
Title: Video Title 192, Published At: 12-JUL-2022 00:00:00
Title: Video Title 191, Published At: 11-JUL-2022 00:00:00
Title: Video Title 190, Published At: 10-JUL-2022 00:00:00
Title: Video Title 189, Published At: 09-JUL-2022 00:00:00
Title: Video Title 188, Published At: 08-JUL-2022 00:00:00
Title: Video Title 187, Published At: 07-JUL-2022 00:00:00
Title: Video Title 186, Published At: 06-JUL-2022 00:00:00
Title: Video Title 185, Published At: 05-JUL-2022 00:00:00
Title: Video Title 184, Published At: 04-JUL-2022 00:00:00
Title: Video Title 183, Published At: 03-JUL-2022 00:00:00
Title: Video Title 182, Published At: 02-JUL-2022 00:00:00
Title: Video Title 181, Published At: 01-JUL-2022 00:00:00
Title: Video Title 180, Published At: 30-JUN-2022 00:00:00
Title: Video Title 179, Published At: 29-JUN-2022 00:00:00
Title: Video Title 178, Published At: 28-JUN-2022 00:00:00
Title: Video Title 177, Published At: 27-JUN-2022 00:00:00
Title: Video Title 176, Published At: 26-JUN-2022 00:00:00
Title: Video Title 175, Published At: 25-JUN-2022 00:00:00
Title: Video Title 174, Published At: 24-JUN-2022 00:00:00
Title: Video Title 173, Published At: 23-JUN-2022 00:00:00
Title: Video Title 172, Published At: 22-JUN-2022 00:00:00
Title: Video Title 171, Published At: 21-JUN-2022 00:00:00
Title: Video Title 170, Published At: 20-JUN-2022 00:00:00
Title: Video Title 169, Published At: 19-JUN-2022 00:00:00
Title: Video Title 168, Published At: 18-JUN-2022 00:00:00
Title: Video Title 167, Published At: 17-JUN-2022 00:00:00
Title: Video Title 166, Published At: 16-JUN-2022 00:00:00
Title: Video Title 165, Published At: 15-JUN-2022 00:00:00
Title: Video Title 164, Published At: 14-JUN-2022 00:00:00
Title: Video Title 163, Published At: 13-JUN-2022 00:00:00
Title: Video Title 162, Published At: 12-JUN-2022 00:00:00
Title: Video Title 161, Published At: 11-JUN-2022 00:00:00
Title: Video Title 160, Published At: 10-JUN-2022 00:00:00
Title: Video Title 159, Published At: 09-JUN-2022 00:00:00
Title: Video Title 158, Published At: 08-JUN-2022 00:00:00
Title: Video Title 157, Published At: 07-JUN-2022 00:00:00
Title: Video Title 156, Published At: 06-JUN-2022 00:00:00
Title: Video Title 155, Published At: 05-JUN-2022 00:00:00
Title: Video Title 154, Published At: 04-JUN-2022 00:00:00
Title: Video Title 153, Published At: 03-JUN-2022 00:00:00
Title: Video Title 152, Published At: 02-JUN-2022 00:00:00
Title: Video Title 151, Published At: 01-JUN-2022 00:00:00
Title: Video Title 150, Published At: 31-MAY-2022 00:00:00
Title: Video Title 149, Published At: 30-MAY-2022 00:00:00
Title: Video Title 148, Published At: 29-MAY-2022 00:00:00
Title: Video Title 147, Published At: 28-MAY-2022 00:00:00
Title: Video Title 146, Published At: 27-MAY-2022 00:00:00
Title: Video Title 145, Published At: 26-MAY-2022 00:00:00
Title: Video Title 144, Published At: 25-MAY-2022 00:00:00
Title: Video Title 143, Published At: 24-MAY-2022 00:00:00
Title: Video Title 142, Published At: 23-MAY-2022 00:00:00
Title: Video Title 141, Published At: 22-MAY-2022 00:00:00
Title: Video Title 140, Published At: 21-MAY-2022 00:00:00
Title: Video Title 139, Published At: 20-MAY-2022 00:00:00
Title: Video Title 138, Published At: 19-MAY-2022 00:00:00
Title: Video Title 137, Published At: 18-MAY-2022 00:00:00
Title: Video Title 136, Published At: 17-MAY-2022 00:00:00
Title: Video Title 135, Published At: 16-MAY-2022 00:00:00
Title: Video Title 134, Published At: 15-MAY-2022 00:00:00
Title: Video Title 133, Published At: 14-MAY-2022 00:00:00
Title: Video Title 132, Published At: 13-MAY-2022 00:00:00
Title: Video Title 131, Published At: 12-MAY-2022 00:00:00
Title: Video Title 130, Published At: 11-MAY-2022 00:00:00
Title: Video Title 129, Published At: 10-MAY-2022 00:00:00
Title: Video Title 128, Published At: 09-MAY-2022 00:00:00
Title: Video Title 127, Published At: 08-MAY-2022 00:00:00
Title: Video Title 126, Published At: 07-MAY-2022 00:00:00
Title: Video Title 125, Published At: 06-MAY-2022 00:00:00
Title: Video Title 124, Published At: 05-MAY-2022 00:00:00
Title: Video Title 123, Published At: 04-MAY-2022 00:00:00
Title: Video Title 122, Published At: 03-MAY-2022 00:00:00
Title: Video Title 121, Published At: 02-MAY-2022 00:00:00
Title: Video Title 120, Published At: 01-MAY-2022 00:00:00
Title: Video Title 119, Published At: 30-APR-2022 00:00:00
Title: Video Title 118, Published At: 29-APR-2022 00:00:00
Title: Video Title 117, Published At: 28-APR-2022 00:00:00
Title: Video Title 116, Published At: 27-APR-2022 00:00:00
Title: Video Title 115, Published At: 26-APR-2022 00:00:00
Title: Video Title 114, Published At: 25-APR-2022 00:00:00
Title: Video Title 113, Published At: 24-APR-2022 00:00:00
Title: Video Title 112, Published At: 23-APR-2022 00:00:00
Title: Video Title 111, Published At: 22-APR-2022 00:00:00
Title: Video Title 110, Published At: 21-APR-2022 00:00:00
Title: Video Title 109, Published At: 20-APR-2022 00:00:00
Title: Video Title 108, Published At: 19-APR-2022 00:00:00
Title: Video Title 107, Published At: 18-APR-2022 00:00:00
Title: Video Title 106, Published At: 17-APR-2022 00:00:00
Title: Video Title 105, Published At: 16-APR-2022 00:00:00
Title: Video Title 104, Published At: 15-APR-2022 00:00:00
Title: Video Title 103, Published At: 14-APR-2022 00:00:00
Title: Video Title 102, Published At: 13-APR-2022 00:00:00
Title: Video Title 101, Published At: 12-APR-2022 00:00:00
Title: Video Title 100, Published At: 11-APR-2022 00:00:00
Title: Video Title 99, Published At: 10-APR-2022 00:00:00
Title: Video Title 98, Published At: 09-APR-2022 00:00:00
Title: Video Title 97, Published At: 08-APR-2022 00:00:00
Title: Video Title 96, Published At: 07-APR-2022 00:00:00
Title: Video Title 95, Published At: 06-APR-2022 00:00:00
Title: Video Title 94, Published At: 05-APR-2022 00:00:00
Title: Video Title 93, Published At: 04-APR-2022 00:00:00
Title: Video Title 92, Published At: 03-APR-2022 00:00:00
Title: Video Title 91, Published At: 02-APR-2022 00:00:00
Title: Video Title 90, Published At: 01-APR-2022 00:00:00
Title: Video Title 89, Published At: 31-MAR-2022 00:00:00
Title: Video Title 88, Published At: 30-MAR-2022 00:00:00
Title: Video Title 87, Published At: 29-MAR-2022 00:00:00
Title: Video Title 86, Published At: 28-MAR-2022 00:00:00
Title: Video Title 85, Published At: 27-MAR-2022 00:00:00
Title: Video Title 84, Published At: 26-MAR-2022 00:00:00
Title: Video Title 83, Published At: 25-MAR-2022 00:00:00
Title: Video Title 82, Published At: 24-MAR-2022 00:00:00
Title: Video Title 81, Published At: 23-MAR-2022 00:00:00
Title: Video Title 80, Published At: 22-MAR-2022 00:00:00
Title: Video Title 79, Published At: 21-MAR-2022 00:00:00
Title: Video Title 78, Published At: 20-MAR-2022 00:00:00
Title: Video Title 77, Published At: 19-MAR-2022 00:00:00
Title: Video Title 76, Published At: 18-MAR-2022 00:00:00
Title: Video Title 75, Published At: 17-MAR-2022 00:00:00
Title: Video Title 74, Published At: 16-MAR-2022 00:00:00
Title: Video Title 73, Published At: 15-MAR-2022 00:00:00
Title: Video Title 72, Published At: 14-MAR-2022 00:00:00
Title: Video Title 71, Published At: 13-MAR-2022 00:00:00
Title: Video Title 70, Published At: 12-MAR-2022 00:00:00
Title: Video Title 69, Published At: 11-MAR-2022 00:00:00
Title: Video Title 68, Published At: 10-MAR-2022 00:00:00
Title: Video Title 67, Published At: 09-MAR-2022 00:00:00
Title: Video Title 66, Published At: 08-MAR-2022 00:00:00
Title: Video Title 65, Published At: 07-MAR-2022 00:00:00
Title: Video Title 64, Published At: 06-MAR-2022 00:00:00
Title: Video Title 63, Published At: 05-MAR-2022 00:00:00
Title: Video Title 62, Published At: 04-MAR-2022 00:00:00
Title: Video Title 61, Published At: 03-MAR-2022 00:00:00
Title: Video Title 60, Published At: 02-MAR-2022 00:00:00
Title: Video Title 59, Published At: 01-MAR-2022 00:00:00
Title: Video Title 58, Published At: 28-FEB-2022 00:00:00
Title: Video Title 57, Published At: 27-FEB-2022 00:00:00
Title: Video Title 56, Published At: 26-FEB-2022 00:00:00
Title: Video Title 55, Published At: 25-FEB-2022 00:00:00
Title: Video Title 54, Published At: 24-FEB-2022 00:00:00
Title: Video Title 53, Published At: 23-FEB-2022 00:00:00
Title: Video Title 52, Published At: 22-FEB-2022 00:00:00
Title: Video Title 51, Published At: 21-FEB-2022 00:00:00
Title: Video Title 50, Published At: 20-FEB-2022 00:00:00
Title: Video Title 49, Published At: 19-FEB-2022 00:00:00
Title: Video Title 48, Published At: 18-FEB-2022 00:00:00
Title: Video Title 47, Published At: 17-FEB-2022 00:00:00
Title: Video Title 46, Published At: 16-FEB-2022 00:00:00
Title: Video Title 45, Published At: 15-FEB-2022 00:00:00
Title: Video Title 44, Published At: 14-FEB-2022 00:00:00
Title: Video Title 43, Published At: 13-FEB-2022 00:00:00
Title: Video Title 42, Published At: 12-FEB-2022 00:00:00
Title: Video Title 41, Published At: 11-FEB-2022 00:00:00
Title: Video Title 40, Published At: 10-FEB-2022 00:00:00
Title: Video Title 39, Published At: 09-FEB-2022 00:00:00
Title: Video Title 38, Published At: 08-FEB-2022 00:00:00
Title: Video Title 37, Published At: 07-FEB-2022 00:00:00
Title: Video Title 36, Published At: 06-FEB-2022 00:00:00
Title: Video Title 35, Published At: 05-FEB-2022 00:00:00
Title: Video Title 34, Published At: 04-FEB-2022 00:00:00
Title: Video Title 33, Published At: 03-FEB-2022 00:00:00
Title: Video Title 32, Published At: 02-FEB-2022 00:00:00
Title: Video Title 31, Published At: 01-FEB-2022 00:00:00
Title: Video Title 30, Published At: 31-JAN-2022 00:00:00
Title: Video Title 29, Published At: 30-JAN-2022 00:00:00
Title: Video Title 28, Published At: 29-JAN-2022 00:00:00
Title: Video Title 27, Published At: 28-JAN-2022 00:00:00
Title: Video Title 26, Published At: 27-JAN-2022 00:00:00
Title: Video Title 25, Published At: 26-JAN-2022 00:00:00
Title: Video Title 24, Published At: 25-JAN-2022 00:00:00
Title: Video Title 23, Published At: 24-JAN-2022 00:00:00
Title: Video Title 22, Published At: 23-JAN-2022 00:00:00
Title: Video Title 21, Published At: 22-JAN-2022 00:00:00
Title: Video Title 20, Published At: 21-JAN-2022 00:00:00
Title: Video Title 19, Published At: 20-JAN-2022 00:00:00
Title: Video Title 18, Published At: 19-JAN-2022 00:00:00
Title: Video Title 17, Published At: 18-JAN-2022 00:00:00
Title: Video Title 16, Published At: 17-JAN-2022 00:00:00
Title: Video Title 15, Published At: 16-JAN-2022 00:00:00
Title: Video Title 14, Published At: 15-JAN-2022 00:00:00
Title: Video Title 13, Published At: 14-JAN-2022 00:00:00
Title: Video Title 12, Published At: 13-JAN-2022 00:00:00
Title: Video Title 11, Published At: 12-JAN-2022 00:00:00
Title: Video Title 10, Published At: 11-JAN-2022 00:00:00
Title: Video Title 9, Published At: 10-JAN-2022 00:00:00
Title: Video Title 8, Published At: 09-JAN-2022 00:00:00
Title: Video Title 7, Published At: 08-JAN-2022 00:00:00
Title: Video Title 6, Published At: 07-JAN-2022 00:00:00
Title: Video Title 5, Published At: 06-JAN-2022 00:00:00
Title: Video Title 4, Published At: 05-JAN-2022 00:00:00
Title: Video Title 3, Published At: 04-JAN-2022 00:00:00
Title: Video Title 2, Published At: 03-JAN-2022 00:00:00
Title: Video Title 1, Published At: 02-JAN-2022 00:00:00


PL/SQL procedure successfully completed.


-- Create a trigger
CREATE OR REPLACE TRIGGER utubetrenddata_insert_trigger
BEFORE INSERT ON utubetrenddata
FOR EACH ROW
BEGIN
    IF (:new.title IS NULL) THEN
     	raise_application_error(20000, 'Title cannot be NULL');
    END IF;
    
END;

--output of running above trigger :

Trigger UTUBETRENDDATA_INSERT_TRIGGER compiled

Testing if the trigger is getting fired : 

INSERT INTO utubetrenddata (
    video_id,
    title,
    publishedAt,
    channelId,
    channelTitle,
    categoryId,
    trending_date,
    tags,
    view_count,
    likes,
    dislikes,
    comment_count,
    thumbnail_link,
    comments_disabled,
    ratings_disabled,
    description
) VALUES (
    'VideoID1',
    NULL,
    TO_DATE('2023-12-14', 'YYYY-MM-DD'),
    'ChannelID1',
    'Channel Title 1',
    1, -- Assuming categoryId as 1
    TO_DATE('2023-12-14', 'YYYY-MM-DD'), 
    'Tag1',
    1000000,
    50000,
    1000,
    100,
    'ThumbnailLink1',
    'False',
    'False',
    'Description 1'
);

/* error, when inserting this row with title as null:

Error report -
SQL Error: ORA-21000: error number argument to raise_application_error of 20000 is out of range
*/

-- Query 9 
--Videos with Hashtags:
SELECT video_title, hashtags
FROM utube_analysis
WHERE hashtags IS NOT NULL
ORDER BY video_title
FETCH FIRST 10 ROWS ONLY;


/* Query 9 results 

VIDEO_TITLE                                                                                                                                                                                                                                                     HASHTAGS                                                                                                                                                                                                                                                       
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
$178 vs $12 Sundae: Pro Chef & Home Cook Swap Ingredients | Epicurious                                                                                                                                                                                          0                                                                                                                                                                                                                                                              
$6000 CLEAN Water Cooled Asus RTX 3090 Gaming PC!                                                                                                                                                                                                               0                                                                                                                                                                                                                                                              
0.0001% Chance Goals                                                                                                                                                                                                                                            0                                                                                                                                                                                                                                                              
10 Minute Fat Burning Morning Routine You Can Do Everyday                                                                                                                                                                                                       0                                                                                                                                                                                                                                                              
10 Most Advanced AI Robots in the World                                                                                                                                                                                                                         0                                                                                                                                                                                                                                                              
10 Roads You Would Never Want to Drive On                                                                                                                                                                                                                       0                                                                                                                                                                                                                                                              
10 Super Useful Gadgets Under ?250!                                                                                                                                                                                                                             1                                                                                                                                                                                                                                                              
10 Things Netflix Is Hiding About Pablo Escobar                                                                                                                                                                                                                 0                                                                                                                                                                                                                                                              
11 Ways You Can Overcome Fear & Anxiety                                                                                                                                                                                                                         0                                                                                                                                                                                                                                                              
11m LIVING MOBILE MUCH CHEAPER THAN NEW: Carol builds the TINYHOUSE LIVING MOBILE simply by herself                                                                                                                                                             1                                                                                                                                                                                                                                                              

10 rows selected. 


*/


-- Query 10 
--Count the number of videos uploaded by each creator with more than 1 million subscribers:

SELECT creator_name, COUNT(*) AS video_count
FROM utube_analysis
WHERE creator_name IN (
    SELECT youtuber
    FROM GlobalYoutubeStats
    WHERE subscribers > 1000000
)
GROUP BY creator_name;


/* Query 10 results 
no rows selected

*/

-- Query 11 
-- Identify the top 5 countries with the highest views in the last 30 days
select country, total_views from (SELECT country , SUM(video_views_for_last_30_days)  AS total_views
FROM GlobalYoutubeStats
GROUP BY country) order by total_views desc
FETCH FIRST 5 ROWS ONLY;

/* 

COUNTRY                                            TOTAL_VIEWS
-------------------------------------------------- -----------
Country200                                             4000000
Country199                                             3990000
Country198                                             3980000
Country197                                             3970000
Country196                                             3960000

*/

