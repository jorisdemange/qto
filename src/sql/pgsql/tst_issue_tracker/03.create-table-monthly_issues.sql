-- DROP TABLE IF EXISTS monthly_issues ; 

SELECT 'create the "monthly_issues" table'
; 
   CREATE TABLE monthly_issues (
      id             integer NOT NULL PRIMARY KEY
    , level          integer NULL
    , prio           integer NULL
    , status         varchar (50) NOT NULL
    , category       varchar (200) NOT NULL
    , name           varchar (200) NOT NULL
    , description    varchar (4000)
    , start_time     text NULL
    , stop_time      text NULL
    , update_time    timestamp NOT NULL
    , updated_by     varchar (50) NULL
    , owner          varchar (50) NULL
    , parent_id      integer NULL 
    );


SELECT 'show the columns of the just created table'
; 

   SELECT attrelid::regclass, attnum, attname
   FROM   pg_attribute
   WHERE  attrelid = 'public.monthly_issues'::regclass
   AND    attnum > 0
   AND    NOT attisdropped
   ORDER  BY attnum
   ; 