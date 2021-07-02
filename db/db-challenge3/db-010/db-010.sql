-- "以下の要件を満たした内容を出力すること
-- 　・ユーザー名、投稿日時、チャットルーム名を表示すること
-- 　・チャットルームidの昇順で表示"
-- 　・削除されているユーザーの投稿、削除されている投稿は含まないこと
-- 　・各チャットルームの最新の投稿をしたユーザー名と投稿日時を表示すること

SELECT users.name AS ユーザー名,chatrooms.name AS チャットルーム名,MAX(chatrooms.created_at) AS 投稿日時
FROM chatrooms
JOIN users
ON chatrooms.post_user_id = users.id
JOIN posts
ON chatrooms.id = posts.chatroom_id
WHERE posts.is_deleted = 0 AND users.is_deleted=0
GROUP BY chatrooms.id
ORDER BY chatrooms.id ASC;
