# Project Title
Self Learning DBT with Human Resources Data

## Project Type
*Self Learning*

## Content
- Create MySQL schema & tables
- Create sample data with MySQL
- Apply dbt to build data pipeline

## Operation System 
- macOS: Ventura 13.5.2

## Installation - DBT for MySQL

Please kindly refer to [official dbt setup page](https://docs.getdbt.com/docs/core/connect-data-platform/mysql-setup "Configuring dbt-mysql")

## Installation - MySQL

Please kindly refer to [official MySQL setup page](https://dev.mysql.com/doc/mysql-getting-started/en/)


## Instructions
### 1. Schema Setup
After MySQL is set up, run  `create_schema.sql` to create the schema and corresponding tables.

### 2. Data Loading
After the database schema and tables are set up, run  `hr_data.sql` to import the data.

### 3. Set up DBT project
- Start `terminal` on Mac
- Make a folder by typing `mkdir dbt-tutorial`
- Go to the folder by typing  `cd dbt-tutorial`
- Enter `dbt init`
- Enter `hr-data-with-dbt` as your `<project-name>`
- Enter the corresponding number below for your database engine. If you are using other database engine, you may need to install additional adapters. You may refer to [available-adapters](https://docs.getdbt.com/docs/available-adapters).
    - [1] mysql5
    - [2] mariadb
    - [3] mysql
- Done!

### 4. Check your dbt project folder structure
    ```
    .
    ├── logs
    └── hr-data-with-dbt (or your own <project-name>)
        ├── REMDME.md
        ├── dbt_project.yml
        ├── analyses
        ├── macros
        ├── models
        │   └── examples
        │       ├── my_first_dbt_model.sql
        │       ├── my_second_dbt_model.sql
        │       └── schema.yml
        ├── seeds
        ├── snapshots
        └── tests
    ```
- Remove the `examples` folder under `models` folder.

### 5. Set up your *profiles.yml* for DBT on your machine
- Go to the folder `.dbt` by typing `cd ~/.dbt`
- Copy the following to  `~/.dbt/profiles.yml`
    ```yml
    hr_data:
    target: dev
    outputs:
        dev:
        type: <your-db-engine> # 'mysql' for MySQL engine
        server: <your-db-server> # 'localhost' for using local mysql
        port: <your-server-port>
        schema: hr
        database: hr
        username: <your-db-username>
        password:  <your-db-password>
        prod:
        type: <your-db-engine> # 'mysql' for MySQL engine
        server: <your-db-server> # 'localhost' for using local mysql
        port: <your-server-port>
        schema: hr
        database: hr
        username: <your-db-username>
        password:  <your-db-password>
    ```

### 6. Set up your *dbt_project.yml* for DBT project
- Go to the project folder `hr-data-with-dbt`
- Copy the following to `dbt_project.yml`
    ```yml

    name: 'hr_dbt_example'
    version: '1.1.5'
    config-version: 2

    # set up the name for this profile
    profile: 'hr_data'

    # Tell DBT the path for your DBT model (means View or Table in standard SQL)
    model-paths: ["models"]
    # Tell DBT the path for your SQL tests
    test-paths: ["tests"]

    snapshot-paths: ["snapshots"]

    # Tell DBT the path to store the compiled SQL and tests
    target-path: "target"

    # Tell DBT what to clean when running dbt clean
    clean-targets:   
        - "target"
        - "dbt_packages"
    ```

### 7. Set up and Run models
- Copy all files under `hr-data-with-dbt/models`
- Explanation:
    - `source.yml`: It defines the data source structure. You may add tests for the sources.
    - `model.yml`: It defines the model structure. You may add tests for the model created.
    - `dim_country_1.sql` & `dim_employee_contact.sql`: They are just the SQL that you may want to run. You may add your own sql.
- Enter `dbt run` in `terminal`
    - Then you will see something similar to this
        ```
        00:11:57  Running with dbt=1.1.5
        00:11:57  Partial parse save file not found. Starting full parse.
        00:11:57  Found 2 models, 16 tests, 0 snapshots, 0 analyses, 173 macros, 0 operations, 0 seed files, 7 sources, 0 exposures, 0 metrics
        00:11:57  
        00:11:57  Concurrency: 1 threads (target='dev')
        00:11:57  
        00:11:57  1 of 2 START table model hr.dim_country_1 ...................................... [RUN]
        00:11:57  1 of 2 OK created table model hr.dim_country_1 ................................. [SUCCESS 8 in 0.12s]
        00:11:57  2 of 2 START view model hr.dim_employee_contact ................................ [RUN]
        00:11:57  2 of 2 OK created view model hr.dim_employee_contact ........................... [SUCCESS 0 in 0.05s]
        00:11:58  
        00:11:58  Finished running 1 table model, 1 view model in 0.25s.
        00:11:58  
        00:11:58  Completed successfully
        00:11:58  
        00:11:58  Done. PASS=2 WARN=0 ERROR=0 SKIP=0 TOTAL=2
        ```
- The model `dim_country_1` is created as `Table`, so you should be see it in your database as a new table named `dim_country_1`
- The model `dim_employee_contact` is created as `View`, so you should be see it in your database as a new view named `dim_employee_contact`

### 8. Set up *generic test* and run tests
- Create `generic` folder under `tests` folder
- Copy all files under `hr-data-with-dbt/tests`
- The file `assert_email.sql` checks if the value in the column follow email format.
- In `source.yml`, under `employees` table, you can apply the generic test as follow:
    ```
    51   - name: last_name
    52   - name: email
    53     tests:
    54      - assert_email  <--- Apply the generic test for column `email`
    55   - name: phone_number
    ```

### 9. More to add
:hammer:`Under Construction - To be added later`:hammer:

---

 If you want to give me some support, follow me now!  
 [LinkedIn](https://www.linkedin.com/in/anthonykwok073/) | 
 [Medium](https://medium.com/@kwokanthony) | 
 [Github](https://github.com/anthonynamnam) 
