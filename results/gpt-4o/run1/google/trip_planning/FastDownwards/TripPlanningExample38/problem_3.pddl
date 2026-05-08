(define (problem european_trip_instance)
  (:domain european_trip)
  (:objects
    venice geneva madrid - city
    day_1 day_2 day_3 day_4 day_5 - day
  )

  (:init
    (at madrid day_1)
    (flight_available geneva madrid)
    (flight_available madrid venice)
    (conference_day day_4)
    (conference_day day_5)
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (not (visited geneva))
    (not (visited venice))
    (not (visited madrid))
    (planned venice day_4)
    (planned venice day_5)
  )

  (:goal (and
    (at venice day_4)
    (at venice day_5)
    (visited geneva)
    (visited venice)
    (visited madrid)
  ))
)