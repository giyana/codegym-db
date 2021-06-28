CREATE TABLE users(
    id int(11) PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    password varchar(100) NOT NULL,
    work_phone_number char(13),
    mobile_phone_number char(13),
    comment varchar(1000),
    created_at datetime NOT NULL,
    modified datetime NOT NULL,
    is_deleted tinyint(1) DEFAULT 0 NOT NULL
);

CREATE TABLE chatrooms(
    id int(11) PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    infomation varchar(1000),
    is_denied_send_file tinyint(1) DEFAULT 0 NOT NULL,
    is_chatroom_directchat tinyint(1) DEFAULT 0 NOT NULL,
    created_at datetime NOT NULL,
    modified_at datetime NOT NULL,
    is_deleted tinyint(1) DEFAULT 0 NOT NULL,
    post_user_id int(11) NOT NULL REFERENCES users(id),
    modified_user_id int(11) NOT NULL REFERENCES users(id)
);

CREATE TABLE posts(
    id int(11) PRIMARY KEY AUTO_INCREMENT,
    message varchar(1000) NOT NULL,
    attached_file_name varchar(100),
    created_at datetime NOT NULL,
    modified_at datetime NOT NULL,
    is_deleted tinyint(1) DEFAULT 0 NOT NULL,
    chatroom_id int(11) NOT NULL REFERENCES chatrooms(id),
    post_user_id int(11) NOT NULL REFERENCES users(id),
    modified_user_id int(11) NOT NULL REFERENCES users(id)
);

CREATE TABLE tasks(
    id int(11) PRIMARY KEY AUTO_INCREMENT,
    infomation varchar(1000) NOT NULL,
    deadline_at datetime,
    is_completed tinyint(1) DEFAULT 0 NOT NULL,
    created_at datetime NOT NULL,
    modified_at datetime NOT NULL,
    is_deleted tinyint(1) DEFAULT 0 NOT NULL,
    post_user_id int(11) NOT NULL REFERENCES users(id),
    officer_user_id int(11) NOT NULL REFERENCES users(id),
    modified_user_id int(11) NOT NULL REFERENCES users(id),
    chatroom_id int(11) NOT NULL REFERENCES chatrooms(id)
);

CREATE TABLE join_histries(
    id int(11) PRIMARY KEY AUTO_INCREMENT,
    joined_at datetime NOT NULL,
    chatroom_id int(11) NOT NULL REFERENCES chatrooms(id),
    user_id int(11) NOT NULL REFERENCES users(id)
)
