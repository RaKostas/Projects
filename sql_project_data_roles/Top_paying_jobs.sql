
/*
- Identify the top 10 highest-paying Data Analytics roles that are available in EU.
- Focuses on job postings with specified salaries (remove nulls)
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/


SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name
FROM
    job_postings_fact

LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

where
    job_location LIKE ANY(ARRAY['%Netherlands','%Belgium','%Austria%',
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


/*
RESULTS
=======
[
  
  {
    "job_id": 1202839,
    "job_title": "Technology Research Engineer for Power Semiconductors (f/m/div.)",
    "job_location": "Renningen, Germany",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-01-31 21:49:57",
    "company_name": "Bosch Group"
  },
  {
    "job_id": 107183,
    "job_title": "Research Engineer (f/m/div.)",
    "job_location": "Hildesheim, Germany",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-01-25 02:21:38",
    "company_name": "Bosch Group"
  },
  {
    "job_id": 21632,
    "job_title": "Research Engineer - Physics (H/F)",
    "job_location": "Issy-les-Moulineaux, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-02-01 09:52:36",
    "company_name": "Withings"
  },
  {
    "job_id": 1426728,
    "job_title": "Research Engineer (partial work abroad)",
    "job_location": "Nea Smyrni, Greece",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-01-31 02:28:39",
    "company_name": "WINGS-ICT-SOLUTIONS"
  },
  {
    "job_id": 156108,
    "job_title": "Research Engineer for Security and Privacy  (f/m/div.)",
    "job_location": "Renningen, Germany",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "199675.0",
    "job_posted_date": "2023-04-28 15:15:32",
    "company_name": "Bosch Group"
  },
  {
    "job_id": 111632,
    "job_title": "Applied Scientist",
    "job_location": "Dublin, Ireland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "194500.0",
    "job_posted_date": "2023-08-27 06:46:01",
    "company_name": "Etsy"
  },
  {
    "job_id": 1263109,
    "job_title": "Research Engineer* / Research Scientist* for Development of Radar...",
    "job_location": "Germany",
    "job_schedule_type": "Full-time and Part-time",
    "salary_year_avg": "179500.0",
    "job_posted_date": "2023-12-22 21:18:26",
    "company_name": "Fraunhofer-Gesellschaft"
  },
  {
    "job_id": 24675,
    "job_title": "Staff Research Engineer",
    "job_location": "Amsterdam, Netherlands",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-21 22:25:43",
    "company_name": "ServiceNow"
  },
  {
    "job_id": 20461,
    "job_title": "Head of Data Analytics (F/M/X)",
    "job_location": "Munich, Germany",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "166419.5",
    "job_posted_date": "2023-01-19 01:22:25",
    "company_name": "PPRO"
  },
  {
    "job_id": 59701,
    "job_title": "Head of Data Analytics",
    "job_location": "Berlin, Germany",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "166419.5",
    "job_posted_date": "2023-04-18 06:15:58",
    "company_name": "Volt.io"
  },
  {
    "job_id": 88304,
    "job_title": "Data Architect",
    "job_location": "Zaventem, Belgium",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-07-12 07:50:13",
    "company_name": "Devoteam"
  },
  {
    "job_id": 289123,
    "job_title": "Data Architect",
    "job_location": "Dublin, Ireland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-24 16:57:22",
    "company_name": "Version 1"
  },
  {
    "job_id": 1109374,
    "job_title": "Data Architect Customer Data Management",
    "job_location": "Lisbon, Portugal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-25 16:57:11",
    "company_name": "Bosch Group"
  },
  {
    "job_id": 931367,
    "job_title": "Data Architect (m/w/d)",
    "job_location": "Hamburg, Germany",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-07-08 15:11:21",
    "company_name": "Datalogue GmbH"
  },
  {
    "job_id": 280829,
    "job_title": "Data Architect",
    "job_location": "Machelen, Belgium",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-03 15:29:20",
    "company_name": "Devoteam"
  },
  {
    "job_id": 372823,
    "job_title": "Data Architect",
    "job_location": "Warsaw, Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 19:24:38",
    "company_name": "Bosch Group"
  },
  {
    "job_id": 34781,
    "job_title": "Data Architect (BN)",
    "job_location": "Warsaw, Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-20 02:03:12",
    "company_name": "Alter Solutions"
  },
  {
    "job_id": 155094,
    "job_title": "Data Architect",
    "job_location": "Machelen, Belgium",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-07-26 17:12:05",
    "company_name": "Devoteam"
  },
  {
    "job_id": 281069,
    "job_title": "Data Architect (Azure)",
    "job_location": "Finland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-23 12:39:36",
    "company_name": "Nortal"
  },
  {
    "job_id": 459655,
    "job_title": "Data Architect (M/F)",
    "job_location": "Aveiro, Portugal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-04-15 17:38:27",
    "company_name": "Bosch Group"
  }

]
*/

