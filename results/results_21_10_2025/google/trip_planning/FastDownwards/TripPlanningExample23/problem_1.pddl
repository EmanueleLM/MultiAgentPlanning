(define (problem TripPlanningExample23-problem)
  (:domain TripPlanningExample23)
  (:objects
    london bucharest riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )
  (:init
    ;; starting location: day 1 in London
    (at london day1)

    ;; linear day ordering
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    ;; workshop allowed days (Riga workshop must be between day5 and day8 inclusive)
    (workshop-allowed day5)
    (workshop-allowed day6)
    (workshop-allowed day7)
    (workshop-allowed day8)
  )

  ;; Goal encodes the feasible 8-day itinerary derived above and enforces workshop attendance.
  ;; The goal requires that each day is assigned to a city in the required contiguous blocks:
  ;; - London 3 days, Bucharest 1 day, Riga 4 days, and workshop attended on an allowed Riga day.
  (:goal (and
    (at london day1)
    (at london day2)
    (at london day3)
    (at bucharest day4)
    (at riga day5)
    (at riga day6)
    (at riga day7)
    (at riga day8)
    (attended-workshop)
  ))
)