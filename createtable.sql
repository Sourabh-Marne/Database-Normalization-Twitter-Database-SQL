CREATE TABLE tweets( 
    tweet_id bigint PRIMARY KEY,
    created_at timestamp with time zone NOT NULL,
    text varchar(255) NOT NULL,
	retweet_count int NOT NULL,
    tweet_source  varchar(255) NOT NULL
	);
	
	CREATE TABLE retweets( 
    tweet_id bigint,
    retweet_of_tweet_id bigint NOT NULL,
    FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id)
	);
	
	CREATE TABLE tweetReplys( 
    tweet_id bigint,
	in_reply_to_screen_name  varchar(255),
    in_reply_to_status_id    bigint,
    in_reply_to_user_id      bigint,
    FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id)
	);
	
	CREATE TABLE hashtags( 
    tweet_id bigint NOT NULL,
	hashtag varchar(144) NOT NULL,
    FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id)
	);
	
	CREATE TABLE users(
    user_id bigint PRIMARY KEY,
    user_name character varying(255),
    user_screen_name  character varying(255),
    user_followers_count integer,
    user_friends_count integer,
	user_lang character varying(10),
    user_status_count varchar(255),
    user_created_at timestamp with time zone
	);

	CREATE TABLE userLocations(
    user_id bigint NOT NULL,
    user_location character varying(255) NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(user_id)
	);

	CREATE TABLE userTimeZones(
    user_id bigint NOT NULL,
    user_time_zone character varying(127) NOT NULL,
	user_utc_offset integer,
	FOREIGN KEY (user_id) REFERENCES users(user_id)
	);
	
	CREATE TABLE userDesc(
    user_id bigint NOT NULL,
    user_description varchar(255) NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(user_id)
	);	

	CREATE TABLE tweets_users(
    user_id bigint NOT NULL,
    tweet_id bigint NOT NULL,
	FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
	);
