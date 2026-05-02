# T-SQL Bootcamp 

No installation needed. Everything runs in your browser.

##  Getting Started

1. Click the green **Code** button → **Codespaces** → **Create codespace on main**
2. Wait ~3 minutes for setup to complete
3. Open any `.sql` file and press **Ctrl+Shift+E** to run a query

##  Connection Details (if prompted)

| Field | Value |
|---|---|
| Profile name | T-SQL Bootcamp DB|
| Server | `db` |
|Authentication | SQL Login|
| Database | `BootcampDB` |
| Username | `sa` |
| Password | `Bootcamp123!` |
| Trust certificate | Yes |


## If the connection fails, try this in the terminal:

```bash
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - && \
curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list && \
sudo apt-get update && \
sudo ACCEPT_EULA=Y apt-get install -y mssql-tools18 unixodbc-dev && \
/opt/mssql-tools18/bin/sqlcmd -S db -U sa -P 'Bootcamp123!' -C -i /workspaces/The-AI-Workshop-Bootcamp/seed.sql
```


## To sync your database with the latest tutor version, run this in the terminal:

```bash
git config pull.rebase false && git pull
```
Then this: 

```bash
/opt/mssql-tools18/bin/sqlcmd -S db -U sa -P 'Bootcamp123!' -C -i /workspaces/The-AI-Workshop-Bootcamp/seed.sql
```
Look at the top of your VS Code window — there should be a new tab open with a file called MERGE_MSG.
Click on that tab, then either:

Close the tab, press complete, or 
Press Ctrl+W to close it
##  Tips
- Stop your Codespace at **github.com/codespaces** after each session to save free hours
- Free tier = 60 hours/month — plenty for a weekly bootcamp


---

# SQL & AI Bootcamp — Week-by-Week Curriculum

## Week 1 — Orientation | Saturday, March 21, 2026
- Program introduction
- Development setup with GitHub Codespaces
- Team formation and collaboration

## Week 2 — Databases & the SQL Landscape | Saturday, March 28, 2026
- Database fundamentals
- Understanding metadata
- The role of SQL in modern data ecosystems

## Week 3 — SQL Foundations I | Saturday, April 4, 2026
- Core SQL syntax
- Writing basic queries
- Using AI as a learning and query-writing assistant

## Week 4 — SQL Foundations II | Saturday, April 11, 2026
- Advanced query patterns
- Deeper practice with AI-assisted SQL workflows

## Week 5 — Aggregation & Grouping | Saturday, April 18, 2026
- GROUP BY, aggregations, and summary analytics
- AI support for query optimization

## Week 6 — Filtering Data | Saturday, April 25, 2026
- WHERE, HAVING, and filtering strategies
- Building precise analytical queries

## Week 7 — Conditional Logic | Saturday, May 2, 2026 ✓ CURRENT
- CASE statements
- Transforming and categorizing data

## Week 8 — Joins | Saturday, May 9, 2026
- Inner, left, and multi-table joins
- Combining datasets effectively with AI support

## Week 9 — Subqueries & CTEs | Saturday, May 16, 2026
- Nested queries
- Common Table Expressions for modular SQL

## Week 10 — Introduction to Data Profiling | Saturday, May 23, 2026
- Understanding data distributions
- Detecting anomalies and patterns

## Week 11 — Profiling for Data Quality | Saturday, May 30, 2026
- Identifying missing values, duplicates, and inconsistencies
- Establishing data quality checks

## Week 12 — Window Functions | Saturday, June 6, 2026
- Ranking, running totals, and advanced analytics

## Week 13 — AI for Test & Validation Scripts | Saturday, June 13, 2026
- Automating SQL tests
- Using AI to generate validation checks

## Week 14 — AI for Query Reports & Documentation | Saturday, June 20, 2026
- Generating report documentation using AI
- Creating explainable analytics workflows
