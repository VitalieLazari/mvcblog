create sequence hibernate_sequence start 1 increment 1;

create table comment
(
    id          int8 not null,
    content     varchar(2048),
    create_time timestamp,
    post_id     int8,
    user_id     int8,
    primary key (id)
);

create table post
(
    id          int8 not null,
    content     varchar(2048),
    create_time timestamp,
    title       varchar(128),
    update_time timestamp,
    status_id   int8,
    user_id     int8,
    primary key (id)
);

create table post_status
(
    id     int8 not null,
    status varchar(30),
    primary key (id)
);

create table user_role
(
    user_id int8 not null,
    roles   varchar(255)
);

create table user_status
(
    id     int8 not null,
    status varchar(30),
    primary key (id)
);

create table usr
(
    id         int8         not null,
    active     boolean      not null,
    email      varchar(60),
    first_name varchar(50),
    last_name  varchar(50),
    password   varchar(255) not null,
    username   varchar(50)  not null,
    status_id  int8,
    primary key (id)
);

alter table if exists comment
    add constraint comment_post_fk
        foreign key (post_id) references post;

alter table if exists comment
    add constraint comment_usr_fk
        foreign key (user_id) references usr;

alter table if exists post
    add constraint post_poststatus_fk
        foreign key (status_id) references post_status;

alter table if exists post
    add constraint post_usr_fk
        foreign key (user_id) references usr;

alter table if exists user_role
    add constraint userrole_usr_fk
        foreign key (user_id) references usr;

alter table if exists usr
    add constraint usr_userstatus_fk
        foreign key (status_id) references user_status;