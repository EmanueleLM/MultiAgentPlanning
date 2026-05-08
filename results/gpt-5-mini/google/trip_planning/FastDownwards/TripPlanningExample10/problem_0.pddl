(define (problem trip-9days)
  (:domain trip-planning)

  (:objects
    oslo dublin valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    ;; day successor chain (days 1..9)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    ;; direct-flight public network (only permitted direct legs)
    (flight_allowed oslo dublin)
    (flight_allowed dublin oslo)
    (flight_allowed dublin valencia)
    (flight_allowed valencia dublin)

    ;; canonical interpretation and integrated, conflict-free itinerary chosen:
    ;; - Start in Oslo on day1 and remain in Oslo days 1..3 (arrival day1, departure day4)
    ;; - Fly Oslo -> Dublin on day4 (arrive Dublin day4)
    ;; - Fly Dublin -> Valencia on day5 (arrive Valencia day5)
    ;; - Remain in Valencia days 5..8 (this satisfies relatives visit window which requires presence between day5 and day9 inclusive)
    ;; - Fly Valencia -> Dublin on day9 (arrive Dublin day9; trip ends in Dublin on day9)
    ;; Initial fact: present in Oslo on day1; the planner must use stay or flight actions to produce presence facts for subsequent days.
    (present oslo day1)
  )

  (:goal (and
    ;; enforce the canonical per-city visit durations/arrival/departure as chosen:
    ;; Oslo arrival day1, departure day4 -> present Oslo on days 1,2,3
    (present oslo day1)
    (present oslo day2)
    (present oslo day3)

    ;; Flight on day4 must place agent in Dublin on day4
    (present dublin day4)

    ;; Flight on day5 must place agent in Valencia on day5; remain in Valencia days 5..8
    (present valencia day5)
    (present valencia day6)
    (present valencia day7)
    (present valencia day8)

    ;; Outbound Valencia->Dublin on day9 arrives in Dublin on day9 (departure day9 means not in Valencia day9)
    (present dublin day9)
  ))
)