/*
- Most in-demand skills for data analysts in the EU area.
- Identify the top 5 in-demand skills for a data analyst.
*/

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

/*
Here's the breakdown of the most demanded skills for data analysts in 2023
SQL remains the undisputed foundational skill, followed by Python as the leading programming language with 23,615 appearances.
Excel remains highly essential, proving that traditional spreadsheet manipulation is still vital for everyday business roles.
Visualization Tools like Tableau, and Power BI are also essential, solidifying the critical importance of turning complex data into visual insights.

[
  {
    "skills": "sql",
    "skills_popularity": "23615"
  },
  {
    "skills": "python",
    "skills_popularity": "16547"
  },
  {
    "skills": "excel",
    "skills_popularity": "14075"
  },
  {
    "skills": "power bi",
    "skills_popularity": "11919"
  },
  {
    "skills": "tableau",
    "skills_popularity": "10429"
  }
]
*/
