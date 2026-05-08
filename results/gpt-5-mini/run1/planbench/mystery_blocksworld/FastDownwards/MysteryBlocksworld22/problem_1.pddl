(define (problem multi_agent_crave_problem)
  (:domain multi_agent_crave)
  (:objects a b c d - obj)
  (:init
    (start)
  )
  (:goal
    (and
      (craves c a)
      (craves d b)
      (final_ca_done)
      (final_db_done)
    )
  )
)