(define (problem trip-problem)
  (:domain trip-domain)

  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 - day
  )

  (:init
    ;; day ordering
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)

    ;; mark the first day
    (first d1)

    ;; flight connectivity (direct flights only)
    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)
    ;; note: no direct flight between berlin and bucharest (intentionally omitted)

    ;; meeting requirements: meeting allowed on day 5 and day 6
    (meet_window d5)
    (meet_window d6)

    ;; meeting city: Bucharest
    (is_meet_city bucharest)

    ;; traveler hasn't started yet
    (unstarted)
  )

  (:goal (and
    ;; Must visit each city at least once
    (visited berlin)
    (visited warsaw)
    (visited bucharest)

    ;; Must meet friend (on a meet_window day while in Bucharest)
    (met_friend)

    ;; All days must be assigned a city (ensures the 6-day schedule is fully specified)
    (assigned d1)
    (assigned d2)
    (assigned d3)
    (assigned d4)
    (assigned d5)
    (assigned d6)
  ))
)