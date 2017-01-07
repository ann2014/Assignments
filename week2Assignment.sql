/** Assignment 2 – SQL One to Many Relationships

1. Videos table. Create one table to keep track of the videos. This table should include a unique ID, the title of the video, the length in minutes, and the URL. 
Populate the table with at least three related videos from YouTube or other publicly available resources. */

DROP TABLE IF EXISTS videos;

CREATE TABLE videos
(
 video_id int PRIMARY KEY,
 video_title varchar(100) NOT NULL,
 length_min int(5) NULL,
 url varchar(1000) NULL
);

INSERT INTO videos(video_id, video_title, length_min, url)
  VALUES
  ('1', 'The Lobster', 133, 'https://www.youtube.com/watch?v=NnuBXGLcfqk&list=PLHPTxTxtC0ibCJB1vtN_-cwL5X-yPiPyO&feature=c4-overview-vl'),
  ('2', 'Criminal', 119, 'https://www.youtube.com/watch?v=84ZWoekLAKI&list=PLHPTxTxtC0ibCJB1vtN_-cwL5X-yPiPyO&index=7'),
  ('3', 'Hardcore Henry', 89, 'https://www.youtube.com/watch?v=H9ynIZekmew&list=PLHPTxTxtC0ibCJB1vtN_-cwL5X-yPiPyO&index=8')
;

SELECT * FROM videos;

/** 2. Create and populate reviewers table. Create a second table that provides at least two user reviews for each of at least two of the videos. These should be imaginary reviews that include columns for the user’s name (“Asher”, “Cyd”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review (“Loved it!”). There should be a column that links back to the ID column in the table of videos. */

DROP TABLE IF EXISTS reviewers;

CREATE TABLE reviewers
(
 reviewer_id int PRIMARY KEY,
 video_id int NULL REFERENCES videos,
 reviewer_name varchar(30) NULL,
 rating int NULL,
 review_text varchar(100) NULL
);


INSERT INTO reviewers
 (reviewer_id, video_id, reviewer_name, rating, review_text)
 VALUES
  (1, 1, 'Reg', 5, 'excellent!!!'),
  (2, 1, 'Jane', 1, 'For real?'),
  (3, 3, 'Mark', 5, 'I watched it 20 times!'),
  (4, 3, 'Twain', 4, 'Love to watch it again!')
;

SELECT * FROM reviewers;

/** 3. Report on Video Reviews. Write a JOIN statement that shows information from both tables. 
/** Which video received the highest rating? */

SELECT video_title, sum(rating) as score 
FROM videos v, reviewers r
WHERE v.video_id = r.video_id
group by video_title
order by sum(rating) desc
limit 1;

