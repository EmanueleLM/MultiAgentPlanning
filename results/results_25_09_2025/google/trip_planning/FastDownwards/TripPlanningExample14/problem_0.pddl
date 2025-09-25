(define (problem trip-10-days)
  (:domain multiagent-itinerary)
  ;; Types of days (discrete time steps)
  (:objects
    lyon frankfurt krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ;; Day structure
    (day day1) (day day2) (day day3) (day day4) (day day5)
    (day day6) (day day7) (day day8) (day day9) (day day10)

    ;; Next-day relation
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9) (next day9 day10)

    ;; Direct flight connectivity (public / transport_agent info)
    (direct lyon frankfurt)
    (direct frankfurt lyon)    ;; flights are assumed bidirectional where agent stated connection
    (direct frankfurt krakow)
    (direct krakow frankfurt)

    ;; Initial location: start the trip in Lyon on day1.
    ;; This choice follows the itinerary preference to spend most time in Lyon.
    (at lyon day1)
  )

  ;; Goal: allocate the 10 days as requested by the itinerary_agent:
  ;; - spend 7 days in Lyon (days 1..7)
  ;; - spend 3 days in Krakow (days 8..10)
  ;; Note: itinerary_agent mentioned an optional visit to Frankfurt for 2 days.
  ;; Because the hard public constraint is total trip = 10 days and the only available
  ;; direct routes require going through Frankfurt to reach Krakow, the model keeps
  ;; stay actions and flight actions distinct and lets the planner decide whether to
  ;; spend any intervening days in Frankfurt. The formulated goal requires the day-wise
  ;; presence in Lyon and Krakow as below.
  (:goal (and
    (at lyon day1) (at lyon day2) (at lyon day3) (at lyon day4) (at lyon day5)
    (at lyon day6) (at lyon day7)
    (at krakow day8) (at krakow day9) (at krakow day10)
  ))