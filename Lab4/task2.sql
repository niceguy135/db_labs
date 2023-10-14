alter table professor
add column phone_number varchar(50)
constraint phone_number_check
check (phone_number ~* '^((\+7)|(8))\(\d{3}\)\d{3}-\d{2}-\d{2}$');