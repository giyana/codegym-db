-- "以下の要件を満たした内容を出力すること
-- 　・各チャットルームの投稿数、チャットルーム名を表示すること
-- 　・「投稿数」という名前で投稿数を表示すること
-- 　・削除されているユーザ－の投稿、削除されている投稿は含まないこと
-- 　・投稿数の降順で表示"
SELECT
    COUNT(*) AS 投稿数,
    chatrooms.name AS チャットルーム名
FROM
    posts
    LEFT JOIN users ON users.id = posts.post_user_id
    LEFT JOIN chatrooms ON chatrooms.id = posts.chatroom_id
WHERE
    posts.is_deleted = 0
    AND users.is_deleted = 0
GROUP BY
    chatroom_id
ORDER BY 投稿数 DESC;
