\i bad-table-create.sql
SET CLIENT_ENCODING TO 'utf8';
\COPY bad_giant_table FROM bad_giant_table.csv csv

INSERT INTO tweets(tweet_id,created_at,text,retweet_count,tweet_source) SELECT tweet_id,created_at,text,retweet_count,tweet_source FROM bad_giant_table; 

INSERT INTO retweets(tweet_id,retweet_of_tweet_id) SELECT tweet_id,retweet_of_tweet_id FROM bad_giant_table WHERE retweet_of_tweet_id IS NOT NULL;

INSERT INTO tweetReplys(tweet_id,in_reply_to_screen_name,in_reply_to_status_id,in_reply_to_user_id) SELECT tweet_id,in_reply_to_screen_name,in_reply_to_status_id,in_reply_to_user_id FROM bad_giant_table WHERE in_reply_to_screen_name IS NOT NULL;

INSERT INTO hashtags(tweet_id,hashtag) SELECT tweet_id,hashtag1 FROM bad_giant_table
WHERE hashtag1 <> '';
INSERT INTO hashtags(tweet_id,hashtag) SELECT tweet_id,hashtag2 FROM bad_giant_table
WHERE hashtag2 <> '';
INSERT INTO hashtags(tweet_id,hashtag) SELECT tweet_id,hashtag3 FROM bad_giant_table
WHERE hashtag3 <> '';
INSERT INTO hashtags(tweet_id,hashtag) SELECT tweet_id,hashtag4 FROM bad_giant_table
WHERE hashtag4 <> '';
INSERT INTO hashtags(tweet_id,hashtag) SELECT tweet_id,hashtag5 FROM bad_giant_table
WHERE hashtag5 <> '';
INSERT INTO hashtags(tweet_id,hashtag) SELECT tweet_id,hashtag6 FROM bad_giant_table
WHERE hashtag6 <> '';

INSERT INTO users (user_id,user_name,user_screen_name,user_followers_count,user_friends_count,
user_lang,user_status_count,user_created_at) SELECT DISTINCT user_id,user_name,user_screen_name,
user_followers_count,user_friends_count, user_lang,user_status_count,user_created_at FROM
bad_giant_table WHERE user_status_count IS NOT NULL; 

INSERT INTO userlocations(user_id,user_location) SELECT user_id,user_location FROM
bad_giant_table WHERE user_location <> '';

INSERT INTO userTimeZones(user_id,user_time_zone,user_utc_offset) SELECT user_id,user_time_zone,user_utc_offset FROM
bad_giant_table WHERE user_time_zone IS NOT NULL ;

INSERT INTO userDesc(user_id,user_description) SELECT user_id,user_description FROM
bad_giant_table WHERE user_description <> '';

INSERT INTO tweets_users(user_id,tweet_id) SELECT user_id,tweet_id FROM
bad_giant_table;
