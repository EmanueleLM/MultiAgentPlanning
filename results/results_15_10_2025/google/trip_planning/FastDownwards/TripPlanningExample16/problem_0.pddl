; Problem instance: 9-day trip across Prague, Vienna, Porto
; Reconciliation note repeated: Porto requested 5 days (hard), but 9-day horizon prevents satisfying 3+3+5.
; This problem uses the feasible allocation Prague:3, Vienna:3, Porto:3 and therefore 3 Porto tokens only.
(define (problem trip-problem)
  (:domain trip-domain)

  (:objects
    ; cities
    prague vienna porto - city

    ; days
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day

    ; tokens (counts enforce max days per city)
    p1 p2 p3 - token   ; Prague tokens (3)
    v1 v2 v3 - token   ; Vienna tokens (3)
    o1 o2 o3 - token   ; Porto tokens (3) -- reduced from requested 5 to fit 9-day horizon
  )

  (:init
    ; day objects
    (day day1) (day day2) (day day3) (day day4) (day day5) (day day6) (day day7) (day day8) (day day9)

    ; next relations
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)

    ; all days initially free/unassigned
    (free-day day1) (free-day day2) (free-day day3) (free-day day4) (free-day day5)
    (free-day day6) (free-day day7) (free-day day8) (free-day day9)

    ; tokens available and token-of mapping
    (available p1) (available p2) (available p3)
    (token-of p1 prague) (token-of p2 prague) (token-of p3 prague)

    (available v1) (available v2) (available v3)
    (token-of v1 vienna) (token-of v2 vienna) (token-of v3 vienna)

    (available o1) (available o2) (available o3)
    (token-of o1 porto) (token-of o2 porto) (token-of o3 porto)

    ; direct flights (only direct flights allowed)
    (direct-flight prague vienna)
    (direct-flight vienna prague)
    (direct-flight vienna porto)
    (direct-flight porto vienna)

    ; workshop window (days 1..3)
    (window day1) (window day2) (window day3)
  )

  (:goal
    (and
      ; require that all days are assigned
      (assigned day1) (assigned day2) (assigned day3) (assigned day4) (assigned day5)
      (assigned day6) (assigned day7) (assigned day8) (assigned day9)

      ; require the workshop to be scheduled by having Prague assigned on at least one day in window
      (workshop-scheduled)
    )
  )
)