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
            primary key,
    dep_n     varchar,
    from_date date,
    to_date   date
);

alter table dept_emp
    owner to postgres;

create table dept_manager
(
    dept_no   varchar,
    emp_no    integer,
    from_date date,
    to_date   date
);

alter table dept_manager
    owner to postgres;

create table salaries
(
    emp_no    integer,
    salary    money,
    from_date date,
    to_date   date
);

alter table salaries
    owner to postgres;

create table titles
(
    emp_no    integer,
    title     varchar,
    from_date date,
    to_date   date
);

alter table titles
    owner to postgres;


