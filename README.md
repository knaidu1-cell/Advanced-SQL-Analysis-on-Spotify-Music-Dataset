This project demonstrates advanced SQL techniques on a Spotify music dataset containing track, album, artist, and engagement metrics like streams, views, likes, and comments. The goal is to extract actionable insights about music performance, user engagement, and track characteristics.

Key Steps:

Data Ingestion and Cleaning:
Created a spotify table with 23 fields including artist, track, album, energy, danceability, and streams.
Performed exploratory analysis (count, distinct counts, min/max, null checks).
Cleaned the dataset by removing tracks with zero duration.


Exploratory Data Analysis (EDA):
Counted unique artists and albums, identified album types and channels.
Investigated track durations, streams, and engagement metrics.


Basic Queries:
Retrieved tracks with over 1 billion streams.
Listed albums with respective artists.
Counted tracks per artist and total comments for licensed tracks.
Filtered tracks by album type (single).


Intermediate Queries:
Calculated average danceability per album.
Identified top 5 tracks by energy.
Retrieved views and likes for official videos.
Summed total views per album.
Compared Spotify vs. YouTube streams per track.


Advanced Queries:
Used window functions and CTEs to rank tracks by views per artist.
Found tracks with liveness above the dataset average.
Calculated energy range per album.
Filtered tracks with energy-to-liveness ratio > 1.2.
Computed cumulative sum of likes ordered by views using window functions.

Technologies Used:

SQL (PostgreSQL)
Window functions, CTEs, aggregations, and conditional expressions for advanced analytics

Key Takeaways:

Gained hands-on experience performing complex SQL queries for music analytics.
Learned to combine aggregations, filtering, and window functions to generate actionable insights.
Developed a strong foundation in data cleaning, exploratory analysis, and performance optimization for large datasets
