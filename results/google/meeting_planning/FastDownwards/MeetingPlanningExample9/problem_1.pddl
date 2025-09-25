(define (problem meet-problem)
  (:domain meet-domain)
  (:objects
    traveler mary - agent
    union_square nob_hill - location
    t540 t549 t720 t729 t795 t804 - time
  )
  (:init
    (at traveler union_square)
    (time-is t540)
    (succ9 t540 t549)
    (succ9 t720 t729)
    (succ-wait t540 t720)
    (succ-wait t549 t720)
    (succ75 t720 t795)
    (succ75 t729 t804)
    (= (total-cost) 0)
  )
  (:goal (and (met)))
  (:metric minimize (total-cost))
)