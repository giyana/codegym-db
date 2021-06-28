CREATE TABLE users(
    user_id int(11) PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    mail varchar(100) NOT NULL,
    pass varchar(100) NOT NULL,
    phone_number_work char(13),
    phone_number_home char(13),
    comment varchar(1000),
    created_at datetime NOT NULL,
    modified datetime NOT NULL,
    is_deleted tinyint(1) DEFAULT 0 NOT NULL
);

CREATE TABLE chatrooms(
    chatroom_id int(11) PRIMARY KEY AUTO_INCREMENT,
    chatroom_name varchar(100) NOT NULL,
    chatroom_info varchar(1000),
    is_allow_send_file tinyint(1) DEFAULT 0 NOT NULL,
    is_chatroom_directchat tinyint(1) DEFAULT 0 NOT NULL,
    created_at datetime NOT NULL,
    modified_at datetime NOT NULL,
    is_deleted tinyint(1) DEFAULT 0 NOT NULL,
    post_user_id int(11) NOT NULL REFERENCES users(user_id),
    modified_user_id int(11) NOT NULL REFERENCES users(user_id)
);

CREATE TABLE posts(
    post_id int(11) PRIMARY KEY AUTO_INCREMENT,
    message varchar(1000) NOT NULL,
    file_name varchar(100),
    created_at datetime NOT NULL,
    modified_at datetime NOT NULL,
    is_deleted tinyint(1) DEFAULT 0 NOT NULL,
    chatroom_id int(11) NOT NULL REFERENCES chatrooms(chatroom_id),
    post_user_id int(11) NOT NULL REFERENCES users(user_id),
    modified_user_id int(11) NOT NULL REFERENCES users(user_id)
);

CREATE TABLE tasks(
    task_id int(11) PRIMARY KEY AUTO_INCREMENT,
    task_info varchar(1000) NOT NULL,
    deadline_at datetime,
    is_completed tinyint(1) DEFAULT 0 NOT NULL,
    created_at datetime NOT NULL,
    modified_at datetime NOT NULL,
    is_deleted tinyint(1) DEFAULT 0 NOT NULL,
    post_user_id int(11) NOT NULL REFERENCES users(user_id),
    officer_user_id int(11) NOT NULL REFERENCES users(user_id),
    modified_user_id int(11) NOT NULL REFERENCES users(user_id),
    chatroom_id int(11) NOT NULL REFERENCES chatrooms(chatroom_id)
);

CREATE TABLE join_histries(
    id int(11) PRIMARY KEY AUTO_INCREMENT,
    joined_at datetime NOT NULL,
    chatroom_id int(11) NOT NULL REFERENCES chatrooms(chatroom_id),
    user_id int(11) NOT NULL REFERENCES users(user_id)
)
