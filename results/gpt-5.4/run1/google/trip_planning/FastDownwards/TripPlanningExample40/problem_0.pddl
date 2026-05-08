(define (problem european_trip_8_days_instance)
  (:domain european_trip_8_days)

  (:objects
    oslo reykjavik manchester - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
    o1 o2 o3 o4 o5 o6 r1 r2 m1 m2 - visit_token
  )

  (:init
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)

    (direct oslo reykjavik)
    (direct reykjavik oslo)
    (direct manchester oslo)
    (direct oslo manchester)

    (token_for_city o1 oslo)
    (token_for_city o2 oslo)
    (token_for_city o3 oslo)
    (token_for_city o4 oslo)
    (token_for_city o5 oslo)
    (token_for_city o6 oslo)
    (token_for_city r1 reykjavik)
    (token_for_city r2 reykjavik)
    (token_for_city m1 manchester)
    (token_for_city m2 manchester)

    (at manchester day1)
    (token_used m1)
  )

  (:goal
    (and
      (advanced_from day1)
      (advanced_from day2)
      (advanced_from day3)
      (advanced_from day4)
      (advanced_from day5)
      (advanced_from day6)
      (advanced_from day7)

      (at manchester day2)

      (token_used o1)
      (token_used o2)
      (token_used o3)
      (token_used o4)
      (token_used o5)
      (token_used o6)
      (token_used r1)
      (token_used r2)
      (token_used m1)
      (token_used m2)
    )
  )
)