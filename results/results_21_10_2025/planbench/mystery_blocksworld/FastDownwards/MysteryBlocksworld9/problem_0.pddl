(define (problem orchestrate-problem)
  (:domain orchestrated)
  (:objects
    object_6 object_7 object_8 object_9 object_10 object_11 - thing
    planner_one planner_two - agent
  )
  (:init
    ;; no initial 'next' relations; agents exist as objects (agents not used as preconditions here)
  )
  (:goal (and
    (next object_10 object_6)
    (next object_9 object_6)
    (next object_10 object_7)
    (next object_11 object_8)
  ))
)