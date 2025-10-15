(define (problem meet-margaret-problem)
  (:domain multiagent-meet)
  (:objects
    planner margaret - agent
    union-square north-beach - location
    time0 time755 time765 time810 time817 - time
  )
  (:init
    (at planner union-square)
    (now time0)
    (margaret-present time765)
    (margaret-at north-beach)
    (= (total-cost) 0)
  )
  (:goal (and (met margaret)))
  (:metric minimize (total-cost))
)