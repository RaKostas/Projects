/*
 The most optimal skills to learn (aka it’s in high demand and a high-paying skill).
- Identify skills in high demand and associated with high average salaries for Data Analyst roles in EU.

*/


-- Identifies skills in high demand for Data Analyst roles
-- Option 1 with CTE

WITH skills_popularity  AS (
    SELECT
        skills_dim.skill_id,
        skills,
        COUNT(skills_job_dim.job_id) AS skills_demand
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_location LIKE ANY(ARRAY['%Netherlands%','%Belgium%','%Austria%',
        '%Croatia%','%Cyprus%','%Czechia %','%Denmark%','%Estonia%','%Finland%',
        '%France%','%Germany%','%Greece%','%Ireland%','%Italy%','%Latvia%',
        '%Lithuania%','%Luxembourg%','%Poland%','%Portugal%','%Romania%','%Slovakia%',
        '%Spain%','%Slovenia%','%Sweden%'])
    GROUP BY
        skills_dim.skill_id
), 
-- Skills with high average salaries for Data Analyst roles

average_salary AS (
    SELECT 
        skills_dim.skill_id,
        skills,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_location LIKE ANY(ARRAY['%Netherlands%','%Belgium%','%Austria%',
        '%Croatia%','%Cyprus%','%Czechia %','%Denmark%','%Estonia%','%Finland%',
        '%France%','%Germany%','%Greece%','%Ireland%','%Italy%','%Latvia%',
        '%Lithuania%','%Luxembourg%','%Poland%','%Portugal%','%Romania%','%Slovakia%',
        '%Spain%','%Slovenia%','%Sweden%'])
    GROUP BY
         skills_dim.skill_id
)
-- Return high demand and high salaries for 10 skills 
SELECT
     skills_popularity.skill_id,
     skills_popularity.skills,
     skills_demand,
     avg_salary
FROM
    skills_popularity
INNER JOIN  average_salary ON skills_popularity.skill_id = average_salary.skill_id

ORDER BY
     skills_demand DESC,
    avg_salary DESC
   
LIMIT 25;


-- OPTION 2
-- rewriting this same query more concisely
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS skills_demand,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location LIKE ANY(ARRAY['%Netherlands%','%Belgium%','%Austria%',
        '%Croatia%','%Cyprus%','%Czechia %','%Denmark%','%Estonia%','%Finland%',
        '%France%','%Germany%','%Greece%','%Ireland%','%Italy%','%Latvia%',
        '%Lithuania%','%Luxembourg%','%Poland%','%Portugal%','%Romania%','%Slovakia%',
        '%Spain%','%Slovenia%','%Sweden%'])
GROUP BY
    skills_dim.skill_id
ORDER BY
     skills_demand DESC,
    avg_salary DESC
LIMIT 25;

/*
Results 
Most high in demand skills are by far Python and SQL with avg yearly salary around 93000$,
while importand tool are still Tableu, Excel and PowerBi.

[
  {
    "skill_id": 0,
    "skills": "sql",
    "skills_demand": "174",
    "avg_salary": "93155"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "skills_demand": "128",
    "avg_salary": "93852"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "skills_demand": "93",
    "avg_salary": "88544"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "skills_demand": "78",
    "avg_salary": "78207"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "skills_demand": "53",
    "avg_salary": "84391"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "skills_demand": "49",
    "avg_salary": "91636"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "skills_demand": "43",
    "avg_salary": "108679"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "skills_demand": "36",
    "avg_salary": "111551"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "skills_demand": "34",
    "avg_salary": "98792"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "skills_demand": "26",
    "avg_salary": "81554"
  },
  {
    "skill_id": 189,
    "skills": "sap",
    "skills_demand": "24",
    "avg_salary": "93247"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "skills_demand": "22",
    "avg_salary": "113951"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "skills_demand": "20",
    "avg_salary": "105997"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "skills_demand": "17",
    "avg_salary": "74804"
  },
  {
    "skill_id": 22,
    "skills": "vba",
    "skills_demand": "16",
    "avg_salary": "83705"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "skills_demand": "15",
    "avg_salary": "99194"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "skills_demand": "14",
    "avg_salary": "114175"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "skills_demand": "14",
    "avg_salary": "98939"
  },
  {
    "skill_id": 210,
    "skills": "git",
    "skills_demand": "13",
    "avg_salary": "105590"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "skills_demand": "13",
    "avg_salary": "102784"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "skills_demand": "13",
    "avg_salary": "92446"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "skills_demand": "12",
    "avg_salary": "108746"
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "skills_demand": "12",
    "avg_salary": "107256"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "skills_demand": "12",
    "avg_salary": "88364"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "skills_demand": "12",
    "avg_salary": "85459"
  }
]
*/
