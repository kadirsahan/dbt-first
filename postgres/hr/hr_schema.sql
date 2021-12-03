set schema 'dbt_dev';

CREATE TABLE regions (
  region_id integer CONSTRAINT regions_id_nn NOT NULL,
  region_name VARCHAR(25)
);


CREATE UNIQUE INDEX reg_id_pk
ON regions (region_id);



CREATE TABLE countries (
  country_id CHAR(2) CONSTRAINT  country_id_nn NOT NULL,
  country_name VARCHAR(40),
  region_id integer,
  CONSTRAINT country_c_id_pk PRIMARY KEY (country_id)
);


CREATE TABLE locations (
  location_id    SMALLINT,
  street_address VARCHAR(40),
  postal_code    VARCHAR(12),
  city       VARCHAR(30) CONSTRAINT loc_city_nn  NOT NULL,
  state_province VARCHAR(25),
  country_id     CHAR(2)
);


CREATE UNIQUE INDEX loc_id_pk
ON locations (location_id);




CREATE TABLE departments (
  department_id    SMALLINT,
  department_name  VARCHAR(30) CONSTRAINT  dept_name_nn  NOT NULL,
  manager_id       INT,
  location_id      SMALLINT
);


CREATE UNIQUE INDEX dept_id_pk
ON departments (department_id) ;



CREATE TABLE jobs (
  job_id         VARCHAR(10),
  job_title      VARCHAR(35) CONSTRAINT job_title_nn  NOT NULL,
  min_salary     INT,
  max_salary     INT
);


CREATE UNIQUE INDEX job_id_pk
ON jobs (job_id) ;



CREATE TABLE employees (
  employee_id    INT,
  first_name     VARCHAR(20),
  last_name      VARCHAR(25) CONSTRAINT emp_last_name_nn  NOT NULL,
  email          VARCHAR(25) CONSTRAINT emp_email_nn  NOT NULL,
  phone_number   VARCHAR(20),
  hire_date      TIMESTAMP(0) CONSTRAINT emp_hire_date_nn  NOT NULL,
  job_id         VARCHAR(10) CONSTRAINT emp_job_nn  NOT NULL,
  salary         DECIMAL(8,2),
  commission_pct DECIMAL(2,2),
  manager_id     INT,
  department_id  SMALLINT,
  CONSTRAINT     emp_salary_min CHECK (salary > 0),
  CONSTRAINT     emp_email_uk UNIQUE (email)
);


CREATE UNIQUE INDEX emp_emp_id_pk
ON employees (employee_id);


CREATE TABLE job_history (
  employee_id   INT CONSTRAINT    jhist_employee_nn  NOT NULL,
  start_date    TIMESTAMP(0) CONSTRAINT    jhist_start_date_nn  NOT NULL,
  end_date      TIMESTAMP(0) CONSTRAINT    jhist_end_date_nn  NOT NULL,
  job_id        VARCHAR(10) CONSTRAINT    jhist_job_nn  NOT NULL,
  department_id SMALLINT,
  CONSTRAINT    jhist_date_interval CHECK (end_date > start_date)
);


CREATE UNIQUE INDEX jhist_emp_id_st_date_pk
ON job_history (employee_id, start_date);


