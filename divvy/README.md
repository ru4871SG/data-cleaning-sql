 # BigQuery SQL Steps to Clean Divvy 2022 Bike Trip Data

Divvy Bike Trip Data: [https://divvybikes.com/system-data](https://divvybikes.com/system-data)

Download all the CSV monthly data from 2022, and import them to your BigQuery project. For this demonstration, I use the dataset name `divvy_case_study`. The January 2022 data is imported with the table name `divvy_tripdata_202201`, February 2022 data is imported with the table name `divvy_tripdata_202202`, and so on.

## 1_union_all.sql

This will combine all the imported tables into one big table with all the trip data from January 2022 to December 2022

## 2_sort_table.sql

This will sort the combined table by **started_at** column

## 3_create_ride_length_and_day_of_week.sql

This will create **ride_length** and **day_of_week** columns. **ride_length** is to calculate the time difference between **ended_at** and **started_at**. Meanwhile, **day_of_week** is to display the number that represents the day of the week

## 4._data_cleaning_1.sql

The first data cleaning step. This will eliminate "*", "(Temp)", and "- Charging" from both **start_station_name** and **end_station_name**

## 5_data_cleaning_2.sql

The second data cleaning step. It will trim any excess spaces from station names and member types, calculate the total ride duration in seconds, and filter out rides shorter than 60 seconds. This script will also filter incomplete or test data. Lastly, this script will ensure station names are in proper case. 

The end result is ordered by **started_at**