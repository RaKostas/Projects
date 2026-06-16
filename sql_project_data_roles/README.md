# Introduction
📊 Dive into the EU data job market! Focusing on data analyst roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics.

🔍 SQL queries? Check them out here: [project_sql folder](/sql_project_data_roles/)

# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs.


### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
Several key tools used:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
SELECT	
	job_id,
	job_title,
  job_title_short,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name
FROM
    job_postings_fact

LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

where
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
LIMIT 20;
```
Here's the breakdown of the top data analytics jobs in 2023:
- **Wide Salary Range:** Top 20 paying data analyst roles span from $165,000 to $200,000, indicating significant salary potential in the field.
- **Diverse Employers:** Companies like Bosch, Etsy, and WINGS-ICT-SOLUTIONS are among those offering high salaries, showing a broad interest across different industries.


### 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.
```sql

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
```
Here's the breakdown of the most demanded skills for the top 20 highest paying data analyst jobs in 2023:
- **SQL** is leading with a bold count of 14.
- **Azure** and **Spark** follows with a count of 8.
- **Python** is also highly sought after, with a bold count of 7.
Other skills like **Excel**, **PowerBI**, and **Tableau** show varying degrees of demand.


### 3. In-Demand Skills for Data Analysts

This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS skills_popularity
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location LIKE ANY(ARRAY['%Netherlands%','%Belgium%','%Austria%',
        '%Croatia%','%Cyprus%','%Czechia %','%Denmark%','%Estonia%','%Finland%',
        '%France%','%Germany%','%Greece%','%Ireland%','%Italy%','%Latvia%',
        '%Lithuania%','%Luxembourg%','%Poland%','%Portugal%','%Romania%','%Slovakia%',
        '%Spain%','%Slovenia%','%Sweden%'
    ]) 

GROUP BY
    skills
ORDER BY
    skills_popularity DESC
LIMIT 5;
```
Here's the breakdown of the most demanded skills for data analysts in 2023
- **SQL** remains the undisputed foundational skill, followed by **Python** as the leading programming language with 23,615 appearances.
- **Excel** remains highly essential, proving that traditional spreadsheet manipulation is still vital for everyday business roles.
- Visualization Tools like **Tableau**, and **Power BI** are also essential, solidifying the critical importance of turning complex data into visual insights.
  
| Skills   | Demand Count |
|----------|--------------|
| SQL      | 23615         |
| Python   | 16547         |
| Excel    | 14075         |
| Power BI | 11919         |
| Tableau  | 10429         |

*Table of the demand for the top 5 skills in data analyst job postings*

### 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying.
```sql
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
```
Here's a breakdown of the results for top paying skills for Data Analytics roles:
- High Demand for **Cloud & Infrastructure Skills**: Top salaries are associated with cloud and infrastructure technologies such as **Terraform**, **AWS**, **Docker**, and **Linux**, highlighting the growing value of analysts who can work with scalable data platforms and cloud environments.
- Strong Premium for Data Engineering Expertise: Skills like **Kafka**, **Spark**, **MongoDB**, **NoSQL**, and **BigQuery** command high salaries, reflecting the increasing importance of large-scale data processing and modern data architectures.
- Software Development skills (**C**, **Flask**, **Spring**, **Node.js**) boost earning potential, showing a growing overlap between analytics and engineering.
- DevOps tools (**GitLab**, **GitHub**, **Bash**) also appear frequently, indicating that automation and deployment knowledge are increasingly valuable for analysts.

| Skills        | Average Salary ($) |
|---------------|-------------------:|
|  C            |            200,000 |
| terraform     |            165,101 |
| mongo         |            165,000 |
| unify         |            163,782 |
| smartsheet    |            155,000 |
| linux         |            147,376 |
| nosql         |            145,313 |
| spring        |            140,905 |
| gitlab        |            126,441 |
| flask         |            126,040 |

*Table of the average salary for the top 10 paying skills for data analytics roles*

### 5. Most Optimal Skills to Learn

Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
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
```

| Skills     |Skills Demand | Average Salary ($) |
|------------|--------------|-------------------:|
| sql        | 174          |             93,155 |
| python     | 128          |             93,852 |
| tableau    | 93           |             93,852 |
| excel      | 78           |             78,207 |
| power bi   | 53           |             84,391 |
| R          | 49           |             91,636 |
| azure      | 43           |            108,679 |
| spark      | 36           |            111,551 |
| looker     | 34           |             98,792 |
| go         | 26           |             81,554 |

*Table of the most optimal skills for data analyst sorted by Skills Demand*

Here's a breakdown of the most optimal skills for Data Analysts in 2023: 
- **High-Demand Programming Languages**: **Python** and **SQL** emerge as the most in-demand programming languages, with demand counts of 128 and 174 respectively. Their average salaries are quite similar, at approximately $93,852 for Python and $93,155 for **SQL**, indicating that these are foundational skills in data-related roles. While **R** has a lower demand (49), it still offers a competitive average salary of $91,636, showing its continued relevance in more specialized analytical tasks.
- **Cloud Tools and Technologies:** Skills in cloud and big data technologies such as Azure and Spark show strong value in the market. Although their demand counts are moderate (43 for **Azure** and 36 for **Spark**), they command some of the highest average salaries in the table—$108,679 for **Azure** and $111,551 for **Spark**. This highlights the premium placed on expertise in scalable data processing and cloud-based infrastructure.
- **Business Intelligence and Visualization Tools:** Tableau, Power BI, and Looker play a key role in data visualization and decision-making. Tableau has relatively high demand (93) with an average salary of $93,852, while Power BI (53 demand) and Looker (34 demand) offer slightly lower and comparable salaries at $84,391 and $98,792 respectively. This indicates steady demand for professionals who can translate data into actionable insights.
- **Database Technologies:** Excel remains a widely used tool with a relatively high demand count of 78, though it has the lowest average salary in the table at $78,207. This suggests that while Excel is essential, it is often considered a baseline skill rather than a differentiating one. Additionally, niche programming languages like Go (26 demand, $81,554 average salary) show lower demand but can still offer solid compensation in specific use cases.



### Insights
From the analysis, several general insights emerged:

1. **Top-Paying Data Analyst Jobs**: The highest-paying jobs for data analystics roles that are located in EU offer a range of salaries, the highest at $200,000!
2. **Skills for Top-Paying Jobs**: High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.
3. **Most In-Demand Skills**: SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.
4. **Skills with Higher Salaries**: Specialized skills, such as Terraform and Mongo, are associated with the highest average salaries, indicating a premium on niche expertise.
5. **Optimal Skills for Job Market Value**: SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

