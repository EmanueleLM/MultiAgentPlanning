(define (problem orchestrated-schedule-problem)
  (:domain orchestrated-scheduling)
  (:objects
    agent1 agent2 - agent
    s1 s2 s3 s4 - slot
  )
  (:init
    (free s1)
    (free s2)
    (free s4)
    (unavailable s3)
    (earliest-for agent1 s1)
    (earliest-for agent2 s2)
  )
  (:goal (and
    (booked s1 agent1)
    (booked s2 agent2)
  ))
)