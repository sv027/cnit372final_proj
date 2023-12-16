/*
Five flat tables were created based on pre-provided datasets. 
The table “GlobalYouTubeStats” table tracked global YouTube data. 
The table “utube_analysis” analyzed user interactions. 
The table “video_title” tracked data about various YouTube videos. 
The table “video_feedback” registered how users responded to different videos. 
The table “utubetrenddata” tracked information on trending YouTube content. 
*/
-- Table 1 

CREATE TABLE GlobalYoutubeStats (
    rank FLOAT,
    youtuber VARCHAR2(100),
    subscribers FLOAT,
    video_views FLOAT,
    category VARCHAR2(100),
    title VARCHAR2(255),
    uploads FLOAT,
    country VARCHAR2(50),
    abbreviation VARCHAR2(100),
    channel_type VARCHAR2(100),
    video_views_rank FLOAT,
    country_rank FLOAT,
    channel_type_rank FLOAT,
    video_views_for_last_30_days FLOAT,
    lowest_monthly_earnings FLOAT,
    highest_monthly_earnings FLOAT,
    lowest_yearly_earnings FLOAT,
    highest_yearly_earnings FLOAT,
    subscribers_for_last_30_days FLOAT,
    created_year DATE,
    created_month DATE,
    created_date DATE,
    gross_tertiary_education_enrollment FLOAT,
    population FLOAT,
    unemployment_rate FLOAT,
    urban_population FLOAT,
    latitude FLOAT,
    longitude FLOAT
);

--Data insert script for above table

INSERT INTO GlobalYoutubeStats (
    rank,
    youtuber,
    subscribers,
    video_views,
    category,
    title,
    uploads,
    country,
    abbreviation,
    channel_type,
    video_views_rank,
    country_rank,
    channel_type_rank,
    video_views_for_last_30_days,
    lowest_monthly_earnings,
    highest_monthly_earnings,
    lowest_yearly_earnings,
    highest_yearly_earnings,
    subscribers_for_last_30_days,
    created_year,
    created_month,
    created_date,
    gross_tertiary_education_enrollment,
    population,
    unemployment_rate,
    urban_population,
    latitude,
    longitude
)
SELECT
    ROWNUM,
    'Youtuber' || ROWNUM,
    1000000 + ROWNUM * 10000,
    50000000 + ROWNUM * 500000,
    'Category' || ROWNUM,
    'Title' || ROWNUM,
    100 + ROWNUM * 10,
    'Country' || ROWNUM,
    'ABR' || ROWNUM,
    'ChannelType' || ROWNUM,
    10 + ROWNUM,
    5 + ROWNUM,
    20 + ROWNUM,
    2000000 + ROWNUM * 10000,
    1000 + ROWNUM * 10,
    5000 + ROWNUM * 10,
    12000 + ROWNUM * 10,
    50000 + ROWNUM * 10000,
    100000 + ROWNUM * 1000,
    TO_DATE('2022-01-01', 'YYYY-MM-DD') + ROWNUM,
    TO_DATE('2022-01-01', 'YYYY-MM-DD') + ROWNUM,
    TO_DATE('2022-01-01', 'YYYY-MM-DD') + ROWNUM,
    50000 + ROWNUM * 1000,
    1000000 + ROWNUM * 10000,
    5.5 + ROWNUM * 0.1,
    800000 + ROWNUM * 10000,
    40.7128 + ROWNUM * 0.01,
    -74.0060 - ROWNUM * 0.01
FROM
    dual
CONNECT BY
    ROWNUM <= 200;

-- Committing the transaction
COMMIT;

// Table 2 
CREATE TABLE utube_analysis (
    video_link VARCHAR2(255),
    video_views FLOAT,
    video_title VARCHAR2(255),
    channel_url VARCHAR2(255),
    creator_name VARCHAR2(100),
    creator_gender VARCHAR2(10),
    total_channel_subscribers FLOAT,
    total_channel_views FLOAT,
    duration_of_video VARCHAR2(20),
    duration_in_seconds FLOAT,
    date_of_video_upload DATE,
    no_of_likes FLOAT,
    language_of_the_video VARCHAR2(50),
    subtitle VARCHAR2(5),
    video_description VARCHAR2(1000),
    hashtags VARCHAR2(255),
    no_of_comments FLOAT,
    date_of_last_comment DATE,
    max_quality_of_video VARCHAR2(20),
    no_of_videos_in_channel FLOAT,
    no_of_playlists FLOAT,
    premiered_or_not VARCHAR2(5),
    community_engagement FLOAT,
    intern_collector_name VARCHAR2(50)
);

-- Data for the above table was imported via csv file 

-- Table 3 

CREATE TABLE video_title (
    title VARCHAR2(255),
    video_id VARCHAR2(50),
    published_at DATE,
    keyword VARCHAR2(100),
    likes NUMBER,
    comments NUMBER,
    views NUMBER
);

-- Data for the above table was imported via csv file 

-- Table 4

CREATE TABLE video_feedback (
    video_id VARCHAR2(50),
    comments VARCHAR2(1000),
    likes number,
    senti VARCHAR2(50)
);

-- Insert creation script for above table
BEGIN
   FOR i IN 1..200 LOOP
      INSERT INTO video_feedback (video_id, comments, likes, senti)
      VALUES (
         'VideoID' || i,
         'This is comment number ' || i,
         i * 10,
         CASE WHEN MOD(i, 2) = 0 THEN 'Positive' ELSE 'Negative' END
      );
   END LOOP;
   COMMIT;
END;

-- Table 5 

CREATE TABLE utubetrenddata (
    video_id VARCHAR2(50),
    title VARCHAR2(255),
    publishedAt DATE,
    channelId VARCHAR2(50),
    channelTitle VARCHAR2(100),
    categoryId NUMBER,
    trending_date DATE,
    tags VARCHAR2(255),
    view_count NUMBER,
    likes NUMBER,
    dislikes NUMBER,
    comment_count NUMBER,
    thumbnail_link VARCHAR2(255),
    comments_disabled VARCHAR2(5),
    ratings_disabled VARCHAR2(5),
    description VARCHAR2(1000)
);
//Insert script for the above data

BEGIN
   FOR i IN 1..200 LOOP
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
      )
      VALUES (
         'VideoID' || i,
         'Video Title ' || i,
         TO_DATE('2022-01-01', 'YYYY-MM-DD') + i,
         'ChannelID' || i,
         'Channel Title ' || i,
         MOD(i, 10) + 1,  -- Assuming categoryId ranges from 1 to 10
         TO_DATE('2022-01-01', 'YYYY-MM-DD') + i,
         'Tag' || i,
         1000000 + i * 10000,
         50000 + i * 500,
         100 + i * 10,
         1000 + i,
         'ThumbnailLink' || i,
         CASE WHEN MOD(i, 2) = 0 THEN 'True' ELSE 'False' END,
         CASE WHEN MOD(i, 3) = 0 THEN 'True' ELSE 'False' END,
         'Description ' || i
      );
   END LOOP;
   COMMIT;
END;

