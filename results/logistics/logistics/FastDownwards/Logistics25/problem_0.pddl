(define (problem place-goals-A)
  (:domain multiagent_placement)
  (:objects
    agent1 agent2 - agent
    object_8 object_10 object_11 object_12 object_13 - object
    loc1 loc2 loc3 - location
  )

  (:init
    ;; Agents initial locations
    (at-agent agent1 loc2)
    (at-agent agent2 loc2)

    ;; Objects initial locations
    (at object_8 loc1)
    (at object_10 loc3)
    (at object_11 loc2)
    (at object_12 loc2)
    (at object_13 loc2)

    ;; Both agents have free hands initially
    (handfree agent1)
    (handfree agent2)

    ;; No 'next' relations initially
  )

  (:goal (and
    (next object_11 object_8)
    (next object_12 object_8)
    (next object_13 object_10)
  ))
)