# SQL College

College SQL exercises documenting my learning as an Information Systems student.

## Technologies and topics

MySQL, SQL, and MySQL Workbench. Topics include SELECT, WHERE, JOIN, GROUP BY, HAVING, aggregate functions, and subqueries.

## Current progress

The repository structure and exercise descriptions are ready. No original SQL solutions or database dumps were found in the inspected workspace or Downloads directory. All four SQL files are comment-only placeholders: no exercises are marked as completed, and no schema or sample data has been invented.

## Repository structure

```text
sql-college/
├── README.md
├── .gitignore
├── database/
│   ├── schema.sql
│   └── seed.sql
└── activities/
    ├── activity-12/
    │   ├── README.md
    │   └── solutions.sql
    └── activity-13/
        ├── README.md
        └── solutions.sql
```

## Activities

| Activity | Focus | Status |
| --- | --- | --- |
| [Activity 12](activities/activity-12/README.md) | Aggregation and JOINs | Awaiting original solutions |
| [Activity 13](activities/activity-13/README.md) | Subqueries | Awaiting original solutions |

## Database setup and execution

1. Install MySQL and MySQL Workbench and connect to a local learning server.
2. Obtain the original college database scripts. Review their database names and statements before execution.
3. Place the table definitions in [schema.sql](database/schema.sql) and the sample data in [seed.sql](database/seed.sql), preserving relationships, constraints, statement order, and any required session settings. Keep an original dump outside version control.
4. In Workbench, open and run the schema script first, then the seed script. Use a dedicated practice database and select it as the default schema.
5. Open an activity's `solutions.sql` and run each exercise separately once its original query is available.

The current placeholder scripts create no database, tables, or records and return no exercise results.

## Learning progress

This repository records practice and gradual improvement; it does not claim completed work where source files are missing. Add future activities under `activities/activity-N/` with a README and solutions file. Update the activity index as work progresses.

Preserve original solutions when adding them. For new queries, use uppercase SQL keywords, one SELECT column per line, consistent indentation, aligned JOIN and ON clauses, meaningful aliases, and indented subqueries. Separate exercises with comments.

Keep credentials, local connection settings, private data, and database backups out of Git. Review any original dump before publishing it.
