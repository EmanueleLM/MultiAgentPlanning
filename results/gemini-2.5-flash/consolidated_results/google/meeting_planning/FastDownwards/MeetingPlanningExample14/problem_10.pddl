(define (problem meeting-planning-14)
  (:domain meeting-schedule)
  (:objects
    T0 T11 T660 T780 - time-state
  )
  (:init
    (at nob-hill)
    (time-state-is T0) ; 9:00 AM start
  )
  (:goal
    (and
        (time-state-is T780) ; Ensures the plan finishes exactly at 10:00 PM
        (mary-met) ; Ensures the 120 minute meeting requirement is satisfied
    )
  )
)