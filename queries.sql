--P1Q1
SELECT COUNT(tweet_id) FROM tweets; 

--P1Q2
SELECT users.user_lang, COUNT(tweets.tweet_id) AS No_Of_Tweets FROM tweets,users,tweets_users
WHERE tweets.tweet_id = tweets_users.tweet_id and
users.user_id = tweets_users.user_id
group by user_lang; 

--P1Q3
SELECT users.user_lang,
CAST(COUNT(tweets.tweet_id)as float)/ CAST((SELECT COUNT(tweet_id) FROM tweets)as float)
AS Fraction_Of_Tweets
FROM tweets,users,tweets_users
WHERE tweets.tweet_id = tweets_users.tweet_id and
users.user_id = tweets_users.user_id
group by user_lang;
	
--P2Q1
SELECT 
CAST((SELECT COUNT(tweet_id) FROM retweets)as float)
/CAST((SELECT COUNT(tweet_id) FROM tweets)as float) 
AS Fraction_Of_Retweets; 

--P2Q2
SELECT AVG(retweet_count) from tweets;

--P2Q3 
SELECT CAST((SELECT COUNT(tweet_id) FROM tweets WHERE retweet_count=0)as float)
/CAST((SELECT COUNT(tweet_id) FROM tweets)as float) 
AS Fraction_Of_Retweets_Never_Retweeted;

--P2Q4
SELECT (CAST((SELECT COUNT(tweet_id) FROM tweets where retweet_count <
CAST((SELECT AVG(retweet_count) from tweets as float)as float)
)as float) 
/CAST((SELECT COUNT(tweet_id) FROM tweets)as float))
AS tweets_retweeted_fewer_times;

--P3Q1
SELECT COUNT(DISTINCT hashtag) FROM hashtags;

--P3Q2
SELECT hashtag as Top_10_Hashtags, COUNT(*)
FROM hashtags
GROUP BY hashtag
ORDER BY COUNT(*) DESC limit 10;

--P3Q3
SELECT hashtag as Top_3_Hashtags, COUNT(hashtag)
FROM users,tweets,tweets_users,hashtags
WHERE tweets.tweet_id = tweets_users.tweet_id and 
users.user_id = tweets_users.user_id and
tweets.tweet_id = hashtags.tweet_id
GROUP BY hashtag
ORDER BY COUNT(*) DESC limit 3;

--P4Q1
SELECT(CAST((SELECT COUNT(tweet_id) FROM tweets)as float)-
CAST((SELECT COUNT(tweet_id) FROM tweetReplys)as float)) AS NorReply_NorReplied;
