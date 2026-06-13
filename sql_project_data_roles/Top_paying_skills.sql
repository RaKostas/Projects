/*
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, in the EU area.

Helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
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
        '%Spain%','%Slovenia%','%Sweden%'
    ])
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/*
Here's a breakdown of the results for top paying skills for Data Analysts:
-High Demand for Cloud & Infrastructure Skills: Top salaries are associated with cloud and infrastructure technologies such as Terraform, AWS, Docker, and Linux, highlighting the growing value of analysts who can work with scalable data platforms and cloud environments.
-Strong Premium for Data Engineering Expertise: Skills like Kafka, Spark, MongoDB, NoSQL, and BigQuery command high salaries, reflecting the increasing importance of large-scale data processing and modern data architectures.
-Software Development skills (C, Flask, Spring, Node.js) boost earning potential, showing a growing overlap between analytics and engineering.
-DevOps tools (GitLab, GitHub, Bash) also appear frequently, indicating that automation and deployment knowledge are increasingly valuable for analysts.

Overall: The highest-paying Data Analyst roles favor professionals who combine analytics skills with data engineering, cloud, and software development expertise.

[
  {
    "skills": "c",
    "avg_salary": "200000"
  },
  {
    "skills": "terraform",
    "avg_salary": "165101"
  },
  {
    "skills": "mongo",
    "avg_salary": "165000"
  },
  {
    "skills": "unify",
    "avg_salary": "163782"
  },
  {
    "skills": "smartsheet",
    "avg_salary": "155000"
  },
  {
    "skills": "linux",
    "avg_salary": "147376"
  },
  {
    "skills": "nosql",
    "avg_salary": "145313"
  },
  {
    "skills": "spring",
    "avg_salary": "140905"
  },
  {
    "skills": "gitlab",
    "avg_salary": "126441"
  },
  {
    "skills": "flask",
    "avg_salary": "126040"
  },
  {
    "skills": "kafka",
    "avg_salary": "120615"
  },
  {
    "skills": "flow",
    "avg_salary": "114175"
  },
  {
    "skills": "aws",
    "avg_salary": "113951"
  },
  {
    "skills": "docker",
    "avg_salary": "112747"
  },
  {
    "skills": "github",
    "avg_salary": "111977"
  },
  {
    "skills": "spark",
    "avg_salary": "111551"
  },
  {
    "skills": "no-sql",
    "avg_salary": "111175"
  },
  {
    "skills": "angular",
    "avg_salary": "111175"
  },
  {
    "skills": "php",
    "avg_salary": "111175"
  },
  {
    "skills": "bash",
    "avg_salary": "111175"
  },
  {
    "skills": "node.js",
    "avg_salary": "111175"
  },
  {
    "skills": "npm",
    "avg_salary": "111175"
  },
  {
    "skills": "terminal",
    "avg_salary": "111175"
  },
  {
    "skills": "windows",
    "avg_salary": "108750"
  },
  {
    "skills": "bigquery",
    "avg_salary": "108746"
  }
]
*/
