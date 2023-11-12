alter table users
add column is_blocked boolean;

update users set is_blocked = false;