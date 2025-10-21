(define (problem next-goal-a)
  (:domain multi-agent-next)
  (:objects
    agent1 agent2 - agent
    object_8 object_10 object_11 object_12 object_13 - object
  )
  (:init
    (handempty agent1)
    (handempty agent2)
    (ontable object_8)
    (ontable object_10)
    (ontable object_11)
    (ontable object_12)
    (ontable object_13)
  )
  (:goal (and
    (next object_11 object_8)
    (next object_12 object_8)
    (next object_13 object_10)
  ))
)