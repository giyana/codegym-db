-- "以下の要件を満たして参加ルーム一覧を出力すること
-- 　・参加しているユーザー名、参加しているチャットルーム名、参加日時を表示すること
-- 　・参加日時は年月日のみ表示すること
-- 　・削除されているユーザー、削除されているチャットルームは表示しないこと
-- 　・参加日時の昇順で表示"
SELECT
    users.name AS ユーザー名,
    chatrooms.name AS チャットルーム名,
    CAST(joined_at AS date) AS 参加日時
FROM
    join_histries
    LEFT JOIN users ON join_histries.user_id = users.id
    LEFT JOIN chatrooms ON join_histries.chatroom_id = chatrooms.id
WHERE
    users.is_deleted = 0
    AND chatrooms.is_deleted = 0
ORDER BY
    joined_at ASC;
