WITH total_match AS (
    SELECT
        team_1 AS team,
        winner
    FROM
        icc_world_cup
    UNION ALL
    SELECT
        team_2 AS team,
        winner
    FROM
        icc_world_cup
)
SELECT
    team,
    COUNT(*)             AS total_match_played,
    SUM(
        CASE
            WHEN team = winner THEN
                1
            ELSE
                0
        END
    )                    AS win,
    SUM(
        CASE
            WHEN team <> winner THEN
                1
            ELSE
                0
        END
    )                    AS loss,
    round((SUM(
        CASE
            WHEN team = winner THEN
                1
            ELSE
                0
        END
    ) / COUNT(*)) * 100) AS win_percentage,
    ( SUM(
        CASE
            WHEN team = winner THEN
                1
            ELSE
                0
        END
    ) * 2 )              AS points
FROM
    total_match
GROUP BY
    team;