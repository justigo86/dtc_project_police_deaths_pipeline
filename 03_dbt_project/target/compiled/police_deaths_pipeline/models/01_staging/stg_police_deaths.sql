WITH source AS (
    SELECT * FROM `zoomcamp-final-project-491003`.`proj_bq_dataset`.`raw_police_deaths`
),

renamed AS (
    SELECT
        -- PK
        to_hex(md5(cast(coalesce(cast(Name as string), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(End_Of_Watch as string), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(Department as string), '_dbt_utils_surrogate_key_null_') as string))) AS death_id,
        
        -- core info
        CAST(Rank AS STRING) AS rank,
        CAST(Name AS STRING) AS officer_name,
        CAST(Age AS FLOAT64) AS age, 
        
        -- cast DATETIME to DATE for partitioning
        CAST(End_Of_Watch AS DATE) AS end_of_watch_date,
        
        CAST(Department AS STRING) AS department,
        CAST(State AS STRING) AS state,
        
        -- incidents
        CAST(Cause AS STRING) AS cause_raw,
        CAST(Weapon AS STRING) AS weapon,
        CAST(Offender AS STRING) AS offender_status,
        CAST(Summary AS STRING) AS incident_summary

    FROM source
)

SELECT * FROM renamed