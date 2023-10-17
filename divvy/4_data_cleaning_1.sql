UPDATE `project-name.divvy_case_study.divvy_2022_precleaned`
SET start_station_name = REPLACE(REPLACE(REPLACE(start_station_name, '*', ''), '(Temp)', ''), '- Charging', '');

UPDATE `project-name.divvy_case_study.divvy_2022_precleaned`
SET end_station_name = REPLACE(REPLACE(REPLACE(end_station_name, '*', ''), '(Temp)', ''), '- Charging', '');
