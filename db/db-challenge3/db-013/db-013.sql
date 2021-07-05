-- "以下の要件を満たした更新を行うこと
-- 　・以下の条件に合うユーザーの削除フラグをTrue(=1)にすること
-- 　　- 勤務先電話番号、携帯電話番号ともに登録していないユーザー
-- 　・更新日時が更新されること
-- 　・トランザクションを考慮したSQL文になっていること
-- ※ただし、勤務先電話番号、携帯電話番号はNULLと空文字の両方が入る事を考慮すること。"
BEGIN;

UPDATE
    users
SET
    is_deleted = 1,
    modified_at = NOW()
WHERE
    (
        (
            work_phone_number = ''
            OR work_phone_number IS NULL
        )
        AND (
            mobile_phone_number = ''
            OR mobile_phone_number IS NULL
        )
    );

COMMIT;
