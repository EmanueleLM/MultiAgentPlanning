(define (problem meet-margaret-problem-classical)
  (:domain meeting-scheduling-classical)
  (:objects
    you margaret - agent
    marina-district pacific-heights - location
  )

  (:init
    (at you marina-district)
    (at margaret pacific-heights)
    (arrival-before-window)
    (marg-window-known)
    (window-long-enough)
    (assign (total-cost) 0)
  )

  (:goal (and
            (met-you-margaret)
         )
  )

  (:metric minimize (total-cost))
)