# Hotel Reservation Analysis with SQL

Answering 15 business questions about hotel bookings using SQL on IBM Db2, completed during the Mentorness Data Analytics internship.

## Business problem
A hotel manager wants to know who is booking, when, what they choose and what they pay, so that pricing, staffing and promotions can be planned with data.

## Dataset
700 reservations. See [data/README.md](data/README.md) for the columns. The data is not included in this repo. All findings describe this sample only.

## Tools
SQL, IBM Db2, PowerPoint.

## Approach
1. Checked data quality first (duplicates, NULLs, impossible values, distinct categories): [sql/01_data_quality_checks.sql](sql/01_data_quality_checks.sql)
2. Answered 15 business questions using aggregations, filters, a CTE and a window function: [sql/02_business_questions.sql](sql/02_business_questions.sql)
3. Summarised the results in a short deck: [presentation/Hotel_Reservation_SQL_Analysis.pdf](presentation/Hotel_Reservation_SQL_Analysis.pdf)

## Key findings
| Finding | Number |
|---|---|
| Meal Plan 1 is the most popular | 527 of 700 reservations (about 75%) |
| Room_Type 1 is the most booked room | 534 of 700 (about 76%) |
| Online is the main booking channel | 518 of 700 (about 74%) |
| Reservations including weekend nights | 383 of 700 (54.7%) |
| Lead time range | 0 to 443 days |
| Guests | 1,316 adults and 69 children (children about 5%) |
| Busiest month in 2018 | June, 84 reservations (January lowest, 26) |
| Average price per room, bookings with children | about 144.57 |
| Average price per room, Online segment | about 112.46 |

Bookings with children cost about 29% more per room than the online average.

## Lessons from revisiting this project
- The original Q9 filtered on `'Confirmed'` and returned 0. The value did not exist, so I now check distinct values before filtering.
- Db2 truncates averages of integer columns, so Q11 and Q13 now use `CAST`.
- `LIMIT 1` hid ties and margins, so Q2, Q5 and Q8 now show the full breakdown with percentages.

## Limitations and next steps
- Small sample of 700 reservations.
- Cancellation analysis (rate by segment and by lead time) once Q9 is re-run with the real status values.
- A Power BI dashboard on top of these results.

## How to run
1. Create the table in IBM Db2 and load the dataset.
2. Run `sql/01_data_quality_checks.sql`, then `sql/02_business_questions.sql`.

## About me
Damaris Nafula Barasa | LinkedIn: _add link_ | Portfolio: _add link_
