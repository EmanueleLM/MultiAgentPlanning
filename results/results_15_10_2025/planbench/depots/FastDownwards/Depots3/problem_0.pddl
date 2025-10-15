(define (problem orchestrated-schedule-problem)
  (:domain orchestrated-scheduling)
  (:objects
    agent1 agent2 - agent
    s1 s2 s3 s4 - slot
  )

  (:init
    ;; Availability: no unavailable slot is marked free
    (free s1)
    (free s2)
    (free s4)
    (unavailable s3)

    ;; Resolved "earliest" preferences treated as hard constraints:
    ;; each agent may only book the slot marked earliest-for them
    (earliest-for agent1 s1)
    (earliest-for agent2 s2)
  )

  ;; Goals: each agent must have a booked slot (respecting earliest constraints)
  (:goal (and
    (booked s1 agent1)
    (booked s2 agent2)
  ))
)