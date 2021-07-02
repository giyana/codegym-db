-- "以下の要件を満たした内容を出力すること
-- 　・ユーザー名、投稿日時、チャットルーム名を表示すること
-- 　・チャットルームidの昇順で表示"
-- 　・削除されているユーザーの投稿、削除されている投稿は含まないこと
-- 　・各チャットルームの最新の投稿をしたユーザー名と投稿日時を表示すること


SELECT
    users.name AS ユーザー名,
    posts.created_at AS 投稿日時,
    chatrooms.name AS チャットルーム名
FROM posts
LEFT JOIN users ON posts.post_user_id = users.id
LEFT JOIN chatrooms ON posts.chatroom_id = chatrooms.id


WHERE users.is_deleted = 0 AND posts.is_deleted = 0
ORDER BY chatrooms.id ASC;
