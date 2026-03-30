
  
    

    create or replace table `zoomcamp-final-project-491003`.`proj_bq_dataset`.`fct_police_deaths`
      
    partition by date_trunc(end_of_watch_date, year)
    cluster by risk_category, state

    OPTIONS()
    as (
      

WITH intermediate AS (
    SELECT * FROM `zoomcamp-final-project-491003`.`proj_bq_dataset`.`int_police_deaths`
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
    -- boolean flag for BI tools
    CASE 
        WHEN risk_category = 'Intentional/Violent' THEN 1 
        ELSE 0 
    END AS is_violent_death,
    weapon,
    offender_status,
    incident_summary

FROM intermediate
    );
  