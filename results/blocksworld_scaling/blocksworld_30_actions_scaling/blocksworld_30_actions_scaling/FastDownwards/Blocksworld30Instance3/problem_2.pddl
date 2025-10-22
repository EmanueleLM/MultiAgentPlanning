(define (problem Blocksworld30Instance3_trace)
  (:domain blocksworld-trace-instance)
  (:objects
    A B C D E F G H I - block
    mover1 mover2 orchestrator - agent
  )
  (:init
    (on E A)
    (on B E)
    (ontable A)
    (on F D)
    (ontable D)
    (on I G)
    (on H I)
    (on C H)
    (ontable G)
    (clear B)
    (clear F)
    (clear C)
    (nooneholding)
    (step0)
  )
  (:goal (and (step30)))
)