create table departments
(
    dept_no   integer not null
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
    hire_date  date,
    dept_no    integer
        constraint dept_no
            references departments
);

alter table employees
    owner to postgres;

create unique index employees_emp_no_uindex
    on employees (emp_no);

create table dept_emp
(
    emp_no  integer not null
        constraint dept_emp_emp_no_fkey
            references employees,
    dept_no integer not null
        constraint dept_emp_dept_no_fkey
            references public.departments,
    constraint dept_emp_pkey
        primary key (emp_no, dept_no)
);

alter table dept_emp
    owner to postgres;

create table dept_manager
(
    dept_no   integer not null
        constraint dept_manager_dept_no_fkey
            references departments,
    emp_no    integer not null
        constraint dept_manager_emp_no_fkey
            references employees,
    from_date date,
    to_date   date,
    constraint dept_manager_pkey
        primary key (dept_no, emp_no)
);

alter table dept_manager
    owner to postgres;

create table salaries
(
    emp_no    integer not null
        constraint salaries_pkey
            primary key
        constraint salaries_emp_no_fkey
            references employees,
    salary    integer,
    from_date date,
    to_date   date
);

alter table salaries
    owner to postgres;

create table titles
(
    titles_id serial not null
        constraint titles_pk
            primary key,
    emp_no    integer
        constraint titles_emp_no_fkey
            references employees,
    title     varchar,
    from_date date,
    to_date   date
);

alter table titles
    owner to postgres;

create unique index titles_titles_id_uindex
    on titles (titles_id);


