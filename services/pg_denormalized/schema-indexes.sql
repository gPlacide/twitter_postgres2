CREATE INDEX tweets_small_hashtag_index ON tweets_jsonb USING GIN((data->'entities'->'hashtags'));
CREATE INDEX tweets_ext_hashtag_index ON tweets_jsonb USING GIN((data->'extended_tweet' ->'entities'->'hashtags'));
CREATE INDEX tweets_text_index ON tweets_jsonb USING GIN(to_tsvector('english',(data->>'text')));
CREATE INDEX tweets_ext_text_index ON tweets_jsonb USING GIN(to_tsvector('english',(data->'extended_tweet'->>'full_text')));
CREATE INDEX tweets_ext_text_index2 ON tweets_jsonb USING GIN((to_tsvector('english',coalesce(data->'extended_tweet'->>'full_text'))));
CREATE INDEX tweets_ext_text_lang_index ON tweets_jsonb USING gin(to_tsvector('english',COALESCE(data->'extended_tweet'->>'full_text', data->>'text'))) WHERE (data->>'lang'='en');
