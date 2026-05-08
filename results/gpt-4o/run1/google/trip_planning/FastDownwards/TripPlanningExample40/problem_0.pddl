(define (problem european_trip_problem)
  (:domain european_trip)

  (:objects
    oslo reykjavik manchester - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    (at oslo day1)
    (flight_available oslo reykjavik)
    (flight_available manchester oslo)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
  )

  (:goal (and
    (at oslo day8)
    (attended_wedding day1)
    (forall (?day - day) (or
      (at oslo day1)
      (at oslo day2)
      (at oslo day3)
      (at oslo day4)
      (at oslo day5)
      (at oslo day6)
      (at reykjavik day7)
      (at reykjavik day8)
      (at manchester day1)
    ))
  ))
)