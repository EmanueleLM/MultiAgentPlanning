(define (problem integrated_trip_problem)
  (:domain integrated_travel)

  (:objects
    berlin porto krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; Day successor chain encoding 11 days (10 transitions).
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)

    ;; Direct flights available (only direct flights are allowed).
    (direct berlin porto)
    (direct porto berlin)
    (direct krakow berlin)
    (direct berlin krakow)

    ;; City type markers used by conditional effects.
    (is-berlin berlin)
    (is-porto porto)
    (is-krakow krakow)

    ;; Public info: wedding in Porto between day10 and day11 -> must be at porto on day10.
    ;; The action travel_attend_wedding will be used at that state.
    ;; (wedding fact from an agent model is encoded implicitly by requiring being at porto day10)

    ;; Starting location: to make the integrated plan feasible within 11 days we start at Krakow on day1.
    ;; This lets the plan visit Krakow immediately (visited krakow true) and then proceed to Berlin for the
    ;; required Berlin stays and finally reach Porto for the wedding.
    (at krakow day1)

    ;; Mark Krakow already visited since we begin there.
    (visited krakow)

    ;; Numeric initializations.
    (= (berlin-stay-count) 0)
    (= (porto-days) 0)
    (= (trip-length) 11)
  )

  ;; Combined goals from the agents:
  ;; - Spend at least 6 Berlin "stay" increments (berlin agent uses berlin-stay-count)
  ;; - Stay in Porto at least 2 days (travel agent porto-days)
  ;; - Attend the wedding in Porto (travel agent)
  ;; - Visit all three cities at least once (trip agent visited)
  ;; - Be in Porto on day10 for the wedding (public requirement)
  (:goal (and
    (>= (berlin-stay-count) 6)
    (>= (porto-days) 2)
    (attended-wedding)
    (visited berlin)
    (visited porto)
    (visited krakow)
    (at porto day10)
  ))
)