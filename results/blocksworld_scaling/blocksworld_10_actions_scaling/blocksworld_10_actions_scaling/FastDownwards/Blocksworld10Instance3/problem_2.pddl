(define (problem Blocksworld10Instance3-problem)
  (:domain Blocksworld10Instance3)
  (:objects
    A B C D E F - block
    mover_alpha mover_beta orchestrator - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - step
  )

  (:init
    (on A E)
    (on E F)
    (on F D)
    (ontable B)
    (ontable C)
    (ontable D)
    (clear A)
    (clear B)
    (clear C)
    (handempty mover_alpha)
    (handempty mover_beta)
    (handempty orchestrator)
    (nobody-holding)
    (current s0)
  )

  (:goal (and (current s10)))
)