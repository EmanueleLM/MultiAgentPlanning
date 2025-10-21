(define (problem delivery-problem)
  (:domain multi-agent-delivery)

  (:objects
    planner_A planner_B - agent
    loc1 loc2 loc3 - location
    box1 box2 - object
  )

  (:init
    ; agent positions
    (at planner_A loc1)
    (at planner_B loc2)

    ; object positions
    (obj-at box1 loc1)
    (obj-at box2 loc2)

    ; connectivity (symmetric explicit connections)
    (connected loc1 loc2)
    (connected loc2 loc1)
    (connected loc2 loc3)
    (connected loc3 loc2)
    (connected loc1 loc3)
    (connected loc3 loc1)

    ; delivery destinations
    (goal-loc box1 loc3)
    (goal-loc box2 loc3)
  )

  (:goal (and
    (delivered box1)
    (delivered box2)
  ))
)