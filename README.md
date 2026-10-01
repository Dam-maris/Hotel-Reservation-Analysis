# Hotel Reservation Analysis with SQL

Answering 15 business questions about hotel bookings using SQL on IBM Db2, completed during the Mentorness Data Analytics internship.

## Business problem
A hotel manager wants to know who is booking, when, what they choose and what they pay, so that pricing, staffing and promotions can be planned with data.

## Dataset
700 reservations. See [Data](Data/README.md) for the columns. The data is not included in this repo. All findings describe this sample only.

## Tools
SQL, IBM Db2, PowerPoint.

## Approach
1. Checked data quality first (duplicates, NULLs, impossible values, distinct categories): [Data Quality](The%20SQL%20Code/sql/01.%20Data%20Quality%20Checks.sql)
2. Answered 15 business questions using aggregations, filters, a CTE and a window function: [sql/02_business_questions.sql](The%20SQL%20Code/sql/02%20Business%20Questions.sql)
3. Summarised the results in a short deck: [presentation/Hotel_Reservation_SQL_Analysis.pdf](Presentation/Hotel_Reservation_SQL_Analysis.pdf)

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


## Limitations and next steps
- Small sample of 700 reservations.
- Cancellation analysis (rate by segment and by lead time) once Q9 is re-run with the real status values.
- A Power BI dashboard on top of these results.
