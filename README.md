# Parks_and_Recreation — README

**Description**
This repository contains a sample MySQL database for a fictional *Parks_and_Recreation* application (seeded with characters from the TV show *Parks and Recreation*). It includes schema creation and sample data inserts for employees, salaries, and departments. The provided SQL file is `Beginner - Parks_and_Rec_Create_db - Copy.sql`. 

---

# Contents

* `Beginner - Parks_and_Rec_Create_db - Copy.sql` — SQL script that creates the `Parks_and_Recreation` database, tables, and inserts sample rows. 

---

# Quick start

1. Make sure you have MySQL (or MariaDB) installed.
2. From your shell run (adjust path / user as needed):

```bash
mysql -u <username> -p < "Beginner - Parks_and_Rec_Create_db - Copy.sql"
```

Or log into mysql and run:

```sql
SOURCE /full/path/to/Beginner - Parks_and_Rec_Create_db - Copy.sql;
```

The script will:

* drop `Parks_and_Recreation` if it exists,
* create the database,
* create tables,
* insert sample data. 

---

# Database schema (summary)

The SQL defines these tables:

## `employee_demographics`

* `employee_id` INT NOT NULL — **PK**
* `first_name` VARCHAR(50)
* `last_name` VARCHAR(50)
* `age` INT
* `gender` VARCHAR(10)
* `birth_date` DATE

## `employee_salary`

* `employee_id` INT NOT NULL
* `first_name` VARCHAR(50) NOT NULL
* `last_name` VARCHAR(50) NOT NULL
* `occupation` VARCHAR(50)
* `salary` INT
* `dept_id` INT

> Note: `employee_salary` currently duplicates first/last name fields (denormalized). There is no declared foreign key in the provided script between `employee_salary.employee_id` and `employee_demographics.employee_id` or between `employee_salary.dept_id` and `parks_departments.department_id` — you may want to add those constraints for integrity. 

## `parks_departments`

* `department_id` INT NOT NULL AUTO_INCREMENT — **PK**
* `department_name` VARCHAR(50) NOT NULL

---

# Sample rows / seed data (high level)

The dataset inserts characters such as Leslie Knope, Ron Swanson, Tom Haverford, April Ludgate, Jerry Gergich, Donna Meagle, Ann Perkins, Chris Traeger, Ben Wyatt, Andy Dwyer, Mark Brendanawicz, Craig Middlebrooks — both demographics and salary/occupation rows are present. Departments include: *Parks and Recreation*, *Animal Control*, *Public Works*, *Healthcare*, *Library*, *Finance*. 

---

# Useful queries

Get all employees with salary info (join demographic + salary):

```sql
SELECT d.employee_id, d.first_name, d.last_name, d.age, d.gender, s.occupation, s.salary, s.dept_id
FROM employee_demographics AS d
JOIN employee_salary AS s
  ON d.employee_id = s.employee_id;
```

List departments and counts of employees (uses dept_id from employee_salary):

```sql
SELECT p.department_id, p.department_name, COUNT(s.employee_id) AS employee_count
FROM parks_departments p
LEFT JOIN employee_salary s
  ON p.department_id = s.dept_id
GROUP BY p.department_id, p.department_name;
```

Average salary by department:

```sql
SELECT p.department_name, AVG(s.salary) AS avg_salary
FROM parks_departments p
JOIN employee_salary s
  ON p.department_id = s.dept_id
GROUP BY p.department_name;
```

Find employees older than 40:

```sql
SELECT employee_id, first_name, last_name, age, birth_date
FROM employee_demographics
WHERE age > 40;
```

Add foreign keys (example ALTERs to improve integrity):

```sql
ALTER TABLE employee_salary
  ADD CONSTRAINT fk_salary_employee
  FOREIGN KEY (employee_id)
  REFERENCES employee_demographics(employee_id);

ALTER TABLE employee_salary
  ADD CONSTRAINT fk_salary_department
  FOREIGN KEY (dept_id)
  REFERENCES parks_departments(department_id);
```

---

# Recommendations / Next steps

1. **Normalization**
   Remove duplicated `first_name`/`last_name` from `employee_salary` (keep them only in `employee_demographics`) and reference employees by `employee_id`. This avoids inconsistency.

2. **Foreign keys & constraints**
   Add foreign keys (see sample ALTER above) and appropriate `NOT NULL` constraints where needed.

3. **Indexes**
   Add indexes on `dept_id`, `employee_id` for faster joins and queries.

4. **Data types**
   Review `salary` as `DECIMAL(12,2)` if you expect cents or more precise money values. Consider `age` as derived from `birth_date` (and remove storing `age` to avoid stale data).

5. **ER diagram**
   Create a simple ER diagram showing:

   * `employee_demographics (PK employee_id)` — 1-to-1 or 1-to-many to `employee_salary` (depending on design)
   * `parks_departments (PK department_id)` — 1-to-many to `employee_salary` via `dept_id`

6. **Sample apps / tests**
   Build a small CRUD API or a couple of SQL scripts for reporting (payroll, headcount by dept) to exercise schema.

---

# Troubleshooting

* If `SOURCE` fails due to spaces in filename, wrap the path in quotes or rename the SQL file to remove spaces.
* If you get permission errors, connect as a MySQL user with CREATE/DROP privileges (e.g., `root` or appropriate DB admin).

---

# License & attribution

This is sample/demo data (fictionalized, based on a TV show). Use freely for learning / demos. No real PII involved.

---

If you want, I can:

* generate a ready-to-download `README.md` file,
* produce an improved SQL migration that adds foreign keys and normalizes employee data,
* or create an ER diagram (ASCII or image). Which would you like me to do next?
