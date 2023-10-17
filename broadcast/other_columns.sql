--remove duplicate rows based on a combination of three columns: email, first_name, and last_name.
WITH CTE AS
(
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY email, first_name, last_name ORDER BY (SELECT NULL)) AS rn
    FROM dbo.broadcast
    WHERE email IS NOT NULL AND first_name IS NOT NULL AND last_name IS NOT NULL
)
DELETE FROM CTE WHERE rn > 1;


-- fix contact_topic column
UPDATE [dbo].[broadcast]
SET contact_topic = NULL
WHERE contact_topic = '[]';

-- non-empty values in contact_topic look like this: ['Sustainable Development', 'Environment'],
-- so we should create another column without the JSON format. Let's call it contact_topic_2
ALTER TABLE [dbo].[broadcast]
ADD contact_topic_2 NVARCHAR(MAX);

UPDATE [dbo].[broadcast]
SET contact_topic_2 = REPLACE(REPLACE(REPLACE(contact_topic, '[', ''), ']', ''), '"', '')
WHERE contact_topic IS NOT NULL

UPDATE [dbo].[broadcast]
SET contact_topic_2 = REPLACE(REPLACE(contact_topic_2, '''', ''), '"', '')


-- fix outlet_topic column
UPDATE [dbo].[broadcast]
SET outlet_topic = NULL
WHERE outlet_topic = '[]';

-- non-empty values in outlet_topic look like this: ['Music', 'News', 'Pop Music'],
-- so we should create another column without the JSON format. Let's call it outlet_topic_2
ALTER TABLE [dbo].[broadcast]
ADD outlet_topic_2 NVARCHAR(MAX);

UPDATE [dbo].[broadcast]
SET outlet_topic_2 = REPLACE(REPLACE(REPLACE(outlet_topic, '[', ''), ']', ''), '"', '')
WHERE outlet_topic IS NOT NULL;

UPDATE [dbo].[broadcast]
SET outlet_topic_2 = REPLACE(REPLACE(outlet_topic_2, '''', ''), '"', '')


-- fix phone column
UPDATE [dbo].[broadcast]
SET phone = REPLACE(phone, '@', '')

UPDATE [dbo].[broadcast]
SET phone = REPLACE(phone, '++', '+')


-- fix twitter_name column
-- make sure we remove "www." only if it's in the beginning, not in the middle/at the end
UPDATE [dbo].[broadcast]
SET twitter_name = 
    CASE 
        WHEN PATINDEX('www.%', twitter_name) > 0 THEN 
            STUFF(twitter_name, 1, CHARINDEX('.', twitter_name), '') 
        ELSE 
            twitter_name 
    END;

--remove all "@" from twitter_name column
UPDATE [dbo].[broadcast]
SET twitter_name = REPLACE(twitter_name, '@', '')
--this will make sure we remove "#!/" if it's at the beginning, not in the middle/at the end
UPDATE [dbo].[broadcast]
SET twitter_name = 
    CASE 
        WHEN LEFT(twitter_name, 3) = '#!/' THEN 
            STUFF(twitter_name, 1, 3, '') 
        ELSE 
            twitter_name 
    END;
