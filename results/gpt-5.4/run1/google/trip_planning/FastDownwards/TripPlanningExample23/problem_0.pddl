(define (problem european_trip_8_days_instance)
  (:domain european_trip_8_days)

  (:objects
    london bucharest riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
    c0 c1 c2 c3 c4 - count
  )

  (:init
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)

    (direct london bucharest)
    (direct bucharest london)
    (direct bucharest riga)
    (direct riga bucharest)

    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)

    (workshop_window day5)
    (workshop_window day6)
    (workshop_window day7)
    (workshop_window day8)

    (current_day day1)

    (city_count london c0)
    (city_count bucharest c0)
    (city_count riga c0)
  )

  (:goal
    (and
      (trip_complete)
      (counted day8)
      (city_count london c3)
      (city_count bucharest c3)
      (city_count riga c4)
      (attended_workshop)
    )
  )
)