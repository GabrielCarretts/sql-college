# SQL College

My Information Systems coursework in MySQL, from creating related tables to querying project participation with subqueries. Each activity preserves the original SQL script and its comments.

## Activities

- [Activity 8 — Table design and data changes](activities/activity-8/README.md)
- [Activity 9 — Filtering and sorting](activities/activity-9/README.md)
- [Activity 10 — Employee and project JOINs](activities/activity-10/README.md)
- [Activity 11 — String and aggregate functions](activities/activity-11/README.md)
- [Activity 12 — Aggregation and JOINs](activities/activity-12/README.md)
- [Activity 13 — Subqueries](activities/activity-13/README.md)

## Projects

- [Biblioteca do Carlos — MySQL library case study](projects/biblioteca-carlos/README.md)

## Running the exercises

Use MySQL Workbench with a disposable local MySQL server. Each activity includes its own setup and sample data. **Warning:** The setup scripts drop and recreate their exercise databases, deleting any existing data in those databases. Activities 10 and 11 both recreate `atividade_10`. Activities 8, 9, 12 and 13 recreate their own exercise databases. Run the setup for the activity you are studying, then highlight one exercise at a time.

## Course database

The separate course dump is available as [schema.sql](database/schema.sql) and [seed.sql](database/seed.sql). Run them in order in the same session. The schema script drops and recreates atividade_12. Its sample projects differ from the activity 12 script, so use the activity's embedded data to reproduce that exercise.

## Learning progress

Activities 8–13 cover table constraints, data changes, SELECT, WHERE, JOIN, GROUP BY, HAVING, aggregate functions, and subqueries. Future activities follow the same numbered folder structure.
