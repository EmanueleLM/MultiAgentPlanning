(define (problem itinerary-prob)
  (:domain itinerary)
  (:objects
    traveler - agent
    berlin warsaw bucharest - city
    day1 day2 day3 day4 day5 day6 - day
  )

  (:init
    ;; Day succession (discrete day model)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)

    ;; Direct flights available (hard constraints provided by flight_service)
    (direct berlin warsaw)
    (direct warsaw bucharest)

    ;; Starting location assumption (documented above): traveler in Berlin on day1
    (at traveler berlin day1)
  )

  ;; Goals encode the adjusted feasible per-day city occupancy (Berlin days1-2, Warsaw days3-4, Bucharest days5-6)
  ;; and the meeting on day5 (earliest allowed).
  (:goal
    (and
      (at traveler berlin day1)
      (at traveler berlin day2)
      (at traveler warsaw day3)
      (at traveler warsaw day4)
      (at traveler bucharest day5)
      (at traveler bucharest day6)
      (met day5)
    )
  )
)