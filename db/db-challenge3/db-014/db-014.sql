-- "以下の要件を満たした削除を行うこと
-- 　・削除されているユーザーのチャットルームとのリレーション(中間テーブル)の削除を行うこと
-- 　・トランザクションを考慮したSQL文になっていること"
BEGIN;

DELETE FROM
    join_histries
WHERE
    user_id IN(
        SELECT
            users.id
        FROM
            users
        WHERE
            users.is_deleted = 1
    );

COMMIT;
