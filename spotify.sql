-- Advance SQL Project-- Spotify datasets

-- create table
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);



select*
from spotify; 

-- EDA---
select count(*) from spotify;
select count (distinct artist) from spotify;
select count (distinct album) from spotify;
select distinct album_type from spotify;
select max(duration_min) from spotify;
select min(duration_min) from spotify;
select distinct channel from spotify;

select* from spotify
where duration_min = 0;

delete from spotify
where duration_min = 0;
select* from spotify
where duration_min = 0;


--Easy Level:
-- Q1 Retrieve the names of all tracks that have more than 1 billion streams
  select Title, Stream 
  from spotify where stream > 1000000000;
  
-- Q2 List all albums along with their respective artists.
select album, artist from spotify;

-- Q3 Get the total number of comments for tracks where licensed = TRUE.
select sum( comments ) as total_comments from spotify
where licensed = 'true';

-- Q4 Find all tracks that belong to the album type single.
select* from spotify
where album_type = 'single';

-- Q5 Count the total number of tracks by each artist.
     select artist, count(*) from spotify 
	 group by artist;


--Medium Level
-- Q6 Calculate the average danceability of tracks in each album.
     select album, avg(danceability) as avg_danceability
	 from spotify
	 group by 1 
	 order by 2 desc


-- Q7 Find the top 5 tracks with the highest energy values.
   select 
       track,
       avg (energy)
 from spotify
 group by 1
 order by 2 desc
 limit 5;
   
-- Q8 List all tracks along with their views and likes where official_video = TRUE.
      select 
	    track,
		sum(views) as total_views,
		sum(likes) as total_views
from spotify
where official_video = 'true'
group by 1
order by 2 desc
limit 5

--Q9 For each album, calculate the total views of all associated tracks.

     select 
	    album,
		track,
		sum(views)
	from spotify
	group by 1, 2
	order by 3 desc
	
--Q10 Retrieve the track names that have been streamed on Spotify more than YouTube.
       Select* from
	   (select
		 track,
		 --most_played_on,
		sum (case when most_played_on = 'youtube' then stream end),0) stream as streamed_on_youtube,
		sum (case when most_played_on = 'spotify' then stream end),0) stream as streamed_on_spotify
	from spotify
	group by 1
	) as t1
	Where 
	 streamed_on_spotify > streamed_on_youtube
	 and
	 streamed_on_youtube <> 0
		 
	

--Advanced Level
-- Q11 Find the top 3 most-viewed tracks for each artist using window functions.
--- each artists and total view for each track
--- track with highest view for each artist ( we need top)
--- dense rank
--- cte and filter rank <= 3
with ranking_artist as 
   (select artist, track, sum(views) as total_view,
	 Dense_rank() over(partition by artist order by sum(views) desc) as rank 
from spotify 
group by 1,2
order by 1,3 desc
	)
select* from ranking_artist 
where rank <= 3 

-- Q12 Write a query to find tracks where the liveness score is above the average.
    select track, artist, liveness from spotify 
	where liveness > (select avg(liveness) from spotify);
	

-- Q13 Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
with cte
as
(select album, 
   max(energy) as highest_energy,
   min (energy) as lowest_energy 
from spotify
group by 1
)
select 
    album,
	highest_energy - lowest_energy as energy
	from cte


--Q14 Find tracks where the energy-to-liveness ratio is greater than 1.2.
SELECT track, energy, liveness
FROM spotify
WHERE energy / liveness > 1.2;

--Q15 Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.
SELECT track, views, likes
FROM spotify
group by 1,2,3
order by 2 desc








