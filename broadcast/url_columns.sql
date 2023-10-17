--fix facebook_url
UPDATE [dbo].[broadcast]
SET [facebook_url] = NULL
WHERE [facebook_url] NOT LIKE '%facebook%';

UPDATE [dbo].[broadcast]
SET [facebook_url] = REPLACE([facebook_url], 'http://', 'https://')
WHERE [facebook_url] LIKE 'http://%';

WITH CTE AS
(
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY facebook_url ORDER BY (SELECT NULL)) AS rn
    FROM dbo.broadcast
    WHERE facebook_url IS NOT NULL
)
DELETE FROM CTE WHERE rn > 1

-- only execute this once you are sure there is no malformed protocol in the facebook_url column 
UPDATE [dbo].[broadcast]
SET [facebook_url] = 'https://' + [facebook_url]
WHERE LEFT([facebook_url], 8) <> 'https://';


--fix linkedin_url
UPDATE [dbo].[broadcast]
SET [linkedin_url] = REPLACE([linkedin_url], 'http://', 'https://')
WHERE [linkedin_url] LIKE 'http://%';

UPDATE [dbo].[broadcast]
SET [linkedin_url] = REPLACE([linkedin_url], 'hhttps://', 'https://')
WHERE [linkedin_url] LIKE 'hhttps://%';

WITH CTE AS
(
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY linkedin_url ORDER BY (SELECT NULL)) AS rn
    FROM dbo.broadcast
    WHERE linkedin_url IS NOT NULL
)
DELETE FROM CTE WHERE rn > 1

-- only execute this once you are sure there is no malformed protocol in the linkedin_url column 
UPDATE [dbo].[broadcast]
SET [linkedin_url] = 'https://' + [linkedin_url]
WHERE LEFT([linkedin_url], 8) <> 'https://';


--fix other_url
UPDATE [dbo].[broadcast]
SET [other_url] = REPLACE([other_url], 'http://', 'https://')
WHERE [other_url] LIKE 'http://%';

WITH CTE AS
(
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY other_url ORDER BY (SELECT NULL)) AS rn
    FROM dbo.broadcast
    WHERE other_url IS NOT NULL
)
DELETE FROM CTE WHERE rn > 1

-- only execute this once you are sure there is no malformed protocol in the other_url column 
UPDATE [dbo].[broadcast]
SET [other_url] = 'https://' + [other_url]
WHERE LEFT([other_url], 8) <> 'https://';

						
--fix pinterest_url
UPDATE [dbo].[broadcast]
SET [pinterest_url] = REPLACE([pinterest_url], 'http://', 'https://')
WHERE [pinterest_url] LIKE 'http://%';

WITH CTE AS
(
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY pinterest_url ORDER BY (SELECT NULL)) AS rn
    FROM dbo.broadcast
    WHERE pinterest_url IS NOT NULL
)
DELETE FROM CTE WHERE rn > 1

-- only execute this once you are sure there is no malformed protocol in the pinterest_url column 
UPDATE [dbo].[broadcast]
SET [pinterest_url] = 'https://' + [pinterest_url]
WHERE LEFT([pinterest_url], 8) <> 'https://';


--fix twitter_url
UPDATE [dbo].[broadcast]
SET [twitter_url] = REPLACE([twitter_url], 'http://', 'https://')
WHERE [twitter_url] LIKE 'http://%';

WITH CTE AS
(
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY twitter_url ORDER BY (SELECT NULL)) AS rn
    FROM dbo.broadcast
    WHERE twitter_url IS NOT NULL
)
DELETE FROM CTE WHERE rn > 1

-- only execute this once you are sure there is no malformed protocol in the twitter_url column 
UPDATE [dbo].[broadcast]
SET [twitter_url] = 'https://' + [twitter_url]
WHERE LEFT([twitter_url], 8) <> 'https://';


--fix youtube_url
UPDATE [dbo].[broadcast]
SET [youtube_url] = REPLACE([youtube_url], 'http://', 'https://')
WHERE [youtube_url] LIKE 'http://%';

WITH CTE AS
(
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY youtube_url ORDER BY (SELECT NULL)) AS rn
    FROM dbo.broadcast
    WHERE youtube_url IS NOT NULL
)
DELETE FROM CTE WHERE rn > 1

-- only execute this once you are sure there is no malformed protocol in the youtube_url column 
UPDATE [dbo].[broadcast]
SET [youtube_url] = 'https://' + [youtube_url]
WHERE LEFT([youtube_url], 8) <> 'https://';


--fix website column
UPDATE [dbo].[broadcast]
SET [website] = REPLACE([website], 'http://', 'https://')
WHERE [website] LIKE 'http://%';

UPDATE [dbo].[broadcast]
SET [website] = REPLACE([website], 'hhttp://', 'https://')
WHERE [website] LIKE 'hhttp://%';

-- only execute this once you are sure there is no malformed protocol in the website column 
UPDATE [dbo].[broadcast]
SET [website] = 'https://' + [website]
WHERE LEFT([website], 8) <> 'https://';
