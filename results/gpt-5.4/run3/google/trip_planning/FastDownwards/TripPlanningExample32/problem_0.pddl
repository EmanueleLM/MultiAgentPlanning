(define (problem european_trip_10_days_instance)
  (:domain european_trip_10_days)

  (:objects
    reykjavik riga paris - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day

    rv_1 rv_2 rv_3 rv_4 rv_5
    rg_1 rg_2 rg_3
    pr_1 pr_2 pr_3 pr_4 - visit_token
  )

  (:init
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)

    (direct_flight paris reykjavik)
    (direct_flight reykjavik paris)
    (direct_flight riga paris)
    (direct_flight paris riga)

    (token_available rv_1)
    (token_available rv_2)
    (token_available rv_3)
    (token_available rv_4)
    (token_available rv_5)
    (token_available rg_1)
    (token_available rg_2)
    (token_available rg_3)
    (token_available pr_1)
    (token_available pr_2)
    (token_available pr_3)
    (token_available pr_4)

    (token_of_city rv_1 reykjavik)
    (token_of_city rv_2 reykjavik)
    (token_of_city rv_3 reykjavik)
    (token_of_city rv_4 reykjavik)
    (token_of_city rv_5 reykjavik)

    (token_of_city rg_1 riga)
    (token_of_city rg_2 riga)
    (token_of_city rg_3 riga)

    (token_of_city pr_1 paris)
    (token_of_city pr_2 paris)
    (token_of_city pr_3 paris)
    (token_of_city pr_4 paris)
  )

  (:goal
    (and
      (schedule_complete)

      (day_assigned day_10)

      (at_on day_6 reykjavik)
      (at_on day_7 reykjavik)
      (at_on day_8 reykjavik)
      (at_on day_9 reykjavik)
      (at_on day_10 reykjavik)

      (token_used rv_1)
      (token_used rv_2)
      (token_used rv_3)
      (token_used rv_4)
      (token_used rv_5)

      (token_used rg_1)
      (token_used rg_2)
      (token_used rg_3)

      (token_used pr_1)
      (token_used pr_2)
      (token_used pr_3)
      (token_used pr_4)
    )
  )
)