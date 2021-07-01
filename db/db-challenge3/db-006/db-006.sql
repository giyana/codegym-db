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
