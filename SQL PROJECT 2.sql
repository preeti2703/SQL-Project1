use ig_clone;

-- 1. Find the 5 oldest users of the Instagram from the database provided--
select * from users;
select username,created_at from users
order by created_at limit 5;

-- 2. Find the users who have never posted a single photo on Instagram--
select * from photos,users;
select username from users u left join photos p on p.user_id = u.id
where p.image_url is null 
order by u.username;

-- 3.Identify the winner of content and provide their details to team--
select * from likes,photos,users;
select likes.photo_id,users.username,count(likes.user_id)as total_likes from likes 
inner join photos on likes.photo_id=photos.id
inner join users on photos.user_id=users.id
group by photo_id,username 
order by total_likes desc;

-- 4.Identify and suggest the top 5 most commenly used hashtags on the platform--
select * from photo_tags,tags ;
select t.tag_name,count(p.photo_id) as ht from photo_tags p 
inner join tags t on t.id= p.tag_id
group by t.tag_name
order by ht desc
limit 5;

-- 5.What day of week do most users register on? Provide insights on when to schedule an ad campaign--
select date_format((created_at),'%W') as day, count(username) from users 
group by 1
order by 2 desc;

-- 6.Provide how many time average user post on Instagram.
-- Also, provide the total number of photos on Instagram/total number of users 
select * from photos,users;
with base as(
select u.id as user_id,count(p.id)as photo_id from users u
left join photos p on p.user_id=u.id group by u.id)
select sum(photo_id) as total_photos,count(user_id) as total_users,sum(photo_id)/count(user_id) as photo_per_user
from base;

-- 7.Provide data on users (bots) who have liked every single photo on the site 
-- (since any normal user would not be able to do this).
select * from users,likes;
with base as(
select u.username,count(l.photo_id) as likess from likes l inner join users u on u.id=l.user_id
group by u.username)
select username,likess from base where likess=(select count(*) from photos)
 order by username ;