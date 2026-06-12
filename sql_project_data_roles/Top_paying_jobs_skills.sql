/*
- Top skills required for the top-paying data analytics jobs in EU market.
*/

WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        job_location,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    
    WHERE
        job_location LIKE ANY(ARRAY['%Netherlands%','%Belgium%','%Austria%',
        '%Croatia%','%Cyprus%','%Czechia %','%Denmark%','%Estonia%','%Finland%',
        '%France%','%Germany%','%Greece%','%Ireland%','%Italy%','%Latvia%',
        '%Lithuania%','%Luxembourg%','%Poland%','%Portugal%','%Romania%','%Slovakia%',
        '%Spain%','%Slovenia%','%Sweden%'
        ]) AND
        job_title_short = 'Data Analyst' AND
        
	      salary_year_avg IS NOT NULL
	
    ORDER BY
        salary_year_avg DESC
    LIMIT 20
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
    ;





/*
Here's the breakdown of the most demanded skills for the top data analytics roles in 2023, based on job postings:
SQL is leading with a  count of 14.
Azure and Spark follows with a count of 8.
Python is also highly sought after, with a count of 7.


[
  {
    "job_id": 1202839,
    "job_title": "Technology Research Engineer for Power Semiconductors (f/m/div.)",
    "job_location": "Renningen, Germany",
    "salary_year_avg": "200000.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 1202839,
    "job_title": "Technology Research Engineer for Power Semiconductors (f/m/div.)",
    "job_location": "Renningen, Germany",
    "salary_year_avg": "200000.0",
    "company_name": "Bosch Group",
    "skills": "github"
  },
  {
    "job_id": 107183,
    "job_title": "Research Engineer (f/m/div.)",
    "job_location": "Hildesheim, Germany",
    "salary_year_avg": "200000.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 21632,
    "job_title": "Research Engineer - Physics (H/F)",
    "job_location": "Issy-les-Moulineaux, France",
    "salary_year_avg": "200000.0",
    "company_name": "Withings",
    "skills": "python"
  },
  {
    "job_id": 21632,
    "job_title": "Research Engineer - Physics (H/F)",
    "job_location": "Issy-les-Moulineaux, France",
    "salary_year_avg": "200000.0",
    "company_name": "Withings",
    "skills": "c"
  },
  {
    "job_id": 1426728,
    "job_title": "Research Engineer (partial work abroad)",
    "job_location": "Nea Smyrni, Greece",
    "salary_year_avg": "200000.0",
    "company_name": "WINGS-ICT-SOLUTIONS",
    "skills": "python"
  },
  {
    "job_id": 1426728,
    "job_title": "Research Engineer (partial work abroad)",
    "job_location": "Nea Smyrni, Greece",
    "salary_year_avg": "200000.0",
    "company_name": "WINGS-ICT-SOLUTIONS",
    "skills": "java"
  },
  {
    "job_id": 156108,
    "job_title": "Research Engineer for Security and Privacy  (f/m/div.)",
    "job_location": "Renningen, Germany",
    "salary_year_avg": "199675.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 156108,
    "job_title": "Research Engineer for Security and Privacy  (f/m/div.)",
    "job_location": "Renningen, Germany",
    "salary_year_avg": "199675.0",
    "company_name": "Bosch Group",
    "skills": "github"
  },
  {
    "job_id": 111632,
    "job_title": "Applied Scientist",
    "job_location": "Dublin, Ireland",
    "salary_year_avg": "194500.0",
    "company_name": "Etsy",
    "skills": "linux"
  },
  {
    "job_id": 111632,
    "job_title": "Applied Scientist",
    "job_location": "Dublin, Ireland",
    "salary_year_avg": "194500.0",
    "company_name": "Etsy",
    "skills": "git"
  },
  {
    "job_id": 24675,
    "job_title": "Staff Research Engineer",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "177283.0",
    "company_name": "ServiceNow",
    "skills": "nosql"
  },
  {
    "job_id": 24675,
    "job_title": "Staff Research Engineer",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "177283.0",
    "company_name": "ServiceNow",
    "skills": "azure"
  },
  {
    "job_id": 24675,
    "job_title": "Staff Research Engineer",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "177283.0",
    "company_name": "ServiceNow",
    "skills": "aws"
  },
  {
    "job_id": 24675,
    "job_title": "Staff Research Engineer",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "177283.0",
    "company_name": "ServiceNow",
    "skills": "spark"
  },
  {
    "job_id": 24675,
    "job_title": "Staff Research Engineer",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "177283.0",
    "company_name": "ServiceNow",
    "skills": "hadoop"
  },
  {
    "job_id": 20461,
    "job_title": "Head of Data Analytics (F/M/X)",
    "job_location": "Munich, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "PPRO",
    "skills": "python"
  },
  {
    "job_id": 20461,
    "job_title": "Head of Data Analytics (F/M/X)",
    "job_location": "Munich, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "PPRO",
    "skills": "nosql"
  },
  {
    "job_id": 20461,
    "job_title": "Head of Data Analytics (F/M/X)",
    "job_location": "Munich, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "PPRO",
    "skills": "bigquery"
  },
  {
    "job_id": 20461,
    "job_title": "Head of Data Analytics (F/M/X)",
    "job_location": "Munich, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "PPRO",
    "skills": "redshift"
  },
  {
    "job_id": 20461,
    "job_title": "Head of Data Analytics (F/M/X)",
    "job_location": "Munich, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "PPRO",
    "skills": "gcp"
  },
  {
    "job_id": 20461,
    "job_title": "Head of Data Analytics (F/M/X)",
    "job_location": "Munich, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "PPRO",
    "skills": "kafka"
  },
  {
    "job_id": 20461,
    "job_title": "Head of Data Analytics (F/M/X)",
    "job_location": "Munich, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "PPRO",
    "skills": "tableau"
  },
  {
    "job_id": 20461,
    "job_title": "Head of Data Analytics (F/M/X)",
    "job_location": "Munich, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "PPRO",
    "skills": "looker"
  },
  {
    "job_id": 20461,
    "job_title": "Head of Data Analytics (F/M/X)",
    "job_location": "Munich, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "PPRO",
    "skills": "terraform"
  },
  {
    "job_id": 59701,
    "job_title": "Head of Data Analytics",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "Volt.io",
    "skills": "sql"
  },
  {
    "job_id": 59701,
    "job_title": "Head of Data Analytics",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "Volt.io",
    "skills": "python"
  },
  {
    "job_id": 59701,
    "job_title": "Head of Data Analytics",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "Volt.io",
    "skills": "tableau"
  },
  {
    "job_id": 59701,
    "job_title": "Head of Data Analytics",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "Volt.io",
    "skills": "power bi"
  },
  {
    "job_id": 289123,
    "job_title": "Data Architect",
    "job_location": "Dublin, Ireland",
    "salary_year_avg": "165000.0",
    "company_name": "Version 1",
    "skills": "sql"
  },
  {
    "job_id": 289123,
    "job_title": "Data Architect",
    "job_location": "Dublin, Ireland",
    "salary_year_avg": "165000.0",
    "company_name": "Version 1",
    "skills": "sql server"
  },
  {
    "job_id": 289123,
    "job_title": "Data Architect",
    "job_location": "Dublin, Ireland",
    "salary_year_avg": "165000.0",
    "company_name": "Version 1",
    "skills": "azure"
  },
  {
    "job_id": 289123,
    "job_title": "Data Architect",
    "job_location": "Dublin, Ireland",
    "salary_year_avg": "165000.0",
    "company_name": "Version 1",
    "skills": "oracle"
  },
  {
    "job_id": 53650,
    "job_title": "Data Architect",
    "job_location": "Brussels, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Blue Harvest",
    "skills": "sql"
  },
  {
    "job_id": 53650,
    "job_title": "Data Architect",
    "job_location": "Brussels, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Blue Harvest",
    "skills": "nosql"
  },
  {
    "job_id": 53650,
    "job_title": "Data Architect",
    "job_location": "Brussels, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Blue Harvest",
    "skills": "scala"
  },
  {
    "job_id": 53650,
    "job_title": "Data Architect",
    "job_location": "Brussels, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Blue Harvest",
    "skills": "java"
  },
  {
    "job_id": 53650,
    "job_title": "Data Architect",
    "job_location": "Brussels, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Blue Harvest",
    "skills": "c#"
  },
  {
    "job_id": 53650,
    "job_title": "Data Architect",
    "job_location": "Brussels, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Blue Harvest",
    "skills": "azure"
  },
  {
    "job_id": 53650,
    "job_title": "Data Architect",
    "job_location": "Brussels, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Blue Harvest",
    "skills": "bigquery"
  },
  {
    "job_id": 53650,
    "job_title": "Data Architect",
    "job_location": "Brussels, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Blue Harvest",
    "skills": "spark"
  },
  {
    "job_id": 372823,
    "job_title": "Data Architect",
    "job_location": "Warsaw, Poland",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "sql"
  },
  {
    "job_id": 372823,
    "job_title": "Data Architect",
    "job_location": "Warsaw, Poland",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "python"
  },
  {
    "job_id": 372823,
    "job_title": "Data Architect",
    "job_location": "Warsaw, Poland",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "nosql"
  },
  {
    "job_id": 372823,
    "job_title": "Data Architect",
    "job_location": "Warsaw, Poland",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "mongo"
  },
  {
    "job_id": 372823,
    "job_title": "Data Architect",
    "job_location": "Warsaw, Poland",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "azure"
  },
  {
    "job_id": 372823,
    "job_title": "Data Architect",
    "job_location": "Warsaw, Poland",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "aws"
  },
  {
    "job_id": 372823,
    "job_title": "Data Architect",
    "job_location": "Warsaw, Poland",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 372823,
    "job_title": "Data Architect",
    "job_location": "Warsaw, Poland",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "hadoop"
  },
  {
    "job_id": 372823,
    "job_title": "Data Architect",
    "job_location": "Warsaw, Poland",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "linux"
  },
  {
    "job_id": 280829,
    "job_title": "Data Architect",
    "job_location": "Machelen, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Devoteam",
    "skills": "azure"
  },
  {
    "job_id": 280829,
    "job_title": "Data Architect",
    "job_location": "Machelen, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Devoteam",
    "skills": "databricks"
  },
  {
    "job_id": 280829,
    "job_title": "Data Architect",
    "job_location": "Machelen, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Devoteam",
    "skills": "aws"
  },
  {
    "job_id": 280829,
    "job_title": "Data Architect",
    "job_location": "Machelen, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Devoteam",
    "skills": "snowflake"
  },
  {
    "job_id": 280829,
    "job_title": "Data Architect",
    "job_location": "Machelen, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Devoteam",
    "skills": "gcp"
  },
  {
    "job_id": 280829,
    "job_title": "Data Architect",
    "job_location": "Machelen, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Devoteam",
    "skills": "spark"
  },
  {
    "job_id": 459655,
    "job_title": "Data Architect (M/F)",
    "job_location": "Aveiro, Portugal",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "databricks"
  },
  {
    "job_id": 459655,
    "job_title": "Data Architect (M/F)",
    "job_location": "Aveiro, Portugal",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 1109374,
    "job_title": "Data Architect Customer Data Management",
    "job_location": "Lisbon, Portugal",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "sap"
  },
  {
    "job_id": 155094,
    "job_title": "Data Architect",
    "job_location": "Machelen, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Devoteam",
    "skills": "sql"
  },
  {
    "job_id": 155094,
    "job_title": "Data Architect",
    "job_location": "Machelen, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Devoteam",
    "skills": "nosql"
  },
  {
    "job_id": 155094,
    "job_title": "Data Architect",
    "job_location": "Machelen, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Devoteam",
    "skills": "azure"
  },
  {
    "job_id": 155094,
    "job_title": "Data Architect",
    "job_location": "Machelen, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Devoteam",
    "skills": "aws"
  },
  {
    "job_id": 155094,
    "job_title": "Data Architect",
    "job_location": "Machelen, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Devoteam",
    "skills": "gcp"
  },
  {
    "job_id": 155094,
    "job_title": "Data Architect",
    "job_location": "Machelen, Belgium",
    "salary_year_avg": "165000.0",
    "company_name": "Devoteam",
    "skills": "flow"
  },
  {
    "job_id": 281069,
    "job_title": "Data Architect (Azure)",
    "job_location": "Finland",
    "salary_year_avg": "165000.0",
    "company_name": "Nortal",
    "skills": "go"
  },
  {
    "job_id": 281069,
    "job_title": "Data Architect (Azure)",
    "job_location": "Finland",
    "salary_year_avg": "165000.0",
    "company_name": "Nortal",
    "skills": "azure"
  },
  {
    "job_id": 931367,
    "job_title": "Data Architect (m/w/d)",
    "job_location": "Hamburg, Germany",
    "salary_year_avg": "165000.0",
    "company_name": "Datalogue GmbH",
    "skills": "sql"
  },
  {
    "job_id": 931367,
    "job_title": "Data Architect (m/w/d)",
    "job_location": "Hamburg, Germany",
    "salary_year_avg": "165000.0",
    "company_name": "Datalogue GmbH",
    "skills": "python"
  },
  {
    "job_id": 931367,
    "job_title": "Data Architect (m/w/d)",
    "job_location": "Hamburg, Germany",
    "salary_year_avg": "165000.0",
    "company_name": "Datalogue GmbH",
    "skills": "gcp"
  },
  {
    "job_id": 1000508,
    "job_title": "[Job-9587] Data Architect - Portugal",
    "job_location": "Portugal",
    "salary_year_avg": "165000.0",
    "company_name": "CI&T",
    "skills": "sql"
  },
  {
    "job_id": 1000508,
    "job_title": "[Job-9587] Data Architect - Portugal",
    "job_location": "Portugal",
    "salary_year_avg": "165000.0",
    "company_name": "CI&T",
    "skills": "python"
  },
  {
    "job_id": 1000508,
    "job_title": "[Job-9587] Data Architect - Portugal",
    "job_location": "Portugal",
    "salary_year_avg": "165000.0",
    "company_name": "CI&T",
    "skills": "sql server"
  },
  {
    "job_id": 1000508,
    "job_title": "[Job-9587] Data Architect - Portugal",
    "job_location": "Portugal",
    "salary_year_avg": "165000.0",
    "company_name": "CI&T",
    "skills": "azure"
  },
  {
    "job_id": 1000508,
    "job_title": "[Job-9587] Data Architect - Portugal",
    "job_location": "Portugal",
    "salary_year_avg": "165000.0",
    "company_name": "CI&T",
    "skills": "gdpr"
  },
  {
    "job_id": 1000508,
    "job_title": "[Job-9587] Data Architect - Portugal",
    "job_location": "Portugal",
    "salary_year_avg": "165000.0",
    "company_name": "CI&T",
    "skills": "git"
  }
]
*/
