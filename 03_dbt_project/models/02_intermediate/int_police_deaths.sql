WITH staging AS (
    SELECT * FROM {{ ref('stg_police_deaths') }}
),

categories AS (
    SELECT * FROM {{ ref('cause_mapping') }}
),

joined AS (
    SELECT
        s.*,
        -- 'Other/Unknown' if seed data null or missing
        COALESCE(c.risk_category, 'Other/Unknown') AS risk_category,
        -- incident year vs.
        EXTRACT(YEAR FROM s.end_of_watch_date) AS incident_year,
        -- incident decade for violence percentages
        FLOOR(EXTRACT(YEAR FROM s.end_of_watch_date) / 10) * 10 AS incident_decade,
        -- day of week col to ensure correct day being used
        FORMAT_DATE('%A', s.end_of_watch_date) AS day_of_week_name
    FROM staging AS s
    LEFT JOIN categories AS c
        ON s.cause_raw = c.cause
)

SELECT * FROM joined