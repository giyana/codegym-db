-- "以下の要件を満たしてユーザー一覧を出力すること
-- 　・削除したユーザーも表示
-- 　・全てのカラムを表示すること。ただし、*は使用しないこと
-- 　・ユーザーidの昇順で表示"

SELECT
    id,
    email,
    password,
    name,
    comment,
    work_phone_number,
    mobile_phone_number,
    is_deleted,
    created_at,
    modified
FROM
    users
ORDER BY
    id ASC;
