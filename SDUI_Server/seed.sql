CREATE TABLE IF NOT EXISTS items (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL ,
    price float NOT NULL,
    description text default '',
    category text not null ,
    image text not null ,
    rate float not null ,
    count int not null default 0
);

CREATE TABLE IF NOT EXISTS users (
    uid uuid primary key default gen_random_uuid(),
    username TEXT not null,
    password TEXT not null 
)
