create table departments
(
    dept_no   varchar not null
        constraint departments_pk
            primary key,
    dept_name varchar
);

alter table departments
    owner to postgres;

create table employees
(
    emp_no     integer not null
        constraint employees_pk
            primary key,
    birth_date date,
    first_name varchar,
    last_name  varchar,
    gender     varchar,
    hire_date  date
);

alter table employees
    owner to postgres;

create table dept_emp
(
    emp_no    integer not null
        constraint dept_emp_pk
            primary key
        constraint dept_emp_employees__fk
            references employees,
    dept_no   varchar
        constraint dept_emp___fk
            references departments,
    from_date date,
    to_date   date
);

alter table dept_emp
    owner to postgres;

create table dept_manager
(
    dept_no         varchar
        constraint dept_manager___fk
            references departments,
    emp_no          integer
        constraint dept_manager_emp___fk
            references employees,
    from_date       date,
    to_date         date,
    dept_manager_id serial not null
        constraint dept_manager_pk
            primary key
);

alter table dept_manager
    owner to postgres;

create unique index dept_manager_dept_manager_id_uindex
    on dept_manager (dept_manager_id);

create table salaries
(
    emp_no    integer not null
        constraint salaries_pk
            primary key
        constraint salaries_emp___fk
            references employees,
    salary    money,
    from_date date,
    to_date   date
);

alter table salaries
    owner to postgres;

create table titles
(
    emp_no    integer
        constraint titles_emp___fk
            references employees,
    title     varchar,
    from_date date,
    to_date   date,
    titles_id serial not null
        constraint titles_pk
            primary key
);

alter table titles
    owner to postgres;

create unique index titles_titles_id_uindex
    on titles (titles_id);


