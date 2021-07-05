/* 以下の要件を満たしてチャットルーム一覧を出力すること
 　・削除されたチャットルームは表示しない
 　・全てのカラムを表示すること。ただし、*は使用しないこと
 　・概要がダイレクトチャットで終わっている
 　・ファイル送信が許可されているときは「許可」、許可されていないときは「禁止」と表示
 　・チャットルームidの昇順で表示 */
SELECT
    id,
    name,
    infomation,
    CASE
        WHEN is_denied_send_file = 1 THEN '禁止'
        WHEN is_denied_send_file = 0 THEN '許可'
    END AS is_denied_send_file,
    is_chatroom_directchat,
    is_deleted,
    post_user_id,
    created_at,
    modified_user_id,
    modified_at
FROM
    chatrooms
WHERE
    is_deleted = 0
    AND infomation LIKE "%ダイレクトチャット"
ORDER BY
    id ASC;
