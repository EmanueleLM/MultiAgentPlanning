(define (problem blocks-sequence-instance)
  (:domain blocks-world-sequence)
  (:objects
    a b c d e f g h table - block
    robot1 robot2 orchestrator - agent
  )

  (:init
    (on a c)
    (on c g)
    (on g table)
    (on b table)
    (on f b)
    (on h table)
    (on d h)
    (on e d)
    (clear a)
    (clear f)
    (clear e)
    (handempty robot1)
    (handempty robot2)
    (handempty orchestrator)
    (step0)
  )

  (:goal (and (step20)))
)