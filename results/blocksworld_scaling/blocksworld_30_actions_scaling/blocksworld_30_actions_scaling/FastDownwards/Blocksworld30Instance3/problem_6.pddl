(define (problem blocksworld30instance3_trace)
  (:domain blocksworld-trace-instance)
  (:objects
    a b c d e f g h i - block
    mover1 mover2 orchestrator - agent
  )
  (:init
    (on e a)
    (on b e)
    (ontable a)
    (on f d)
    (ontable d)
    (on i g)
    (on h i)
    (on c h)
    (ontable g)
    (clear b)
    (clear f)
    (clear c)
    (nooneholding)
    (step0)
  )
  (:goal (and (step30)))
)