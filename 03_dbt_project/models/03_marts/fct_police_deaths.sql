WITH intermediate AS (
    SELECT * FROM {{ REF('int_police_deaths__categorized') }}
)

SELECT
    death_id,
    officer_name,
    rank,
    age,
    end_of_watch_date,
    incident_year,
    incident_decade,
    day_of_week_name,
    department,
    state,
    cause_raw,
    risk_category,
    -- Simple flag for easier filtering in your BI tool
    CASE 
        WHEN risk_category = 'Intentional/Violent' THEN 1 
        ELSE 0 
    END AS is_violent_death,
    weapon,
    offender_status,
    incident_summary
FROM intermediate