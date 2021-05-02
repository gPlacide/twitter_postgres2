CREATE INDEX tweet_tags_tag_index ON tweet_tags(tag, id_tweets);
CREATE INDEX tweets_text_index ON tweets USING GIN(to_tsvector('english',text));
CREATE INDEX tweet_tags_tag_tweets_index ON tweet_tags(id_tweets);
CREATE INDEX tweets_id_tweets_index2 ON tweets(id_tweets);
