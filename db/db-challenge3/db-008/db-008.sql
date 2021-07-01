-- 以下の要件を満たして参加ルーム一覧を出力すること
-- 　・参加しているユーザー名、参加しているチャットルーム名、参加日時を表示すること
-- 　・参加日時は年月日のみ表示すること
-- 　・削除されているユーザー、削除されているチャットルームは表示しないこと

-- 　・参加日時の昇順で表示
SELECT
    user.name AS ユーザー名,
    chatrooms.id AS チャットルーム名,
    joined_at AS 参加日時
FROM
    user,chatrooms,join_histries
WHERE
    user.is_deleted = 0
    AND
    chatrooms.is_deleted = 0 
ORDER BY
    joined_at ASC
