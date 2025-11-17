(define (problem select-and-meet-ronald)
  (:domain meeting-selection)
  (:objects
    s1 s2 - schedule
  )
  (:init
    (feasible s1)
    (feasible s2)
    (best s1)
    (choice-open)
  )
  (:goal (and
    (met-ronald)
    (selected s1)
    (best s1)
  ))
)