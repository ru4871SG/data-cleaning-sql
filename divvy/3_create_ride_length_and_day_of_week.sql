SELECT *,
    FORMAT("%02d:%02d:%02d",
        EXTRACT(HOUR FROM ride_length_preformatted),
        EXTRACT(MINUTE FROM ride_length_preformatted),
        EXTRACT(SECOND FROM ride_length_preformatted)) AS ride_length,
        EXTRACT(HOUR FROM ride_length_preformatted) AS hour,
        EXTRACT(MINUTE FROM ride_length_preformatted) AS minute,
        EXTRACT(SECOND FROM ride_length_preformatted) AS second,
    EXTRACT(DAYOFWEEK FROM started_at) AS day_of_week
FROM (
  SELECT *,
       ended_at - started_at AS ride_length_preformatted
  FROM `project-name.divvy_case_study.divvy_2022_full_sorted`
)
AS add_ride_length
ORDER BY ride_length

-- Save the result as a new BigQuery table "divvy_2022_precleaned"