(define (problem select-and-meet-ronald)
  (:domain meeting-selection)
  (:objects
    s1 s2 s3 - schedule
  )
  (:init
    ; All audited schedules are feasible under the hard constraints
    (feasible s1)
    (feasible s2)
    (feasible s3)

    ; Exactly one schedule is marked as best based on audited data
    ; Equal durations (105) tie-broken by earliest feasible meeting with minimal idle time (S1)
    (best s1)

    ; Choice is initially open
    (choice-open)
  )
  (:goal (and
    (met-ronald)
    (selected s1)
    (best s1)
  ))
)