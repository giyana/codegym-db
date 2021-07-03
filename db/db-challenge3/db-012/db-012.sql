-- "以下の要件を満たした更新を行うこと
-- 　・以下の条件に合うチャットルームのファイル送信許可を禁止(=0)にすること
-- 　　- ユーザー名admin(user_id=1)が参加していないチャットルームであること
-- 　　- 削除されていないチャットルームであること
-- 　・更新したユーザーはadmin(user_id=1)であること
-- 　・更新日時が更新されること
-- 　・トランザクションを考慮したSQL文になっていること"
BEGIN;

UPDATE
    chatrooms
SET
    is_denied_send_file = 0,
    modified_user_id = 1,
    modified_at = NOW()
WHERE
    chatrooms.id NOT IN (
        SELECT
            c.id
        FROM
            (
                -- #1093エラー避けのため内部にサブクエリ作成
                SELECT
                    *
                FROM
                    chatrooms
            ) AS c
            JOIN join_histries ON c.id = join_histries.chatroom_id
        WHERE
            join_histries.user_id = 1
    )
    AND is_deleted = 0;

COMMIT;
