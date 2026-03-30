# DataTalksClub Data Engineering Zoomcamp 2026 Final Project

## Problem Statement:
Using the [historical dataset of US police deaths](https://www.kaggle.com/datasets/mayureshkoli/police-deaths-in-usa-from-1791-to-2022/data?select=police_deaths_USA_v7.csv) from Kaggle, create a pipeline using many of the technologies covered in the zoomcampe in order to answer four primary questions for the dataset:
1. What is the breakdown of the causes of deaths for US law enforcement officers?
2. How has the risk profile of American law enforcement shifted over the years when comparing 'Intentional/Violent', 'Accidental/Environmental', and 'Medical' types of causes of deaths?
3. With the same death types categorization, has there been a pattern in the distribution of deaths across different days of the week?
4. What states have historically had the largest percetage of deaths that would categorized as 'Intentional/Violent'?

## Technologies used:
- Docker - containerization
- Terraform - infractructure as code
- GCP - cloud
  - Cloud Storage - data lake
  - BigQuery - data warehouse
- Kestra - orchestration
  - batch pipeline
- dbt - transformation
- Looker Studio - dashboard/presentation


## Reproducibility
- Using .env file as single source of truth
  - GCP_PROJECT_ID, GCP_DATASET, GCP_LOCATION, and LOCAL_GCP_CREDS_PATH
1. [Google Cloud Platform (GCP) Console](https://console.cloud.google.com/)
- Create a GCP Project
- Create Service Account with permissions using IAM & Admin
  - Create admin roles for Cloud Storage, BigQuery, and Compute Engine
- Create a GCS Bucket - will be used for raw CSV data

Steps:
1. Clone the repo
2. Create .env file with GCP_PROJECT_ID, GCP_DATASET, GCP_LOCATION, and LOCAL_GCP_CREDS_PATH
3. Create a .json file in project to contain GCP Service Account key
4. Set path in .env file to the GCP creds .json file
<!-- 5. Run `pip install -r requirements.txt` -->