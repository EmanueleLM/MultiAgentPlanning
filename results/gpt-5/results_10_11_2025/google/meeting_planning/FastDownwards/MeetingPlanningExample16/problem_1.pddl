(define (problem select-and-meet-ronald)
  (:domain meeting-selection)
  (:objects
    s1 s2 - schedule
  )
  (:init
    ; Both audited schedules are feasible under the hard constraints
    (feasible s1)
    (feasible s2)

    ; Exactly one schedule maximizes meeting duration and is marked best
    (best s1)

    ; Choice is initially open
    (choice-open)
  )
  (:goal (met-ronald))
)